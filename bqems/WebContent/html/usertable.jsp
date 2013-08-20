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
</head>
<body>

	<div class="row-fluid sortable">
		<div class="box-content">
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
				</tbody>
			</table>

		</div>
	</div>
</body>

<script type="text/javascript">
	function load() {
		$.ajax({
			type : "POST",
			url : 'userListService?format=list',
			cache : false,
			success : function(data) {
				var tableStr = "";
				var dataArray = eval(data);
				var len = dataArray.length;
				if (len >= 10) {
					len = 10;
				}
				for ( var i = 0; i < len; i++) {
					var str = "<tr>";
					str += "<td class=\"center\">" + dataArray[i].username
							+ "</td>";
					str += "<td class=\"center\">" + dataArray[i].password
							+ "</td>";
					str += "<td class=\"center\">" + dataArray[i].phone
							+ "</td>";
					str += "<td class=\"center\">" + dataArray[i].power
							+ "</td>";
					str += "<td class=\"center\">";
					str += "<a class=\"btn btn-info\" href=\"userListService?format=listone&name="+dataArray[i].username+"\">";
					str += "	<i class=\"icon-edit icon-white\"></i>  ";
					str += "	编辑     ";
					str += "</a>";
					str += "<a class=\"btn btn-danger\" href=\"userListService?format=delete&name="+dataArray[i].username+"\">";
					str += "	<i class=\"icon-trash icon-white\"></i> ";
					str += "	删除";
					str += "	</a>";
					str += "</td>";
					str += "</tr>";
					tableStr = tableStr + str;
				}
				$("#dataTable").append(tableStr);

			}
		});
	}
	load();
</script>
<div style="float: right; width: 100px;">
<a class="btn btn-danger"
			href="html\AddUserTable.jsp"><i class="icon-edit icon-white"></i>添加用户
		</a></div>
</html>