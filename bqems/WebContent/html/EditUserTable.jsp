<%@page import="cdu.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>	
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=realPath1%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/charisma-app.css" rel="stylesheet">
<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
<link href='css/fullcalendar.css' rel='stylesheet'>
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print'>
<link href='css/chosen.css' rel='stylesheet'>
<link href='css/uniform.default.css' rel='stylesheet'>
<link href='css/colorbox.css' rel='stylesheet'>
<link href='css/jquery.cleditor.css' rel='stylesheet'>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
<link href='css/elfinder.min.css' rel='stylesheet'>
<link href='css/elfinder.theme.css' rel='stylesheet'>
<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='css/opa-icons.css' rel='stylesheet'>
<link href='css/uploadify.css' rel='stylesheet'>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="../img/favicon.ico">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function icheck(){
		var phone = document.getElementById("phone").value;
		
		if(phone == ""){
			var obj = document.getElementById("info2");
			obj.style.display = "block";
		}else{
			var obj = document.getElementById("info2");
			obj.style.display = "none";
		}
		if(phone.length!=11){
			var obj1 = document.getElementById("info3");
			obj1.style.display = "block";
		}else{
			var obj1 = document.getElementById("info3");
			obj1.style.display="none";
		}
	}
	function icheck1(){
	var passWord = document.getElementById("password").value;
	if(passWord == ""){
		var obj = document.getElementById("info1");
		obj.style.display = "block";
	}else{
		var obj = document.getElementById("info1");
		obj.style.display = "none";
	}	
	}
	function icheck2(){
	var useName = document.getElementById("username").value;

		if(useName == ""){
			var obj = document.getElementById("info");
			obj.style.display = "block";
		}else{
			var obj = document.getElementById("info");
			obj.style.display = "none";
		}
			
	}
</script>
</head>
<body>
<%-- <%UserBean bean = (UserBean)pageContext.findAttribute("user"); %>
<%=bean.getUsername() %> --%>
<%-- <%= request.getAttributeNames()%> --%>
	<div class="row-fluid sortable">
		<div class="box-content">
		<form action="userListService?format=update&name=${user.username }" method="post">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>用户名</th>
						<th>密码</th>
						<th>电话</th>
						<th>权限</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTable">
					<tr>
						<td class="center">${user.username}</td>
						<td class="center"><input value="${user.password }" style="width: 150px;" id ="password" name ="password" type="password" placeholder="请输入密码" value=""onblur="icheck1()"/><span id = "info1"style="z-index: 1000; color: red; display: none;position: fixed;">密码不能为空</span></td>
						<td class="center"><input value="${user.phone }" style="width: 150px;" id="phone" name ="phone" type="text" size = "11"placeholder="请输入电话" value=""onblur="icheck()"/><br/><span id = "info3"style="z-index: 1000; color: red; display: none;position: relative;">电话不能超过11位数字</span><span id = "info2"style="z-index: 1000; color: red; display: none;position: fixed;">电话不能为空</span></td>
						<td class="center"><select name="power" style="width: 120px;" onblur="icheck()"><option value="1">超级管理员</option><option value="2">管理员</option><option value="3">用户</option></select></td>
						<td class="center"><i class="icon-zoom-in icon-white"></i><input type="submit" value="更新" class="btn btn-success"  style = "width:80px;"href="#">
							
						</a> <a class="btn btn-info" href="html\usertable.jsp"> <i
								class="icon-edit icon-white"></i> 取消
						</a> </td>
					</tr>
				</tbody>
			</table>
			</form>

		</div>
	</div>
</body>


</html>