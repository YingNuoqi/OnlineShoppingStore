<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <head>
    <script type="text/javascript" src="../js/jquery.min.js"></script> 
    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
     
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/icon.css">   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery-1.9.1.min.js" charset="utf-8"></script>   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery.easyui.min.js" charset="utf-8"></script> 
	 
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>  
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/datebox.css">   
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
	<!--<script type="text/javascript" src="<%=basePath%>/js/register.js"></script>
	-->
	<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/head.js"></script>
	 	   
  </head>
  
