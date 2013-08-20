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
<title>Insert title here</title>
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
    <link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
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
<script type="text/javascript" src= "js/jquery.js"></script>
</head>
<body>
<form name="form1" action="SendMessage" method="POST">
<table>
<tr><td>选择发送人员</td><td>
<input type="text" name="phone" value="18782966379"/>
</td></tr>
<tr><td>发送信息</td><td>
<textarea name="sendMessage">A地区环境数据异常，请注意查看！</textarea></td></tr>
<tr><td></td><td><input type="submit" value="提交"/></td></tr>
</table>
</form>
<br/>
<div class="row-fluid sortable">
        <div class="box-content">
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>序号</th>
								  <th>发送时间</th>
								  <th>发送的电话号码</th>
								  <th>发送的信息</th>
								  <th>操作</th>
							  </tr>
						  </thead>   
						  <tbody id="dataTable">
						  </tbody>
					  </table>    
					 
        </div>
    </div><!--/span-->

</body>
<script type="text/javascript">

 function load(){	 
	 $.ajax({
         type: "POST",
         url: 'QueryMessageService',
         cache: false,
         async: false,
         success: function(data){
        	 var tableStr ="";
        	  var dataArray=eval(data);
        	  var len = dataArray.length; 
        	  
        	  if(len>=10){ 
        	    len = 10; 
        	  } 
        	  for(var i=0 ;i<len ; i++){ 
        		  
        		  var str="<tr>";
        		   str+="<td>"+(i+1)+"</td>";
        			  str+="<td class=\"center\">"+dataArray[i].sendTime+"</td>";
        			  str+="<td class=\"center\">"+dataArray[i].sendPhone+"</td>";
        			  str+="<td class=\"center\">"+dataArray[i].sendMessage+"</td>";
        			 
        				  str+="<td class=\"center\">";
        			
        						
        								  str+="<a class=\"btn btn-danger\" href=\"deleteMessageService?sendId="+dataArray[i].sendId+"\">";
        								  str+="	<i class=\"icon-trash icon-white\"></i> ";
        								  str+="	Delete";
        									  str+="	</a>";
        										  str+="</td>";
        											  str+="</tr>";
				 tableStr = tableStr +  str; 
        	  } 
        	 // tableStr = tableStr + "</table>"; 
        	  //将动态生成的table添加的事先隐藏的div中. 
        	//  alert(tableStr);
        	  $("#dataTable").append(tableStr); 
         }
      });
	  
 }
load();

</script>
</html>