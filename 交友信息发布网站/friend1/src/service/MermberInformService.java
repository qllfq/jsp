package service;

import mybean.data.MemberInform;
import mybean.data.Page;

public interface MermberInformService {
/*	根据查询条件，查询分页信息
	searchModel封装查询条件
	pageNum查询第几页数据
	pageSize每页显示多少条记录*/
	public Page<MemberInform> findMember(MemberInform searchModel,int pageNum,int pageSize);
}
