<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.data.Login" %>
<jsp:useBean id="login" type="mybean.data.Login" scope="session"/>
<head>
<%@ include file="head.jsp" %>
  </head>
<html> 
  <body bgcolor=pink>
  	
  	     <div class="container">  
         <div class="row">
            <div class="box">
            	
            
                    <h2 class="text-center"><strong><br><jsp:getProperty name="login" property="backNews"/></strong>
                    </h2>
                
<!--                     <div class="text-center">
                    <p>都准备好了，快去寻找你的同伴吧.</p>
                    <p><small>下面为您的登陆信息.</small></p>
                    </div> -->
<!--                     <div class="text-center">
                    <p>请确认后重新输入您的账号密码.</p>
                    </div> -->
                    <br><br>
  	
  	
  <center>   <font size=4 color=blue>
  
  </font>

  <% if(login.isSuccess()==true){
	%>  <label>登录会员名称：</label><jsp:getProperty name="login" property="logname"/>
	    <br><label>登录会员密码：</label><jsp:getProperty name="login" property="password"/>
  <% } %>
    <br>

    </center>
    
       				<br><br>
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
