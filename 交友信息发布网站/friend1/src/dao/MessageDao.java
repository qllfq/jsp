package dao;

import mybean.data.Input;
import mybean.data.MemberInform;
import mybean.data.Page;

public interface MessageDao {
	/*	���ݲ�ѯ��������ѯ��ҳ��Ϣ
	searchModel��װ��ѯ����
	pageNum��ѯ�ڼ�ҳ����
	pageSizeÿҳ��ʾ��������¼*/
	public Page<Input> findMember(Input searchModel,int pageNum,int pageSize);
}
