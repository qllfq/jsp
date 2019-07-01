package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import dao.MessageDaoImpl;
import util.JdbcUtil;
import mybean.data.Input;
import mybean.data.Login;
import mybean.data.MemberInform;
import mybean.data.Page;

public class ShowMessageServlet extends HttpServlet {
	public static final int DEFAULT_PAGE_SIZE=5;
	public static final int DEFAULT_PAGE_NUM=1;
	private static final MessageDao messageDao = new MessageDaoImpl();
		public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf8");
			HttpSession session=request.getSession(true);
			Login login=(Login) session.getAttribute("login");
			boolean ok=true;
			if(login==null){
				ok=false;
				response.setCharacterEncoding("utf8");
				response.sendRedirect("login.jsp");
			}
			if(ok==true){
				String logname=login.getLogname();
				leaveMessage(request, response, logname);
			}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		HttpSession session=request.getSession(true);
		Login login=(Login) session.getAttribute("login");
		boolean ok=true;
		if(login==null){
			ok=false;
			response.setCharacterEncoding("utf8");
			response.sendRedirect("login.jsp");
		}
		if(ok==true){
			String logname=login.getLogname();
			leaveMessage(request, response, logname);
		}
		
	}
	private void leaveMessage(HttpServletRequest request,
			HttpServletResponse response, String logname) throws ServletException,IOException{
		request.setCharacterEncoding("utf8");
		Input input = new Input();
		int pageNum=DEFAULT_PAGE_NUM;
		String pageNumStr = request.getParameter("pageNum");
		if(pageNumStr != null && !pageNumStr.equals("")){
		pageNum = Integer.parseInt(pageNumStr);
		}
		int pageSize = DEFAULT_PAGE_SIZE;
		String type = request.getParameter("type");
		Input inp = new Input();
		if(type!=null && !("").equals(logname)){
			inp.setType(Integer.parseInt(type));
		}
		if(logname!=null && !("").equals(logname)){
			inp.setLogname(logname);
		}
		Page<Input> result = messageDao.findMember(inp, pageNum, pageSize);
		request.setAttribute("result", result);
		request.setAttribute("logname", logname);
		String flag = request.getParameter("flag");
		if("me".equals(flag)){
			request.getRequestDispatcher("pane.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
	}
		

}
