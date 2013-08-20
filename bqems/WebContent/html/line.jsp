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
    <link rel="shortcut icon" href="img/favicon.ico">
<title>Insert title here</title>
</head>
<body>
<div class="row-fluid sortable">
    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list-alt"></i> 噪声 实时数据 </h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div id="realtimechart1" style="height:190px;"></div>
            <p class="clearfix">You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>
            <p>Time between updates: <input id="updateInterval1" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>
        </div>
    </div><!--/span-->

    <!-- 粉尘实时数据 -->
    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-user"></i> 粉尘 实时数据 </h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div class="box-content">
                <ul class="dashboard-list">
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Usman" src="http://www.gravatar.com/avatar/f0ea51fa1e4fae92608d8affee12f67b.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Usman
                    </a><br>
                        <strong>Since:</strong> 17/05/2012<br>
                        <strong>Status:</strong> <span class="label label-success">Approved</span>
                    </li>
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Sheikh Heera" src="http://www.gravatar.com/avatar/3232415a0380253cfffe19163d04acab.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Sheikh Heera
                    </a><br>
                        <strong>Since:</strong> 17/05/2012<br>
                        <strong>Status:</strong> <span class="label label-warning">Pending</span>
                    </li>
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Abdullah" src="http://www.gravatar.com/avatar/46056f772bde7c536e2086004e300a04.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Abdullah
                    </a><br>
                        <strong>Since:</strong> 25/05/2012<br>
                        <strong>Status:</strong> <span class="label label-important">Banned</span>
                    </li>
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Saruar Ahmed" src="http://www.gravatar.com/avatar/564e1bb274c074dc4f6823af229d9dbb.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Saruar Ahmed
                    </a><br>
                        <strong>Since:</strong> 17/05/2012<br>
                        <strong>Status:</strong> <span class="label label-info">Updates</span>
                    </li>
                </ul>
            </div>
        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list-alt"></i> 温度 实时数据 </h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div id="realtimechart" style="height:190px;"></div>
            <p class="clearfix">You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>
            <p>Time between updates: <input id="updateInterval" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>
        </div>
    </div><!--/span-->
</div><!--/row-->

<div class="row-fluid sortable">
    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> 光照 实时数据 </h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content buttons">
            <p class="btn-group">
                <button class="btn">Left</button>
                <button class="btn">Middle</button>
                <button class="btn">Right</button>
            </p>
            <p>
                <button class="btn btn-small"><i class="icon-star"></i> Icon button</button>
                <button class="btn btn-small btn-primary">Small button</button>
                <button class="btn btn-small btn-danger">Small button</button>
            </p>
            <p>
                <button class="btn btn-small btn-warning">Small button</button>
                <button class="btn btn-small btn-success">Small button</button>
                <button class="btn btn-small btn-info">Small button</button>
            </p>
            <p>
                <button class="btn btn-small btn-inverse">Small button</button>
                <button class="btn btn-large btn-primary btn-round">Round button</button>
                <button class="btn btn-large btn-round"><i class="icon-ok"></i></button>
                <button class="btn btn-primary"><i class="icon-edit icon-white"></i></button>
            </p>
            <p>
                <button class="btn btn-mini">Mini button</button>
                <button class="btn btn-mini btn-primary">Mini button</button>
                <button class="btn btn-mini btn-danger">Mini button</button>
                <button class="btn btn-mini btn-warning">Mini button</button>
            </p>
            <p>
                <button class="btn btn-mini btn-info">Mini button</button>
                <button class="btn btn-mini btn-success">Mini button</button>
                <button class="btn btn-mini btn-inverse">Mini button</button>
            </p>
        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> 湿度 实时数据 </h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content  buttons">
            <p>
                <button class="btn btn-large">Large button</button>
                <button class="btn btn-large btn-primary">Large button</button>
            </p>
            <p>
                <button class="btn btn-large btn-danger">Large button</button>
                <button class="btn btn-large btn-warning">Large button</button>
            </p>
            <p>
                <button class="btn btn-large btn-success">Large button</button>
                <button class="btn btn-large btn-info">Large button</button>
            </p>
            <p>
                <button class="btn btn-large btn-inverse">Large button</button>
            </p>
            <div class="btn-group">
                <button class="btn btn-large">Large Dropdown</button>
                <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="icon-star"></i> Action</a></li>
                    <li><a href="#"><i class="icon-tag"></i> Another action</a></li>
                    <li><a href="#"><i class="icon-download-alt"></i> Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="icon-tint"></i> Separated link</a></li>
                </ul>
            </div>

        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> Weekly Stat</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <ul class="dashboard-list">
                <li>
                    <a href="#">
                        <i class="icon-arrow-up"></i>
                        <span class="green">92</span>
                        New Comments
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-down"></i>
                        <span class="red">15</span>
                        New Registrations
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus"></i>
                        <span class="blue">36</span>
                        New Articles
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-comment"></i>
                        <span class="yellow">45</span>
                        User reviews
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-up"></i>
                        <span class="green">112</span>
                        New Comments
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-down"></i>
                        <span class="red">31</span>
                        New Registrations
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus"></i>
                        <span class="blue">93</span>
                        New Articles
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-comment"></i>
                        <span class="yellow">254</span>
                        User reviews
                    </a>
                </li>
            </ul>
        </div>
    </div><!--/span-->
</div><!--/row-->

<!-- external javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- jQuery -->
<!-- <script src="../js/jquery-1.7.2.min.js"></script> -->
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

</body>
</html>