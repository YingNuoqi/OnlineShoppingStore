<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
  	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js" charset="utf-8"></script>   
  
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
     
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/icon.css">   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.5/jquery.easyui.min.js" charset="utf-8"></script> 
	 
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>  
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/default/datebox.css">   
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
	<!--<script type="text/javascript" src="<%=basePath%>/js/register.js"></script>
	-->
	<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>	
	
	 	
    <title>Administrator Home Page</title>
  </head>
  
  <body>
    <div align="center" class="easyui-panel" style="border: none">
    	<div class="page-header">
			<h1>MIAGE Security Product Shopping System <small>Backstage Management System</small></h1>
		</div>
		
	    <div class="easyui-tabs" style="width:1100px;height:800px;padding:20px;" align="center" >
	    	<div name="personDiv" title="Personal Users Management" style="padding:20px;"> 
				<%@ include file="../admin/manageUser.jsp" %>			   	    
		    </div>  
		     
		    <div id="companyDiv" title="Enterprise Users Management" style="padding:20px;">   
		  		<%@ include file="../admin/ManageCompany.jsp" %>
		    </div>   
		    
		   <%--  <div id="categoryDiv" title="Product Categories Management" style="padding:20px;">   
		    	<%@ include file="../admin/manageCategory.jsp" %>
		    </div>  --%>
		    <div id="productDiv" title="Product Management" data-options="closable:false" style="padding:20px;">   
		        <%@ include file="../admin/manageProduct.jsp" %>
		    </div>  
		     <div id="orderDiv" title="Orders Management" data-options="closable:false" style="padding:20px;">   
		        <%@ include file="../admin/manageOrder.jsp" %>
		    </div> 
		    <%-- <div id="shopCarDiv" title="Security News Management" data-options="closable:false" style="padding:20px;">   
		        <%@ include file="../admin/manageNews.jsp" %>
		    </div> 	 --%>	    
		    <div id="statisticDiv" title="Statistics" data-options="closable:false" style="padding:20px;">   
		        <%@ include file="../admin/data.jsp" %>
		    </div> 
	    	
	    </div>
	</div>    
  </body>
  
  <script type="text/javascript" src="<%=basePath%>/js/adminMain.js"></script>	
</html>
