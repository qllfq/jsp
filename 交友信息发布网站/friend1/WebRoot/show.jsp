<%@page import="mybean.data.Page"%>
<%@page import="mybean.data.Input"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="head.jsp" %>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%--
		request.setCharacterEncoding("utf8");
		Vector v=(Vector)application.getAttribute("Mess");//循环遍历application获取的值进行判断
		for(int i=0;i<v.size();i++){
			String message=(String)v.elementAt(i);
			String[] a=message.split("#");
			out.print("留言人:"+a[0]+",");
			out.print("标题:"+a[1]+"<br>");
			out.print("留言内容:<br>"+a[2]);
			out.print("<br>----------------------<br>");
		}
	--%>
	<html>
  <body>
  
  <div class="container">  
         <div class="row">
            <div class="box">
            	
            
                   <div class="col-lg-12">
                 <hr>
                 <h2 class="text-center"><strong>留言版</strong>
                 </h2>
                 <hr>
                 <div class="text-center">
                 <p>想说的话，让它在这里休息一会儿吧.</p>
                 <p><small>请在下面的输入框中发表留言.</small></p>
                 </div>
                    </div>
  
  <br>
  
   <% 
  Page<Input> list = (Page<Input>)request.getAttribute("result");
  	for(Input inform2:list.getDataList()){%>
	<div class="col-lg-6  center"> <label><%=inform2.getLogname() %><br>
    <small><small><%=inform2.getNowTime() %></small></small></label></div>
  	<div class="col-lg-6 center">  <textarea class="form-control" ><%=inform2.getLeaveMessage() %></textarea></div>

   <%} %>

		 <center>

      <label>每页最多显示<%=list.getPageSize() %>条信息
     <br>当前显示第<font color = blue>
     <%=list.getCurrentPage() %>
     </font>页，共有
      <%=list.getTotalPage() %>页</label>
     <br>单击“上一页”或“下一页”按钮查看信息
     <table>
     <tr>
     <td>
<!--      <form action = "helpShowMember" method = "post" id="searchForm"> -->

      <a href="ShowMessageServlet?pageNum=<%=list.getCurrentPage()-1>0?list.getCurrentPage()-1:1 %>&pageSize=5&type=1" class="btn btn1">上一页</a>&nbsp;&nbsp;
       <a href="ShowMessageServlet?pageNum=<%=list.getCurrentPage()+1 %>&pageSize=5&type=1" class="btn btn1">下一页</a>&nbsp;&nbsp;
       
<!--      </form> -->
     </td>
     <td>

     </td>
     </tr>
     </table>
 
     	<a href="input.jsp" >返回留言页面</a>
     
    		 </div>
         </div>
     </div>
     
         <footer>
        <div class="container">
            <div class="row">       
                <div class="col-lg-12 text-center">
                    <p>课设组长乔露露 - 组员方琦</p>
                </div>
            
            </div>
        </div>
    </footer>
  </body>
</html>
