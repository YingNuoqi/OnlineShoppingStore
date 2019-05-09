<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<body>
    <div id="main" style="height:300px"></div>
    <div id="test" style="height:50px"></div>
    <div id="main1" style="height:300px"></div>
    
    <script src="../../js/echarts-all-2.2.4.js"></script>
    <script type="text/javascript">
    var data1;var data2;var data3;var data4;var data5;
	var myChart;var option;var myChart1;var option1;
	myChart = echarts.init(document.getElementById('main'));
	myChart1 = echarts.init(document.getElementById('main1'));
//	alert(dataList[0]["value"]);
    $(function(){
	   	 dataList = 	   
		        [            
		        {value:3, name:'Monitoring Device'},
		        {value:2, name:'Alarming Device'},
		        {value:3, name:'Security Checking Device'},
		        {value:4, name:'Anti-fake Device'},
		        {value:5, name:'Entrance Device'}
		    	];

			$.ajax({
				url: "/RochyOnlineStore/statistics/data.do",
				dataType:"json",
				contentType:"application/x-www-form-unlencoded;charset=utf-8",
				async:false,
				success: function (data) {	
					 var dataList = 	   
				        [            
				        {value:data[0], name:'Monitoring Device'},
				        {value:data[1], name:'Alarming Device'},
				        {value:data[2], name:'Security Checking Device'},
				        {value:data[3], name:'Anti-fake Device'},
				        {value:data[4], name:'Entrance Device'}
				    	];

			        	option = {
			        		    title : {
			        		        text: 'Purchase Statistics by Category',
			        		        x:'center'
			        		    },
			        		    tooltip : {
			        		        trigger: 'item',
			        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
			        		    },
			        		    legend: {
			        		        orient : 'vertical',
			        		        x : 'left',
			        		        data:['Monitoring Device','Alarming Device','Security Checking Device','Anti-fake Device','Entrance Device']
			        		    },
			        		    toolbox: {
			        		        show : true,
			        		        feature : {
			        		            mark : {show: true},
			        		            dataView : {show: true, readOnly: false},
			        		            magicType : {
			        		                show: true, 
			        		                type: ['pie', 'funnel'],
			        		                option: {
			        		                    funnel: {
			        		                        x: '25%',
			        		                        width: '50%',
			        		                        funnelAlign: 'left',
			        		                        max: 1548
			        		                    }
			        		                }
			        		            },
			        		            restore : {show: true},
			        		            saveAsImage : {show: true}
			        		        }
			        		    },
			        		    calculable : true,
			        		    series : [
			        		        {
			        		            name:'Category',
			        		            type:'pie',
			        		            radius : '55%',
			        		            center: ['50%', '60%'],
			        		            data:dataList
			        		        }
			        		    ]
			        		};

				        myChart.setOption(option); 
				},
				error:function(){
					alert('error');
				}
			});
			
			
			$.ajax({
				url: "/RochyOnlineStore/statistics/price.do",
				dataType:"json",
				contentType:"application/x-www-form-unlencoded;charset=utf-8",
				async:false,
				success: function (data) {	
					var dataList1 = 	   
						        [            
						        {value:data[0], name:'Monitoring Device'},
						        {value:data[1], name:'Alarming Device'},
						        {value:data[2], name:'Security Checking Device'},
						        {value:data[3], name:'Anti-fake Device'},
						        {value:data[4], name:'Entrance Device'}
						    	];
		        	option1 = {
		        		    title : {
		        		        text: 'Product Sales Statistics (Euros)',

		        		    },
		        		    tooltip : {
		        		        trigger: 'axis'
		        		    },
		        		    legend: {
		        		        data:['Revenue']
		        		    },
		        		    toolbox: {
		        		        show : true,
		        		        feature : {
		        		            mark : {show: true},
		        		            dataView : {show: true, readOnly: false},
		        		            magicType : {show: true, type: ['line', 'bar']},
		        		            restore : {show: true},
		        		            saveAsImage : {show: true}
		        		        }
		        		    },
		        		    calculable : true,
		        		    xAxis : [
		        		        {
		        		            type : 'category',
		        		            data : ['Monitoring Device','Alarming Device','Security Checking Device','Anti-fake Device','Entrance Device']
		        		        }
		        		    ],
		        		    yAxis : [
		        		        {
		        		            type : 'value'
		        		        }
		        		    ],
		        		    series : [
		        		        {
		        		            name:'Revenue',
		        		            type:'bar',
		        		            data:dataList1,
		        		            markPoint : {
		        		                data : [
		        		                    {type : 'max', name: 'Maximum'},
		        		                    {type : 'min', name: 'Minimum'}
		        		                ]
		        		            },
		        		            markLine : {
		        		                data : [
		        		                    {type : 'average', name: 'Average'}
		        		                ]
		        		            }
		        		        }
		        		    ]
		        		};
		        	myChart1.setOption(option1); 
					},
				error:function(){
					alert('error');
				}
				});
        });

        
    </script>
</body>