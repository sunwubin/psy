<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="cdu.dao.*"%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=realPath1%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="5">
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
						<th>参数类型</th>
						<th>参数值</th>
						<th>参数单位</th>
						<!-- <th>权限</th> -->
						<!-- <th>操作</th> -->
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>粉尘浓度</th>
						<th><%
						float[] a1=new float[5];
						UserDao userDao1 = new UserDao();
						a1=userDao1.getData();

					
		           %>
		           <%=a1[0] %>
		           </th>
		           <th>
		           	mg/m^3
		           </th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>风速</th>
						<th>
		
		           <%=a1[1] %>
						</th>
						<th>
							KM/小时
						</th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>压强</th>
						<th>
		
		           <%=a1[2] %>
						</th>
						<th>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kpa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>温度</th>
						<th>
		
		           <%=a1[3] %>
						</th>
						<th>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;℃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>湿度</th>
						<th>
			
		           <%=a1[4] %>
						</th>
						<th>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</th>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>人体舒适度</th>
						<th>
							<%	
						 double b=(1.818*a1[3]+18.18)*(0.88+0.002*a1[4])+(a1[3]-32)/(45-a1[3])-3.2*a1[1]*(5/18)+18.2; 
						
						%>
						<%=b %>
						</th>
						<th>
							<%
								String c= new String();
								String d= new String();
								if(b>=0&&b<26){
									d="<img alt='scan-4' src='images/scan-pic/scan-4.jpg'/>";
									c="-4级&nbsp;&nbsp;,人体感觉寒冷，极不适应，请注意保暖防寒，防止冻伤!";
								}else if(b>=26&&b<39) {
									d="<img alt='scan-3' src='images/scan-pic/scan-3.jpg'/>";
									c="-3级&nbsp;&nbsp;,人体感觉很冷，很不舒适，请注意保暖防寒!";
								}else if(b>=39&&b<50) {
									d="<img alt='scan-2' src='images/scan-pic/scan-2.jpg'/>";
									c="-2级&nbsp;&nbsp;,人体感觉较冷(清凉)，不舒适，请注意保暖!";
								}else if(b>=50&&b<58) {
									d="<img alt='scan-1' src='images/scan-pic/scan-1.jpg'/>";
									c="-1级&nbsp;&nbsp;,人体感觉略偏凉，较为舒适!";
								}else if(b>=58&&b<70) {
									d="<img alt='scan0' src='images/scan-pic/scan0.jpg'/>";
									c="0级&nbsp;&nbsp;,人体感觉最为舒适，最可接受!";
								}else if(b>=70&&b<75) {
									d="<img alt='scan1' src='images/scan-pic/scan1.jpg'/>";
									c="1级&nbsp;&nbsp;,人体感觉偏暖，较为舒适!";
								}else if(b>=75&&b<80) {
									d="<img alt='scan2' src='images/scan-pic/scan2.jpg'/>";
									c="2级&nbsp;&nbsp;,人体感觉偏热，不舒适，可适当降温!";
								}else if(b>=80&&b<85) {
									d="<img alt='scan3' src='images/scan-pic/scan3.jpg'/>";
									c="3级&nbsp;&nbsp;,人体感觉炎热，很不舒适，请注意防暑降温!";
								}else if(b>=85&&b<88) {
									d="<img alt='scan4' src='images/scan-pic/scan4.jpg'/>";
									c="4级&nbsp;&nbsp;,人体感觉很热，极不适应，请注意防暑降温，以防中暑!";
								}else if(b>=88&&b<100) {
									d="<img alt='scan4' src='images/scan-pic/scan4.jpg'/>";
									c="4级&nbsp;&nbsp;,人体感觉很热，极不适应，请注意防暑降温，以防中暑!";
								}
							%>
							<%=d %>
							<%=c %>
						</th>
					</tr>
				</thead>
				<!-- <tbody id="dataTable">
				</tbody> -->
			</table>
			<!-- <input type="button" value="刷新" onclick="location.reload()" style="float: right; margin-right: 50px;">  -->
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
<!-- <div style="float: right; width: 100px;">
<a class="btn btn-danger"
			href="html\AddUserTable.jsp"><i class="icon-edit icon-white"></i>添加用户
		</a></div> -->
</html>