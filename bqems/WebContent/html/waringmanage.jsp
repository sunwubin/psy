<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <% 
String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"; 
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
    <link rel="shortcut icon" href="html/img/favicon.ico">
</head>
<body>
<div class="row-fluid sortable">
        <div class="box-content">
          <form class="form-horizontal" action="WaringManageService" name="form1">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="dustMax">粉尘最大值(mg/m^3)：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="dustMax" name="dustMax" type="text" value="">
								</div>
								<label class="control-label" for="dustMin">粉尘最小值(mg/m^3)：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="dustMin" type="text" name="dustMin" value="">
								</div>
							  </div>
							    <div class="control-group">
								<label class="control-label" for="humidityMax">湿度最大值&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(%)&nbsp;&nbsp;&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="humidityMax" name="humidityMax" type="text" value="">
								</div>
								<label class="control-label" for="humidityMin">湿度最小值&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(%)&nbsp;&nbsp;&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="humidityMin" name="humidityMin" type="text" value="">
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" for="noiseMax">风速最大值&nbsp;&nbsp;&nbsp;(Km/h)&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="noiseMax" name="noiseMax" type="text" value="">
								</div>
								<label class="control-label" for="noiseMin">风速最小值&nbsp;&nbsp;&nbsp;(Km/h)&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="noiseMin" name="noiseMin" type="text" value="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="pressureMax">压强最大值&nbsp;&nbsp;&nbsp;&nbsp;(Kpa)&nbsp;&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="pressureMax" name="pressureMax" type="text" value="">
								</div>
								<label class="control-label" for="pressureMin">压强最小值&nbsp;&nbsp;&nbsp;&nbsp;(Kpa)&nbsp;&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="pressureMin" name="pressureMin" type="text" value="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="temperatureMax">温度最大值&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(℃)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="temperatureMax" name="temperatureMax" type="text" value="">
								</div>
								<label class="control-label" for="temperatureMin">温度最小值&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(℃)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="temperatureMin" name="temperatureMin" type="text" value="">
								</div>
							  </div>
							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">保存设置</button>
								
							  </div>
							</fieldset>
						  </form>

					 
        </div>
    </div><!--/span-->



<!-- external javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
<!-- transition / effect library -->
<script src="js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="js/bootstrap-typeahead.js"></script>
<!-- tour library -->
<script src="js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- chart libraries start -->
<script src="js/excanvas.js"></script>
<script src="js/jquery.flot.min.js"></script>
<script src="js/jquery.flot.pie.min.js"></script>
<script src="js/jquery.flot.stack.js"></script>
<script src="js/jquery.flot.resize.min.js"></script>
<!-- chart libraries end -->

<!-- select or dropdown enhancer -->
<script src="js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>
<script type="text/javascript">
function load(){	 
	 $.ajax({
        type: "POST",
        url: 'WaringQueryService',
        cache: false,
        async: false,
        success: function(data){
        	var dataArray=eval(data);
        	document.getElementById("dustMax").value=dataArray[0]["dustmax"];
        	document.getElementById("dustMin").value=dataArray[0]["dustmin"];
        	document.getElementById("humidityMax").value=dataArray[0]["humiditymax"];
        	document.getElementById("humidityMin").value=dataArray[0]["humiditymin"];
        	document.getElementById("noiseMax").value=dataArray[0]["noisemax"];
        	document.getElementById("noiseMin").value=dataArray[0]["noisemin"];
        	document.getElementById("pressureMax").value=dataArray[0]["pressuremax"];
        	document.getElementById("pressureMin").value=dataArray[0]["pressuremin"];
        	document.getElementById("temperatureMax").value=dataArray[0]["temperaturemax"];
        	document.getElementById("temperatureMin").value=dataArray[0]["temperaturemin"];
        	
        }
	 });
}
load();
       	  

</script>
</body>
</html>