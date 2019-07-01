<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<head>

    <meta charset="utf-8">
   

    <title>friend-modifyPasswor</title>
<%@ include file="head.jsp" %>
   

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>更改密码</strong>
                    </h2>
                    <hr>
                    <div class="text-center">
                    <p>变更密码让您的账户更加安全.</p>
                    <p><small>请输入您当前的密码和新密码：</small></p>
                    </div>
                    
                     <br><br>
					<form role="form" action = "helpModifyPassword" method = "post" class="col-lg-12">
					<div class="col-lg-6 center"> 
                                <label>当前密码：</label>
                                <input type = password name = "oldPassword" class="form-control">

                                <label>新密码：</label>
                                <input input type = password name = "newPassword"  class="form-control">
                       <div class="row">
                            <div class="col-lg-12 text-center">
                            <br><br>
                                <input type="hidden" name="save" value="contact">
                                <button type="submit"  name="g" value="提交" class="btn btn1">提交</button>
                            </div>
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
