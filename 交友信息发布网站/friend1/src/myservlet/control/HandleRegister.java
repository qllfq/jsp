package myservlet.control;
import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Check;
import util.JdbcUtil;
import mybean.data.Register;
/*连接数据库，将用户提交的信息写入到member表中，并将用户转发到showRegisterMess.jsp页面，查看注册反馈信息
Java Servlet的核心思想是在服务器端创建相应用户请求的对象*/
public class HandleRegister extends HttpServlet{
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		System.out.print("cewvt");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("utf8");
		Connection con;
		Statement sql;
		Register reg=new Register();
		request.setAttribute("register",reg);
		String logname=request.getParameter("logname").trim(),
		password=request.getParameter("password").trim(),
		email=request.getParameter("email").trim(),
		phone=request.getParameter("phone").trim(),
		message=request.getParameter("message").trim();
		
		String backNews="";
		try{		
			String pic="public.jpg";
			String insertRecord="('"+logname+"','"+password+"','"+phone+"','"+email+"','"+message+"','"+pic+"')";
			con = new JdbcUtil().getConnection();
			String insertCondition="INSERT INTO member VALUES"+insertRecord;
			sql=(Statement)con.createStatement();
			
				int m=((java.sql.Statement) sql).executeUpdate(insertCondition);
				System.out.println(m);
				if(m!=0){
					backNews="注册成功";
					reg.setBackNews(backNews);
					reg.setLogname(logname);
					reg.setEmail(email);
					reg.setPassword(password);
					reg.setPhone(phone);
					reg.setMessage(message);
					RequestDispatcher dispatcher=request.getRequestDispatcher("showRegisterMess.jsp");
					dispatcher.forward(request,response);
				}else{
				System.out.println("22");
				backNews="信息填写不完整或名字中有非法字符";
				reg.setBackNews(backNews);
				response.sendRedirect("showRegisterMess.jsp");
			}
			con.close();
		}catch(SQLException exp){
			System.out.println("Ssssss");
			backNews="该会员名已被使用";
			reg.setBackNews(backNews);
			RequestDispatcher dispatcher=request.getRequestDispatcher("showRegisterMess.jsp");
			dispatcher.forward(request,response);
		}
	}
    
}
