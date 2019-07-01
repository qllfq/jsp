package myservlet.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Check;
import util.JdbcUtil;
import mybean.data.Login;
import mybean.data.ModifyMessage;


public class HandleModifyMess extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
//		在处理用户提交的汉字信息时
		request.setCharacterEncoding("utf8");
		HttpSession session = request.getSession(true);
		Login login = (Login) session.getAttribute("login");
		
		boolean ok = true;
		if(login==null){
			ok = false;
			response.setCharacterEncoding("utf8");
			response.sendRedirect("login.jsp");
		}
		if(ok==true){
			continueDoPost(request,response);
		}
	}
	public void continueDoPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException{
	request.setCharacterEncoding("utf8");
		HttpSession session = request.getSession(true);
		Login login = (Login) session.getAttribute("login");
		String logname = login.getLogname();
		Connection con;
		Statement sql;
		ModifyMessage modify = new ModifyMessage();
		request.setAttribute("modify", modify);
		String email = request.getParameter("newEmail").trim(),
				phone = request.getParameter("newPhone").trim(),
				message = request.getParameter("newMessage");
		//boolean l=Check.checkName(logname);
		//boolean p=Check.checkPassword(password);
		//boolean e=Check.checkEmail(email);
		//boolean h=Check.isMobileNO(phone);
		//boolean boo=(e && h);
		String backNews = "";
		//if(e && h){
			try{
				con = new JdbcUtil().getConnection();
				String updateCondition = "UPDATE member SET phone='"+ phone +"',email='"+ email + "',message='"+ message + "' where logname='" + logname + "'";
				System.out.println("1");
				sql = con.createStatement();
				int m = sql.executeUpdate(updateCondition);
				if(m!=0){
					System.out.println("2");
					backNews = "修改信息成功";
					modify.setBackNews(backNews);
					modify.setLogname(logname);
					modify.setNewEmail(email);
					modify.setNewPhone(phone);
					modify.setNewMessage(message);
					RequestDispatcher dispatcher=request.getRequestDispatcher("showModifyMess.jsp");
					dispatcher.forward(request,response);
					
				}else{
					System.out.println("3");
					backNews = "信息填写不完整或信息中有非法字符";
					modify.setBackNews(backNews);
					response.sendRedirect("inputModifyMess.jsp");
				}
				con.close();
			}catch(SQLException exp){
				System.out.println("4");
				modify.setBackNews(""+exp);
				response.sendRedirect("inputModifyMess.jsp");
			}
			/*RequestDispatcher dispatcher=request.getRequestDispatcher("showModifyMess.jsp");
			dispatcher.forward(request,response);*/
					
		//}else{
			/*response.sendRedirect("inputModifyMess.jsp");*/
		}
		
	//}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request,response);
		
	}
}
