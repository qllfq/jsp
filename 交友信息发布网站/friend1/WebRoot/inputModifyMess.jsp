<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<head>
<%@ include file="head.jsp" %>
    <meta charset="utf-8">
    

    <title>friend-inputModifyMess</title>
    <script type="text/javascript">
    window.onload = function(){
    	document.getElementById("g").onclick = function(){
			var mobilePhone = /^[+]?[0-9]{0,4}\s?[0-9]{11}$/;
			var fixedPhone = /^[+]?[0-9]{0,4}-?[0-9]{3,4}-?[0-9]+$/;
			var emailCheck = /^([\w-]+)@([\da-z]+)\.([a-z]{2,6})$/;	
			var contact = document.getElementById("newPhone").value;
			var email = document.getElementById("newEmail").value;
									if (email == "") {
										alert("邮箱地址不能为空");
										check = false;
									} else {
										if (!emailCheck.test(email)) {
											alert("邮箱地址输入有误");
											check = false;
										}else{
											if (contact == "") {
												alert("联系方式不能为空！");
												check = false;
											}else {
												   if(!mobilePhone.test(contact)|| !fixedPhone.test(contact)) {
												    alert("联系方式输入有误");
												    check = false;
												    } else {
												    	check = true;
													}
											    }
										   }
									  }
			return check;
    	};
    	
    }
		
	</script>
   

</head>

<body>

   

    <div class="container">

        
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center"><strong>修改信息</strong>
                    </h2>
                    <hr>
                    <div class="text-center">
                    <p>事物在变化，友谊不变.</p>
                    <p><small>请填写您新的个人信息。</small></p>
                    
                    </div>
                    <form action = "helpModifyMess" name = form  method = "post"> 
                    <br><br>
                  			<div class="col-lg-6 center"> 
                                <label>新电子邮件：</label>
                                <input type = text name = "newEmail" id="newEmail"class="form-control" >
                                <label>新联系电话：</label>
                                <input type = text name = "newPhone" id="newPhone"class="form-control">
                                <label>新简历和交友标准：</label>
                                <textarea name = "newMessage" rows = "6" cols = "30" class="form-control"></textarea>
								<div class="col-lg-6 center"> 
                               <!--  <input type="hidden" name="save" value="contact"> -->
                                <button input type = submit name = "g" id="g" value = "提交修改" class="btn btn1">提交修改</button>
                               <!--  <input type="hidden" name="save" value="contact"> -->
                                <button type = reset value = "重置" class="btn btn1">重置</button>
              </div>            
                        </div>
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
                    <p>课设组长<a target="_blank" title="乔露露">乔露露</a> - 组员<a  title="方琦" target="_blank">方琦</a></p>
                </div>
            </div>
        </div>
    </footer>

  
</body>

</html>