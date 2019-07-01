<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <title>friend-choiceLookType</title>
  
	<%@ include file="head.jsp" %>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="box">

		
		
		
       <!--       <div class="col-lg-12 text-center">
                    <h2>会员名单
                        <br>
                        <br>
                        <div>
                        <font color="red>${errorMsg}</font></div>
                        <small>显示全体会员</small>
                    </h2>
                    <form action = "helpShowMember" method="post" name="form">
  						<br>
  						
  						<input type = "hidden" value = "1" name = "showPage" size = 6 >
  						
 						<input type = "submit" value = "显示" name = "sumbit" class="btn btn-default btn-lg">
  					</form>
                    <hr>
                
                <div class="col-lg-12 text-center">
                                 
                    <P>会员查询</P> 
                    <P> <small>输入要查找的会员名</small></P> 
                           
                   	<form action = "helpShowMember" method="post" name="form">
					    <br>

					    <div class="form-group col-lg-4">
					    <input type = "text"  name="logname"  class="form-control" >
					    </div>
 						<div class="form-group col-lg-12">
 						<input type = "submit" value = "显示" name = "sumbit" class="btn btn-default btn-lg">
 						<hr>
 						</div>
  					</form>
                 -->  
                 
                 
                 
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>会员</strong>
                    </h2>
                    <hr>
                    				
  					
  					<div class="col-lg-12 text-center">            
                    <P>会员查询</P> 
                    <P> <small>输入要查找的会员名</small></P><br><br>
                    <form action = "helpShowMember" method="post" name="form">
                   		 <div class="col-lg-6 center">
					  	  <input type = "text"  name="logname"  class="form-control" >
					     </div><br><br>
                    	<div class="form-group col-lg-12">
 						<input type = "submit" value = "查询" name = "sumbit" class="button btn1">
 						</div> 
                   	 </form>
                    </div>
                    
                   
                    
        <div class="col-lg-12 text-center">
         <form action = "helpShowMember" method="post" name="form">
			<button value="显示全体会员" name = "sumbit" class="button" style="vertical-align:middle"><span>显示全体会员</span></button>
			<input type = "hidden" value = "1" name = "showPage" size = 6 >
		</form>
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