<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <title>MIAGE Security Product Shopping System Backstage -Administrators Login</title>
    <style type="text/css">
     #container
     {
     	width:900px;
     	height:390px;
     	background-color:#87CEFA;
     	float:none;
     	margin-top:100;
     	margin-bottom:100;
     	margin-left:auto;
     	margin-right:auto;
     	
     	}
        </style>
        
        <script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js" charset="utf-8"></script>   
  
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
     
    <!-- 导入easyUI文件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/icon.css">   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.5/jquery.easyui.min.js" charset="utf-8"></script> 
	 
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>  
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/default/datebox.css">   
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
	<!--<script type="text/javascript" src="<%=basePath%>/js/register.js"></script>
	-->
	<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
</head>
<body style="background-image: ../../images/bg.jpg">
    <form id="form1">
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div id="container" style="background-color: #FFCCCC; color: #FFFFFF;">
    
        <br />
        <br />
        <br />
        <br />
        <div align="center"><font size="5" color="white">Welcome to MIAGE Backstage Management System</font></div>
        <br/>
    <table align="center" border="0"  bordercolor="Gray" cellpadding="0"
          width="400px" style="filter:Alpha(opacity=70)">
        <tr height="40px">
            <td width="150px">
               &nbsp;&nbsp; Username：</td>
            <td width="300">
                &nbsp;&nbsp;<input type="text" id="name"/>
                    &nbsp;&nbsp;
              
        </tr>
        <tr height="40px">
            <td >
                &nbsp;&nbsp; Password：</td>
            <td width="300">
                &nbsp;&nbsp;<input type="password" id="pass">
                    </td>
        </tr>
        
        
    </table>
    
  <div >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <center><input type="button" value="Login" onclick="login();" style="color: black;">
            
            &nbsp;&nbsp;
            <input type="reset" value="Reset" style="color: black;"></center>
 
  </div>
            <br />
    
    </div>
    </form>
    </body>
    
    <script type="text/javascript">
    	
    	
    	function login(){
    	
    		var name=$("#name").val();
    		var pass=$("#pass").val();
    		
    		if(name=='admin' && pass=='admin'){
    			alert("Login Successfully");
				window.open("../admin/adminMain.jsp"); 
    		}else{
    			alert("Username or password error");
    		}
			
    	}
    </script>
</html>
