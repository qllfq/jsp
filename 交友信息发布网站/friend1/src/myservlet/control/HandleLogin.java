
package myservlet.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.JdbcUtil;
import mybean.data.Login;

public class HandleLogin extends HttpServlet{

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("utf8");
		Connection con;
		Statement sql;
		Login loginBean=null;
		String backNews="";
		HttpSession session=request.getSession(true);
		
		try{
			loginBean=(Login) session.getAttribute("login");
			if(loginBean==null){
				loginBean=new Login();
				session.setAttribute("login", loginBean);
			}
		}catch(Exception e){
			loginBean=new Login();
			session.setAttribute("login", loginBean);
		}
		String  logname=request.getParameter("logname").trim(),
		password=request.getParameter("password").trim();
		boolean ok=loginBean.isSuccess();
		if(ok==true&&logname.equals(loginBean.getLogname())){
			backNews=logname+"已经登录了";
			loginBean.setBackNews(backNews);
		}
		else{
//			String uri="jdbc:mysql://127.0.0.1/MakeFriend?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
			
			boolean boo=(logname.length()>0)&&(password.length()>0);
			try{
//				con=DriverManager.getConnection(uri,"root","root");
				con = new JdbcUtil().getConnection();
				String condition="select * from member where logname= '"+logname+"' and password = '"+password+"'";
				sql=con.createStatement();
				if(boo){
					ResultSet rs=sql.executeQuery(condition);
					boolean m=rs.next();
					if(m==true){
						backNews="登录成功!";
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(true);
						loginBean.setLogname(logname);
						loginBean.setPassword(password);
					}else{
						backNews="您输入的用户名不存在，或密码不匹配";
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(false);
						loginBean.setLogname(logname);
						loginBean.setPassword(password);
					}
				}else{
					backNews="您输入的用户名不存在，或密码不匹配";
					loginBean.setBackNews(backNews);
					loginBean.setSuccess(false);
					loginBean.setLogname(logname);
					loginBean.setPassword(password);
				}
				con.close();
			}catch(SQLException exp){
				backNews=""+exp;
				loginBean.setBackNews(backNews);
				loginBean.setSuccess(false);
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("showLoginMess.jsp");
		dispatcher.forward(request, response);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
}
