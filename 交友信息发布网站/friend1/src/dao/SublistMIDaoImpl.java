package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.JdbcUtil;

import mybean.data.MemberInform;
import mybean.data.Page;

public class SublistMIDaoImpl implements MemberInformDao{
	@Override
	public Page<MemberInform> findMember(MemberInform searchModel,int pageNum,int pageSize){
		List<MemberInform> allMemberInform = getAllMemberInform(searchModel);
		System.out.println(allMemberInform.size());
		Page<MemberInform> page = new Page<MemberInform>(pageNum,pageSize,allMemberInform);
		return page;
	}
	private List<MemberInform> getAllMemberInform(MemberInform searchModel){
		List<MemberInform> result = new ArrayList<MemberInform>();
		
		List<Object> paramList = new ArrayList<Object>();
		
		String logname = searchModel.getLogname();
		StringBuilder sql = new StringBuilder("select * from member where 1=1");
		if(logname != null && !logname.equals("")){
			sql.append(" and logname like ?");
			paramList.add("%"+logname+"%");
		}
		JdbcUtil jdbcUtil = null;
		try{
			jdbcUtil = new JdbcUtil();
			jdbcUtil.getConnection();
			List<Map<String,Object>> mapList = jdbcUtil.findResult(sql.toString(), paramList);
			if(mapList != null){
				for(Map<String,Object> map:mapList){
					MemberInform memberInform = new MemberInform(map);
					result.add(memberInform);
				}
			}
//			System.out.println(mapList.size());
		}catch(SQLException e){
			throw new RuntimeException("查询所有数据异常",e);
		}finally{
			if(jdbcUtil != null){
				jdbcUtil.releaseConn();
			}
		}
		
		
		return result;
	}
}
