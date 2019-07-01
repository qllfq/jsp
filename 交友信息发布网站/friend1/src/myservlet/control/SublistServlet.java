package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;
import mybean.data.MemberInform;
import mybean.data.Page;
import service.SublistMIServiceImpl;
import util.Check;

public class SublistServlet extends HttpServlet{
	public static final int DEFAULT_PAGE_SIZE=5;
	public static final int DEFAULT_PAGE_NUM=1;
	private SublistMIServiceImpl memberInformService = new SublistMIServiceImpl();
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//���ղ���
		request.setCharacterEncoding("utf8");
		HttpSession session = request.getSession(true);
		Login login=(Login) session.getAttribute("login");
		boolean ok = true;
		if(login==null){
			ok=false;
			response.setCharacterEncoding("utf8");
			response.sendRedirect("login.jsp");
		}
		if(ok==true){
//			��ȡ�û�������ҵ����֣�������ҵ������г�Ա����ʱlognameΪ��

		String logname = request.getParameter("logname");
		int pageNum=DEFAULT_PAGE_NUM;
		String pageNumStr = request.getParameter("pageNum");
		
		if(pageNumStr != null && !"".equals(pageNumStr)){
		pageNum = Integer.parseInt(pageNumStr);
		}
		int pageSize = DEFAULT_PAGE_SIZE;
		String pageSizeStr = request.getParameter("pageSize");
		if(pageSizeStr != null && !pageSizeStr.equals("")){
			pageSize = Integer.parseInt(pageSizeStr);
			}
		MemberInform searchModel = new MemberInform();
//		search�б�������û������Ҫ���ҵ��û���

		searchModel.setLogname(logname);
		Page<MemberInform> result = memberInformService.findMember(searchModel, pageNum, pageSize);
		request.setAttribute("result", result);
		request.setAttribute("logname", logname);
		request.getRequestDispatcher("showAllMember.jsp").forward(request, response);
		}
	}
		
	
}
