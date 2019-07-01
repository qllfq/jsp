<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<head>

    <meta charset="utf-8">
   

    <title>friend-upload</title>
    <%@ include file="head.jsp" %>
    <script type="text/javascript">
//校验
 window.onload = function(){
	
	
	
	
	
	
	
	
	
	
	
	
	
/*  
var oFilename = document.getElementById("filename");
 var fileType = oFilename.value; */
//判断后缀是不是需要的文件类型
// 		if(fileType != null && fileType != ""){
		    /* var start = fileType.lastIndexOf(".")+1;
			var length = fileType.length;
			var finalType = fileType.substring(start,length);
			alert(finalType)
				if(finalType!="jpg"){
				alert("请上传正确格式的文书");
				return false;
				  }else{
				
				//获取上传文件的文件名 
				
				return true;
				
				
				} */
// 			}
	  	
}

</script>
   
</head>

<body>
    <div class="container">     
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center"><strong>照片上传</strong>
                    </h2>
                    <hr>
                    <div class="text-center">
                    <p>照片记录你珍贵的回忆，上传你的照片，让更多人了解你和你的友谊！</p>
                    <p><small>选择要上传的图像照片文件（名字不可以含有非ASCII码字符，比如汉字等）:</small></p>
                    <br><br>
                    
                  
  						<div class="img">
   						 <a target="_blank" href="img/slide-3.jpg">
  				    	 <img src="img/slide-3.jpg" alt="图片文本描述" width="300" height="200">
   						 </a>
    						<div class="desc">在这里记录美好的时刻。</div>
 					 	</div>
 					 	
 					 	<div class="img">
   						 <a target="_blank" href="img/slide-2.jpg">
  				    	 <img src="img/slide-2.jpg" alt="图片文本描述" width="300" height="200">
   						 </a>
    						<div class="desc">在这里记录真挚的友谊。</div>
 					 	</div>
 					 	
 					 	<div class="img">
   						 <a target="_blank" href="img/slide-1.jpg">
  				    	 <img src="img/slide-1.jpg" alt="图片文本描述" width="300" height="200">
   						 </a>
    						<div class="desc">在这里记录我们的故事。</div>
 					 	</div>
                   
  						

                    <form role="form" action="helpUpload" method="post" enctype="multipart/form-data">
                   
                            
							<a href="javascript:;" class="a-upload">  
   							 <input type="file" name="filename" id="filename">点击这里上传文件  
							</a> 
                      
    						 
 								 <br><input id="submit" type="submit"  name="g" value="提交"  class="btn btn1">
						
                        </div>
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
                    <p>课设组长<a target="_blank" title="乔露露">乔露露</a> - 组员<a  title="方琦" target="_blank">方琦</a></p>
                </div>
            </div>
        </div>
    </footer>

   
<script type="text/javascript">

var oForm = document.getElementsByTagName("form")[0];
oForm.onsubmit = function(){
	
	var oFilename = document.getElementById("filename");
	var fileType = oFilename.value; 
	
	
	
	if( fileType == "" ){
		alert("未选择图片！");
		return false;
	}else if(fileType != null && fileType != ""){
	    var start = fileType.lastIndexOf(".")+1;
		var length = fileType.length;
		var finalType = fileType.substring(start,length);
		
			if(finalType!="jpg"){
			alert("请上传正确格式的图片");
			return false;
			  }else{
			
			//获取上传文件的文件名 
			
			return true;
			
			
			}
	}
}

</script>
</body>

</html>

