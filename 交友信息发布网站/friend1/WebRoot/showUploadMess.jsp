<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.data.UploadFile" %>
<jsp:useBean id="upFile" type="mybean.data.UploadFile" scope="session"/>
<head>
<%@ include file="head.jsp" %>
  </head>
<html>
  <body bgcolor="cyan">
  
       <div class="container">  
         <div class="row">
            <div class="box">
            	
            
                    <h2 class="text-center"><strong>上传成功！</strong>
                    </h2>
                
                    <div class="text-center">
                    <p>您已经完成上传，赶快记录更多的美好瞬间吧！</p>
                    <p><small>下面为图片展示.</small></p>
                    </div>
                    
  
  <center>
  <font size=2 color=blue>
  <br><jsp:getProperty name="upFile" property="backNews"/>
  </font>
  <br><font size=2>
  <br>  <p>保存后的文件名字：<jsp:getProperty name="upFile" property="savedFileName"/></p>
  <br>
  <!-- <img src=image/<jsp:getProperty name="upFile" property="savedFileName"/>>
  </img> -->

  				    	  <img src=image/<jsp:getProperty name="upFile" property="savedFileName"/> width="500px">
 						 </img>

 					 	
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
