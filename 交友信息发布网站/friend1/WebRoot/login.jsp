<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<head>

    <meta charset="utf-8">
    

    <title>friend-login</title>
<%@ include file="head.jsp" %>

</head>

<body>

   

    <div class="container">


        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>登录</strong>
                    </h2>
                    <hr>
                    <div class="text-center">
                    <p>现在，登上你的账户，开始你的交友之旅吧！</p>
                    <p><small>请正确输入您的账号和密码。</small></p>
                    </div>
					<br><br>
					<form role="form" action="helpLogin" method="post" class="col-lg-12 text-center">
                        <div class="col-lg-6 center">
                            <label>登录名称</label>
                            <input input type=text name="logname" class="form-control">
             
                            <label>输入密码</label>
                            <input type=password name="password"  class="form-control">
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="form-group col-lg-12">
                                <input type="hidden" name="save" value="contact">
                                <button type="submit"  name="g" value="提交"  class="btn btn1">提交</button>
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
 