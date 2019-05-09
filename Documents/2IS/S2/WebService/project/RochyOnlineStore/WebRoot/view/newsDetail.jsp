<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
   		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js" charset="utf-8"></script>   
	    <script type="text/javascript" src="../js/jquery.min.js"></script> 
	    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	    
	    <!-- Bootstrap -->
	    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
	     

		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/easyui.css">   
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/icon.css">   
		
		<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery.easyui.min.js" charset="utf-8"></script> 
		 
		<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>  
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/datebox.css">   
		
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
		<!--<script type="text/javascript" src="<%=basePath%>/js/register.js"></script>
		-->
		<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
	 	   
	 	<title>Rochy Store</title>
  	</head>
  
  <body>
  
  	<div align="center">
  		<div>
  			<%@ include file="../view/head.jsp" %>
  			<input type="hidden" value="<%=request.getParameter("id")%>" id="newsId" name="newsId"/>
  		</div>
		
  		<div>
  			<div class="jumbotron">
			  <h1 align="center">Security Information</h1>
			</div>		
			
			<br>
			
			<div align="center" style="padding: 50px;">
  				<table id="tb_productDetail" align="center">
  					<tr align="center">
  						<td id="title_td"></td>
  					</tr>
  					<tr>
  						<td id="content_td"  align="center">
  							<span><br/><img alt="" src="../images/news.png"></span><br/>						
  						</td>
  					</tr>
  					<tr>
  						<td style="padding: 70px;"><br/><span id="content_span"></span></td>
  					</tr>
  					
  				</table>
  			</div>
  		</div>
  		
  	</div>
    
  </body>
  
  <script type="text/javascript">
  	var id=$("#newsId").val();
  	
  	$(function(){
  		$.ajax({
				url: "/RochyOnlineStore/news/getNewsById.do",
				data: {
					'id':id            
				},
				dataType:"text",
				contentType:"application/x-www-form-unlencoded;charset=utf-8",
				success: function (data) {	
					var data=eval("("+data+")");
					
					var content=data.content;
					
					$("#title_td").html("<h3>"+data.title+"</h3>");
					$("#content_span").html("<font style='line-height:1.5;'>"+content+"</font>");
					
				},
				error:function(){
					alert('error');
				}
			});   		
  	});
  	
  
  </script>
</html>
