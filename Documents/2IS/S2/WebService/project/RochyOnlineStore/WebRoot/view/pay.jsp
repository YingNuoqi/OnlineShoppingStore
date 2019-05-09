<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pay.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.content{
			background: url(http://blog.bcbsnc.com/wp-content/uploads/2016/11/shutterstock_248825623-1-1080x675.jpg);
			height: 500px;
			text-align: center;
		}
		.sub{
			padding-top: 130px;
			height: 200px;
			opacity: 0.9;
    		background: white;
		}
	</style>

  </head>
  
  <body>
    <!-- payment -->
    <div class ="content" >
    	<div class = "sub">
    		<h2>Payment</h2>
			<form action="/RochyOnlineStore/pay/po.do">
				<!-- Product order number：<input type="text" name="p2_Order"><br/> -->
				Payment amount：<input type="text" name="p3_Amt"><br/>
				Choose the bank：<br/>
				ABC：<input type="radio" name="pd_FrpId" value="ABC-NET-B2C">
				CCB<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"><br/>
				<input type="submit" value="Pay">
			</form>
		</div>
	</div>
  </body>
</html>
