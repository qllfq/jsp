<%@page import="mybean.data.Page"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "mybean.data.MemberInform" %>
<head>
<%@ include file="head.jsp" %>
  </head>
 <!--  假如使用class，它是先判断拿不拿得到实例的bean，若拿不到就使用new关键字实例化一个，而使用的是type时，
  它只是查找指定的范围中是否存在，在不存在时又没使用class或beanName 指定type，就会抛出异常 -->
<!--   <jsp:useBean id = "inform" class = "mybean.data.MemberInform" scope = "request"/> -->
<html>
  <body bgcolor = pink>
  <center>
  <table border = 2>
  <tr>
  <th>会员名</th>
  <th>电话</th>
  <th>email</th>
  <th>简历和交友标准</th>
  <th>用户照片</th>
  </tr>
  <tr>
  <td>
  <jsp:getProperty name = "inform" property = "logname" /></td>
   <jsp:getProperty name = "inform" property = "phone" /></td>
    <jsp:getProperty name = "inform" property = "email" /></td>
     <jsp:getProperty name = "inform" property = "email" /></td>
      <jsp:getProperty name = "inform" property = "message" /></td>
      <td><img src = image/<jsp:getProperty name = "inform" property = "pic"/>width = 50 height = 50></img></td>
      

  </body>
</html>
