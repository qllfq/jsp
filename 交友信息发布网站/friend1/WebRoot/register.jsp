<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>friend-register</title>
    
    <%@ include file="head.jsp" %>
    <script type="text/javascript">
    window.onload = function(){
    	document.getElementById("gg").onclick = function(){
    		var nameCheck = /^(\S){4,100}$/;
			var passwordCheck = /^(?!\d*$)(\S){6,20}$/;
			var mobilePhone = /^[+]?[0-9]{0,4}\s?[0-9]{11}$/;
			var fixedPhone = /^[+]?[0-9]{0,4}-?[0-9]{3,4}-?[0-9]+$/;
			var emailCheck = /^([\w-]+)@([\da-z]+)\.([a-z]{2,6})$/;			//var messageReg = /^(?!\w*$)([\u4e00-\u9fa5\s\w]+)$/;
			var userName = document.getElementById("logname").value;
			var password = document.getElementById("password").value;
			var repassword = document.getElementById("repassword").value;
			var contact = document.getElementById("phone").value;
			var email = document.getElementById("email").value;
			if (userName == "") {
				alert("用户名不能为空！");
				check = false;
				return false;
			} else { 
				if (!nameCheck.test(userName)) {
					check = false;
					alert("用户名输入有误");
					return false;
				} else {
					if (password == "") {
						alert("密码不能为空！");
						check = false;
					} else {
						if (!passwordCheck.test(password)) {
							check = false;
							alert("密码输入有误");
						} else {
							if (repassword == "") {
								alert("确认密码不能为空！");
								check = false;
							} else {
								if (repassword!= password) {
									alert("确认密码输入有误");
									check = false;
								} else {
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
								}
							}
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
                    <h2 class="text-center"><strong>注册</strong>
                    </h2>
                    <hr>
                    <div class="text-center">
                    <p>准确的信息会给您带来坚实的友谊.</p>
                    <p><small>请输入您的信息，会员名字必须由字母和数字组成，带*号项必须填写.</small></p>
                    </div>
                    
                    <br>
                   <br>
                    <form name=form action="helpRegister" method=post >
                                <label>会员名称：</label>
                                <input type="text" placeholder="由4~100位字符组成" name="logname" id="logname" class="form-control">

                                <label>设置密码：</label>
                                <input type=password placeholder="两种或两种以上的字符，由6~20位字符组成"  name="password" id="password" class="form-control">
            
                                <label>确认密码：</label>
                                <input type=password placeholder="请再次输入密码" name="repassword" id="repassword" class="form-control">
                                
                                <label>电子邮件：</label>
                                <input type=text placeholder="字符串中要有一个@，@前必须有字符" name="email" id="email" class="form-control" >
                        
                                <label>联系电话：</label>
                                <input type=text placeholder="由11位有效数字组成" name="phone" id="phone" class="form-control">
                            
                                <label>输入您的简历和交友标准：</label>
                                <textarea placeholder="快来与我交朋友吧！" name="message" id="message" class="form-control" rows="6"></textarea>        
                      <div class="row">
                            <div class="col-lg-12 text-center">
                                <input type="hidden" name="save" value="contact">
                                <button type="submit"  name="g" id="gg" value="提交"  class="btn btn1">提交</button>
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
                    <p>课设组长乔露露 - 组员方琦</p>
                </div>
            
            </div>
        </div>
    </footer>

   
</body>

</html>

