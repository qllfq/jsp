<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.data.ModifyMessage" %>
<jsp:useBean id="modify" type= "mybean.data.ModifyMessage" scope="request"/>
<head>
 <meta charset="utf-8">
 <%@ include file="head.jsp" %></head>
<html>
   <body bgcolor = yellow>
   
   <div class="container">  
         <div class="row">
            <div class="box">
            	
            
                    <h2 class="text-center"><strong>   <jsp:getProperty name = "modify" property = "backNews"/></strong>
                    </h2>
                
                    <div class="text-center">
                    <p>变更密码让您的账户更加安全。</p>
                    <p><small> 您修改的信息如下：</small></p>
                    </div>
   
  <font size = 3>
   <center>

   <table border = 1 id="customers">
   <tr>
   <td>新电话</td>
   <td>新email</td>
   <td>新简历和交友标准</td>
   </tr>
   <tr>
   <td><jsp:getProperty name = "modify" property = "newPhone"/></td>
    <td><jsp:getProperty name = "modify" property = "newEmail"/></td>
    <td>
    <jsp:getProperty name = "modify" property = "newMessage"/></td>
   </tr>
   </table>
   </center>
   </font>
   
   
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
