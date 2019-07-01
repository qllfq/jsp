package myservlet.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.JdbcUtil;
import mybean.data.Input;
import mybean.data.Login;

public class LeaveMessageServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
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
			try {
				leaveMessage(request,response,logname);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void leaveMessage(HttpServletRequest request,
			HttpServletResponse response, String logname) throws ServletException,IOException, SQLException{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");
		Input input = new Input();
		String backNews="";
			String leaveMessage = request.getParameter("leaveMessage").trim();
			String type = request.getParameter("type");
			Date time=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(sdf.format(time));
			String nowTime = sdf.format(time);
			if(leaveMessage.length()>0 && !leaveMessage.equals("")){
				 Connection con;
					Statement sql;
					con = new JdbcUtil().getConnection();
					String insertCondition="INSERT INTO msg VALUES('"+logname+"','"+leaveMessage+"','"+type+"','"+nowTime+"')";
					sql=(Statement)con.createStatement();
						int m=((java.sql.Statement) sql).executeUpdate(insertCondition);
						if(m!=0){
							 backNews="留言成功";
							input.setBackNews(backNews);
							input.setLogname(logname);
							input.setLeaveMessage(leaveMessage);
							input.setNowTime(nowTime);
						}else{
						backNews="开小差了，未成功";
						input.setBackNews(backNews);
						RequestDispatcher dispatcher=request.getRequestDispatcher("input.jsp");
						dispatcher.forward(request,response);
					}
					con.close();
			}else{
				backNews="留言内容不能为空";
				input.setBackNews(backNews);
				RequestDispatcher dispatcher=request.getRequestDispatcher("input.jsp");
				dispatcher.forward(request,response);
			}
		response.sendRedirect("ShowMessageServlet?logname="+logname+"&flag=me");
		return ;
	}	
		
}


