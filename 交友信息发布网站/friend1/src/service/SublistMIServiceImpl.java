package service;

import dao.MemberInformDao;
import dao.SublistMIDaoImpl;
import mybean.data.MemberInform;
import mybean.data.Page;

public class SublistMIServiceImpl {
	private MemberInformDao memberInformDao;
	public SublistMIServiceImpl(){
		memberInformDao = new SublistMIDaoImpl();
	}
	public MemberInformDao getMemberInformDao() {
		return memberInformDao;
	}
	public void setMemberInformDao(MemberInformDao memberInformDao) {
		this.memberInformDao = memberInformDao;
	}
	public Page<MemberInform> findMember(MemberInform searchModel,int pageNum,int pageSize){
		Page<MemberInform> result = memberInformDao.findMember(searchModel,pageNum,pageSize);
		return result;
	}
}
