<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <% 
String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=realPath1%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>风速实时监控</title>
<script type="text/javascript" src= "js/jquery.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>

 <link href="css/bootstrap.css" rel="stylesheet"/>
 <link href="css/flat-ui.css" rel="stylesheet"/>
     <script type="text/javascript">
        function al(){
            alert("hello");
        }
    </script>
<script type="text/javascript">
function loady(){
	var flag = 0;
        $.ajax({
           type: "POST",
           url: 'NoiseService1',
           cache: false,
           async: false,
           success: function(data){
               flag = data;
           }
        });
    	return flag;
 }
	$(function () {
	    $(document).ready(function() {
	        Highcharts.setOptions({
	            global: {
	                useUTC: false
	            }
	        });
	   //     var chart;
    $('#container').highcharts({
	            chart: {
	                type: 'spline',
	                marginRight: 10,
	                events: {
	                    load: function() {
	    
	                        // set up the updating of the chart each second
	                        var series = this.series[0];
	                        setInterval(function() {
	                            var x = (new Date()).getTime(), // current time
	                                y = parseFloat(loady());//Math.random();
	                                //alert(y);
	                            series.addPoint([x, y], true, true);
	                        }, 2000);
	                    }
	                }
	            },
	            title: {
	                text: '风速实时数据'
	            },
	            xAxis: {
	                type: 'datetime',
	                tickPixelInterval: 150
	            },
	            yAxis: {
	                title: {
	                    text: '风速（KM/小时）'
	                },
	                plotLines: [{
	                    value: 0,
	                    width: 1,
	                    color: '#808080'
	                }]
	            },
	            tooltip: {
	                formatter: function() {
	                        return '<b>'+ this.series.name +'</b><br/>'+
	                     //   Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
	                     Highcharts.dateFormat('%H:%M:%S', this.x) +'<br/>'+
	                        Highcharts.numberFormat(this.y, 2);
	                }
	            },
	            legend: {
	                enabled: false
	            },
	            exporting: {
	                enabled: false
	            },
	            series: [{
	                name: '风速（KM/小时）',
	                data: (function() {
	                    // generate an array of random data
	                    var data = [],
	                    time = (new Date()).getTime(),
	                        i;
	                    for (i = -10; i <= 0; i++) {
	                        data.push({
	                            x: time + i * 1000,
	                            y: 0
	                        });
	                    }
	                    return data;
	                })()
	            }]
	        });
	    });
	    
	});
</script>
</head>
<body>
<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
<!--  <div class="span3">
    <h3 class="demo-panel-title">控制</h3>

    <table width="100%">
        <tr>
            <td></td><td width="50%">
                <div class="toggle">
                    <label class="toggle-radio" for="toggleOption2" onclick="al();">ON</label>
                    <input type="radio" name="toggleOptions" id="toggleOption1" value="option1" checked="checked">
                    <label class="toggle-radio" for="toggleOption1">OFF</label>
                    <input type="radio" name="toggleOptions" id="toggleOption2" value="option2">
                </div>
            </td>
        </tr>
        <tr><td></td>
            <td>
                <div class="toggle">
                    <label class="toggle-radio" for="toggleOption4">ON</label>
                    <input type="radio" name="toggleOptions2" id="toggleOption3" value="option3">
                    <label class="toggle-radio" for="toggleOption3">OFF</label>
                    <input type="radio" name="toggleOptions2" id="toggleOption4" value="option4" checked="checked">
                </div>
            </td>
        </tr>

    </table>
</div>--> <!-- /toggles span3 -->
<!-- Load JS here for greater good =============================-->
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
<script src="../js/icon-font-ie7.js"></script>
<script src="../js/icon-font-ie7-24.js"></script>
<![endif]-->

</body>
</html>