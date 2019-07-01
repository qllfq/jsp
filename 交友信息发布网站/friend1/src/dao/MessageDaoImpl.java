package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.JdbcUtil;
import mybean.data.Input;
import mybean.data.MemberInform;
import mybean.data.Page;

public class MessageDaoImpl implements MessageDao{
	@Override
	public Page<Input> findMember(Input searchModel,int pageNum,int pageSize){
		List<Input> allMemberInform = getAllMemberInform(searchModel);
		Page<Input> page = new Page<Input>(pageNum,pageSize,allMemberInform);
		return page;
	}
	private List<Input> getAllMemberInform(Input searchModel){
		List<Input> result = new ArrayList<Input>();
		List<Object> paramList = new ArrayList<Object>();
		String logname = searchModel.getLogname();
		int type  = searchModel.getType();
		StringBuilder sql = new StringBuilder("select * from msg where 1=1");
//		如果选择查看所有留言，type是1，如果查看自己的留言，type没有值默认值是0,按时间倒叙排列
		if(type!=0){
			sql.append(" and type=? order by nowtime desc");
			paramList.add(type);
		}else{
			sql.append(" and logname=? order by nowtime desc");
			paramList.add(logname);
		}
		JdbcUtil jdbcUtil = null;
		try{
			jdbcUtil = new JdbcUtil();
			jdbcUtil.getConnection();
			List<Map<String,Object>> mapList = jdbcUtil.findResult(sql.toString(), paramList);
			if(mapList != null){
				for(Map<String,Object> map:mapList){
					
					Input input = new Input(map);
					result.add(input);
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new RuntimeException("查询所有数据异常",e);
			
		}finally{
			if(jdbcUtil != null){
				jdbcUtil.releaseConn();
			}
		}
		
		
		return result;
	}
}
