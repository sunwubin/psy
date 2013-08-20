<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% 
String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"; 
//out.println("web URL 路径:"+realPath1); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=realPath1%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎登陆后台</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/flat-ui.css" rel="stylesheet"/>
</head>
<body style="overflow:hidden">
<script type="text/javascript">

	function icheck(){
	var passWord = document.getElementById("login-pass").value;
	if(passWord == ""){
		var obj = document.getElementById("info1");
		obj.style.display = "block";
	}else{
		var obj = document.getElementById("info1");
		obj.style.display = "none";
	}	
	}
	function icheck1(){
	var useName = document.getElementById("login-name").value;

		if(useName == ""){
			var obj = document.getElementById("info");
			obj.style.display = "block";
		}else{
			var obj = document.getElementById("info");
			obj.style.display = "none";
		}
			
	}
</script>
<div class="container">
    <div style=" height: 100px;"></div>
<div class="login">
    <div class="login-screen">
        <div class="login-icon">
            <img src="images/login/map.png" alt="Welcome to Mail App" />
            <h4> <small>后台管理系统</small></h4>
        </div>
        <form action="userManageService?format=login" method="post">
        <div class="login-form">
            <div class="control-group">
                <input type="text" class="login-field" value="" placeholder="Enter your name"  id="login-name" name="username" onblur="icheck1()"/>
                <span id = "info"style="z-index: 1000; color: red; display: none;">用户名不能为空</span>
                <label class="login-field-icon fui-man-16" for="login-name"></label>
            </div>

            <div class="control-group">
                <input type="password" class="login-field" value="" placeholder="Password" id="login-pass" name="password"onblur="icheck()"/>
                <span id = "info1"style="z-index: 1000; color: red; display: none;">密码不能为空</span>
                <label class="login-field-icon fui-lock-16" for="login-pass"></label>
            </div>
			<input type="submit" class="btn btn-primary btn-large btn-block" value="Login">
<!--             <a class="btn btn-primary btn-large btn-block" href="html/index.jsp">Login</a>
 -->
        </div>
        </form>
    </div>
</div>
</div>
<!-- Load JS here for greater good =============================-->
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
<script src="js/jquery.dropkick-1.0.0.js"></script>
<script src="js/custom_checkbox_and_radio.js"></script>
<script src="js/custom_radio.js"></script>
<script src="js/jquery.tagsinput.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script src="js/jquery.placeholder.js"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script src="js/application.js"></script>
<!--[if lt IE 8]>
<script src="js/icon-font-ie7.js"></script>
<script src="js/icon-font-ie7-24.js"></script>
<![endif]-->

</body>
</html>