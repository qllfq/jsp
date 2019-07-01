<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import = "mybean.data.Password" %>
<jsp:useBean id = "password" type = "mybean.data.Password" scope = "request"/>
<head>
<%@ include file="head.jsp" %></head>
<html>

  <body>  
   <div class="container">  
         <div class="row">
            <div class="box">
            	
            
                    <h2 class="text-center"><strong> <br><jsp:getProperty name = "password" property = "backNews"/></strong>
                    </h2>
                

  
  
  <center>
 
  <br>您的新密码：<jsp:getProperty name = "password" property = "newPassword"/>
  <br>您的旧密码：<jsp:getProperty name = "password" property = "oldPassword"/>
  </font>
   </center>
   
   
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
