<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'input.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
	<%@ include file="head.jsp" %>
  </head>
  
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
            
            
            
  		<div class="col-lg-6 center">
  		
  <form action="LeaveMessageServlet" method="post" name="form">
<!-- 			输入您的名字：<br><input type="text" name="logname"> -->
			  
			<br>输入您的留言标题：<BR><input type="text" name="title"  class="form-control">
			<br>输入您的留言：<br><textarea name="leaveMessage" rows="10" cols="36" wrap="physical"  class="form-control"></textarea>
			<br>允许谁可见：<br>
			
			<div class="col-lg-12">
<!-- 			<input  type="radio" value="2" name="type" class="form-control">私密
			<input  type="radio" value="1" name="type"  class="option">公开 -->
			
			<div class="radio">  
            <label class="act">  
              <input type="radio" value="2" name="type" />  
              <span class="option"><span class="option-span"></span></span>  
              <span>私密</span>  
            </label>  
            </div> 
             
             <div class="radio label">  
            <label  class="act">  
                <input type="radio" value="1" name="type" />  
                <span class="option"><span class="option-span"></span></span> 
                <span>公开</span>  
            </label>  
            </div> 
			</div>
			<br><br>
			<div class="col-lg-12 text-center">
			<button  value="提交信息" name="submit"   class="btn btn1">提交</button>
			</div>
		</form>
		
		<br><hr>
		
		
<!-- 		<div class="col-lg-12">
		<form action="ShowMessageServlet" method="post" name="form1" >
			<input type="hidden" value="1" name="type" >
			<input type="submit" value="查看留言板" name="look"  class="form-control">
		</form>
		<form action="ShowMessageServlet" method="post" name="form1" >
			<input type="hidden" value="me" name="flag" >
			<input type="submit" value="查看自己的留言板" name="look" class="form-control">
		</form>
		</div> 
		</div> -->
		
		<div class="col-lg-12 text-center">
		<form action="ShowMessageServlet" method="post" name="form1" >
			<button value="查看留言板" name="look" class="button" style="vertical-align:middle"><span>查看留言板</span></button>
			<input type="hidden" value="1" name="type">
		</form>
		<form action="ShowMessageServlet" method="post" name="form1">
			<button value="查看自己的留言板" name="look" class="button" style="vertical-align:middle"><span>我的留言板</span></button>
			<input type="hidden" value="me" name="flag">
		</form>
		</div>
		

                   

                    
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->
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
