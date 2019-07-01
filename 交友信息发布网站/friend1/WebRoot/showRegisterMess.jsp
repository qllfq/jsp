<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.data.Register" %>
<!-- 本页面负责显示注册反馈信息，比如注册是否成功等 -->
<!-- 使用jsp动作标记useBean来加载使用bean -->
<jsp:useBean id="register" type="mybean.data.Register" scope="request"/>
<head>
<%@ include file="head.jsp" %>
  </head>
<html>
  <body bgcolor=cyan>
     <div class="container">  
         <div class="row">
            <div class="box">
            	
            
                    <h2 class="text-center"><strong>
                    
 					 <!-- 使用getProperty动作标记可以获得bean的属性值，并将这个值用串的形式发送给用户的浏览器。 -->
  						<br><jsp:getProperty name="register" property="backNews"/>
 		
                    </strong>
                    </h2>
                
                    <div class="text-center">
                    <p>您已经完成注册，赶快登陆吧！</p>
                    <p><small>下面为您的注册信息.</small></p>
                    </div>
                    
 
  <center>
 
  <table>
  <tr><td align=right><label>注册的会员名称:</label></td>  <td>&nbsp;&nbsp;</td>
  <td><jsp:getProperty name="register" property="logname"/></td>
  </tr><br>
  <tr><td align=right><label>注册的电子邮件:</label></td>  <td>&nbsp;&nbsp;</td>
  <td><jsp:getProperty name="register" property="email"/></td>
  </tr><br>
  <tr><td align=right><label>注册的联系电话:</label></td>  <td>&nbsp;&nbsp;</td>
  <td><jsp:getProperty name="register" property="phone"/></td>
  </tr><br>
  <tr><td align=right><label>您的简历和交友标准:</label> </td>  <td>&nbsp;&nbsp;</td>
  <td><!-- <textarea name="message" rows="6" cols="30"> -->
   <jsp:getProperty name="register" property="message" />
   </textarea>
   </td>
   </tr>
   </table>
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
