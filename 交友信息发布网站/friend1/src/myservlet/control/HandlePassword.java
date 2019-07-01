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
import mybean.data.Password;


public class HandlePassword extends HttpServlet{
//	public void init(ServletConfig config) throws ServletException{
//		super.init(config);
//		try{
//			Class.forName("com.mysql.jdbc.Driver");
//		}catch(Exception e){}
//	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		HttpSession session = request.getSession(true);
		Login login = (Login) session.getAttribute("login");
		boolean ok = true;
		if(login==null){
			ok = false;
			response.sendRedirect("login.jsp");
		}
		if(ok==true){
			continueWork(request,response);
		}
	}
	private void continueWork(HttpServletRequest request,
			HttpServletResponse response)  throws ServletException,IOException{
		request.setCharacterEncoding("utf8");
		HttpSession session = request.getSession(true);
		Login login = (Login) session.getAttribute("login");
		Connection con = null;
		String logname = login.getLogname();
		Password passwordBean = new Password();
		request.setAttribute("password",passwordBean);
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
//		String uri="jdbc:mysql://127.0.0.1/MakeFriend?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
		
		try{
//			con = DriverManager.getConnection(uri,"root","root");
			con = new JdbcUtil().getConnection();
			Statement sql = con.createStatement();
			ResultSet rs = sql.executeQuery("SELECT * FROM member where logname = '"+ logname + "' And password = '"+ oldPassword + "'");
			if(rs.next()){
				String updateString = "UPDATE member SET password = '" + newPassword + "' where logname = '" + logname + "'";
				int m = sql.executeUpdate(updateString);
				if(m==1){
					passwordBean.setBackNews("密码更新成功");
					passwordBean.setOldPassword(oldPassword);
					passwordBean.setNewPassword(newPassword);
				}else{
					passwordBean.setBackNews("密码更新失败");
				}
			}
			else{
				passwordBean.setBackNews("密码更新失败");
			}
		}catch(SQLException exp){
			passwordBean.setBackNews("密码更新失败"+exp);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("showNewPassword.jsp");
		dispatcher.forward(request, response);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}

}
