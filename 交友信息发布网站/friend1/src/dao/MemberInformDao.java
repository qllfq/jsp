package dao;

import mybean.data.MemberInform;
import mybean.data.Page;

public interface MemberInformDao {
	/*	���ݲ�ѯ��������ѯ��ҳ��Ϣ
	searchModel��װ��ѯ����
	pageNum��ѯ�ڼ�ҳ����
	pageSizeÿҳ��ʾ��������¼*/
	public Page<MemberInform> findMember(MemberInform searchModel,int pageNum,int pageSize);
}
