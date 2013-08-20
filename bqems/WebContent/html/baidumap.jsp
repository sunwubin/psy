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
<title>分布采集点</title>
<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> 
<style type="text/css">
   html{height:100%}
 body{height:100%;margin:0px;padding:0px}
   #search{
    width: 50%;
    height: 5%;
   }
   #main{
  float:left;
    height:95%;
  width:100%;
   }
   #result{
    float:left;
    height: 95%;
    width: 0%;
   }
  </style>
</head>
<body>
<div id="search">
    <!--  公交路线查询：<input id="begin" />到<input id="end"/><input type="button" id="btn_search"  value="搜索"/>-->
   </div>
   <div id="main"></div>
   <div id="result"></div>
    <script type="text/javascript">
     //创建地图实例
     var map=new BMap.Map("main");
     //创建点坐标
     var point=new BMap.Point(104.18455235732087,30.651250259606243);
     //初始化地图，设置中心点坐标和地图级别
     map.centerAndZoom(point, 15);
     //向地图添加控件
     map.addControl(new BMap.NavigationControl());  //地图平移缩放控件，默认左上角  
  map.addControl(new BMap.OverviewMapControl({isOpen: 1})); //缩略地图控件，默认右下角
     map.enableScrollWheelZoom(true);        //启用鼠标滚动缩放地图
     map.enableKeyboard();        //启用键盘上下左右键移动地图
  //创建标注 ,并将标注添加到地图中  
  var marker = new BMap.Marker(point);        
  map.addOverlay(marker);  
  //给标注添加事件
  marker.addEventListener("click", function(e){  
    map.openInfoWindow(infoWindow, e.point); //打开信息窗口
  }); 
  //启用标注拖拽功能,并及时获取标注最新位置
  marker.enableDragging();  
  marker.addEventListener("dragend", function(e){  
    alert("当前位置：" + e.point.lng + ", " + e.point.lat);  
  }) 
  
  //创建信息窗口对象  
  var opts = {  
   width : 100,     // 信息窗口宽度  
   height: 50,     // 信息窗口高度  
   title : "这是成都大学"  //信息窗口标题  
  }  
  var infoWindow = new BMap.InfoWindow("", opts);  

  //公交查询
  $("#btn_search").click(function (){
   $("#main").css("width","50%");
   $("#result").css("width","20%");
   var transit = new BMap.TransitRoute(map, {  
    renderOptions: {map: map, panel: "result",autoViewport: true } 
   });  
   transit.search($("#begin").val(), $("#end").val());  
  });
    </script>

</body>
</html>