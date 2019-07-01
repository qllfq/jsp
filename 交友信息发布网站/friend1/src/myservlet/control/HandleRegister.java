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
/*�������ݿ⣬���û��ύ����Ϣд�뵽member���У������û�ת����showRegisterMess.jspҳ�棬�鿴ע�ᷴ����Ϣ
Java Servlet�ĺ���˼�����ڷ������˴�����Ӧ�û�����Ķ���*/
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
					backNews="ע��ɹ�";
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
				backNews="��Ϣ��д���������������зǷ��ַ�";
				reg.setBackNews(backNews);
				response.sendRedirect("showRegisterMess.jsp");
			}
			con.close();
		}catch(SQLException exp){
			System.out.println("Ssssss");
			backNews="�û�Ա���ѱ�ʹ��";
			reg.setBackNews(backNews);
			RequestDispatcher dispatcher=request.getRequestDispatcher("showRegisterMess.jsp");
			dispatcher.forward(request,response);
		}
	}
    
}
