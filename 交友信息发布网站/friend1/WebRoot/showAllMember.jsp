<%@page import="mybean.data.MemberInform"%>
<%@page import="mybean.data.Page"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<%@ include file="head.jsp" %>
  </head>
  <% String context = request.getContextPath(); %>
  <script type = "text/javascript">
  //当前显示第几页数据
  var currentPage = ${result.currentPage};
  var totalPage = ${result.totalPage};
  function submitForm(actionUrl){
	  var formElement = document.getElementById("searchForm");
	  formElement.action = actionUrl;
	  formElement.submit();
  }
  function firstPage(){
	  if(currentPage == 1){
		  alert("已经是第一页数据");
		  return false;
	  }else{
		  submitForm("<%=context %>/sublist/SublistServlet?pageNum=1");
		  return true;
	  }
  }
  function nextPage(){
	  if(currentPage==totalPage){
		  alert("已经是最后一页数据");
		  return false;
	  }else{
		  submitForm("<%=context %>/sublist/SublistServlet?pageNum="+(currentPage+1));
		  return true;
	  }
  }
  function previousPage(){
	  if(currentPage==1){
		  alert("已经是第一页数据");
		  return false;
	  }else{
		  submitForm("<%=context %>/sublist/SublistServlet?pageNum="+(currentPage-1));
		  return true;
	  }
  }
  function lastPage(){
	  if(currentPage==totalPage){
		  alert("已经是最后一页数据");
		  return false;
	  }else{
		  submitForm("<%=context %>/sublist/SublistServlet?pageNum=${result.totalPage}");
		  return true;
	  }
  }
  
  
  </script>
<html>
  <body>
  
    	<div class="container">  
         <div class="row">
            <div class="box">
            	
            
                    <h2 class="text-center"><strong>会员查询</strong>
                    </h2>             
  
  
  <center>
  <label><br>当前显示的内容是：
  <table  id="customers"></label>
  <tr>
  <th>会员名</th>
   <th>电话</th>
    <th>Email</th>
     <th>简历和交友标准</th>
      <th>用户照片</th>
      </tr>
   <% 
  Page<MemberInform> list = (Page<MemberInform>)request.getAttribute("result");
  	for(MemberInform inform2:list.getDataList()){%>
  <tr>
  	<td><%=inform2.getLogname() %></td>
  	<td><%=inform2.getPhone() %></td>
  	<td><%=inform2.getEmail() %></td>
  	<td><%=inform2.getMessage() %></td>
  	<%-- <td><%=inform2.getPic() %></td> --%>
  	<td><img src="image/<%=inform2.getPic() %>" width=100 height=100/></img></td>
   </tr>
   <%} %>
<%=list.getPageSize() %>
      </table>
      <label>每页最多显示<%=list.getPageSize() %>条信息</label>
     <label><br>当前显示第<font color = blue>
     <%=list.getCurrentPage() %>
     </font>页，共有
      <%=list.getTotalPage() %>页</label>
     <br>单击“上一页”或“下一页”按钮查看信息
     <table>
     <tr>
     <td>
     <form action = "helpShowMember" method = "post" id="searchForm">
   
      <a href="helpShowMember?pageNum=<%=list.getCurrentPage()-1>0?list.getCurrentPage()-1:1 %>&pageSize=5" class="btn btn1">上一页</a>&nbsp;&nbsp;
        <a href="#" class="btn btn1">首页</a>&nbsp;&nbsp;
       <a href="helpShowMember?pageNum=<%=list.getCurrentPage()+1 %>&pageSize=5" class="btn btn1">下一页</a>&nbsp;&nbsp;
       
     </form>
     </td>
     <td>

     </td>
     </tr>
     </table>
     <%=request.getAttribute("logname")%>
     
     
     
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
