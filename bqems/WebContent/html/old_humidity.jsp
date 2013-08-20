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
	<script type="text/javascript">
	
	 
	   $(function () {
			  $.ajax({
		           type: "POST",
		           url: 'oldhumidity1',
		           cache: false,
		           async: false,
		           success: function(data){   
		        	var  array = data.split(",");
					var  datas = new Array([array.length]);
		        	
		            for ( var int = 0; int < array.length; int++) {
					     datas[int] = parseFloat(array[int])
				    }		
		   	        $('#container').highcharts({
			            chart: {
			                zoomType: 'x',
			                spacingRight: 20
			            },
			            title: {
			                text: '湿度历史数据'
			            },
			           
			            xAxis: {
			                type: 'datetime',
			                maxZoom:  14*24 * 3600000, // fourteen days
			                title: {
			                    text: null
			                }
			            },
			            yAxis: {
			                title: {
			                    text: '比例'
			                }
			            },
			            tooltip: {
			                shared: true
			            },
			            legend: {
			                enabled: false
			            },
			            plotOptions: {
			                area: {
			                    fillColor: {
			                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
			                        stops: [
			                            [0, Highcharts.getOptions().colors[0]],
			                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
			                        ]
			                    },
			                    lineWidth: 1,
			                    marker: {
			                        enabled: false
			                    },
			                    shadow: false,
			                    states: {
			                        hover: {
			                            lineWidth: 1
			                        }
			                    },
			                    threshold: null
			                }
			            },
			            
			            //var db = ""

			            series: [{
			                type: 'area',
			                name: '湿度大小',
			                pointInterval: 24 * 3600 * 1000,
			                pointStart: Date.UTC(2013, 01, 01),
			                data: datas
			            }]
			        });
		           }
		        });
	    });
 
		</script>
</head>
<body>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<!-- jQuery -->
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
 <div class="row-fluid sortable">
    

  
        <div class="box-content">
         <!--  <form class="form-horizontal">
           <div class="control-group">
								<label class="control-label" for="selectError">选择采集点：</label>
								<div class="controls">
								  <select id="selectError" data-rel="chosen">
									<option>成都大学</option>
									<option>Option 2</option>
									<option>Option 3</option>
									<option>Option 4</option>
									<option>Option 5</option>
								  </select>
								  </div><br/>
								 <label class="control-label" for="selectYear">选&nbsp;择&nbsp;时&nbsp;间&nbsp;：</label>
								 <div class="controls">
								 <select id="selectYear" data-rel="chosen">
									<option>2013年</option>
									<option>2012年</option>
									
								  </select>
								 &nbsp;&nbsp;&nbsp;&nbsp; <button type="submit" class="btn btn-primary">查询</button> &nbsp;&nbsp;&nbsp;&nbsp; <button type="button" class="btn btn-primary">导出Excel</button>
								</div>
							  </div>
							  
          </form> -->
          </div>
          </div>
<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

</body>
</html>