function loady(){
	var flag = 0;
        $.ajax({
           type: "POST",
           url: '/bqems/hello',
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
	        var chart;
	        $('#content').highcharts({
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
	                text: '粉尘实时数据'
	            },
	            xAxis: {
	                type: 'datetime',
	                tickPixelInterval: 150
	            },
	            yAxis: {
	                title: {
	                    text: 'Value'
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
	                name: '粉尘',
	                data: (function() {
	                    // generate an array of random data
	                    var data = [],
	                        time = (new Date()).getTime(),
	                        i;
	                    for (i = -20; i <= 0; i++) {
	                        data.push({
	                            x: time + i * 2000,
	                            y: 0
	                        });
	                    }
	                    return data;
	                })()
	            }]
	        });
	    });
	    
	});