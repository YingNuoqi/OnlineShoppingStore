<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
     <!-- <script type="text/javascript" src="./js/jquery.min.js"></script>  -->
     <script type="text/javascript" src="./js/jquery-1.9.1.min.js"></script> 
     
     
     <!-- 导入easyUI文件 -->
	<link rel="stylesheet" type="text/css" href="./js/jquery-easyui-1.3.2/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="./js/jquery-easyui-1.3.2/themes/icon.css">   
	<script type="text/javascript" src="./js/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>   
	<script type="text/javascript" src="./js/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>  
	
    <title>用户登录</title>
  </head>
  
  <body>
  	<h2 align="center">用户登录</h2>
  	
    <div align="center" >
    		登录名：<input type="text" id="loginName" name="loginName" onblur="valiName();"/><span id="nameMsg" style="color: red"></span><br/>
    		密&nbsp;码：<input type="password" id="loginPass" name="loginPass" onblur="valiPass();"/><span id="passMsg" style="color: red"></span><br/>
    		<input type="hidden" name="id" id="id"/>
    		<a href="javascript:void(0)" onclick="sub();">登录</a>
    		<a href="javascript:void(0)">取消</a>
    		<a href="./view/register.jsp">注册新用户</a>
    </div>
  </body>
  
  <script type="text/javascript">
  	
  	//登录名 校验是否为空  
  	function valiName(){
  		var loginName=$("#loginName").val();
  		if(""==loginName){
  			$("#nameMsg").html("登录名不能为空");
  		}else{
  			$("#nameMsg").html("");
  		}
  		
  	}
  	
  	//密码  校验是否为空  
  	function valiPass(){
  		var loginPass=$("#loginPass").val();
  		if(""==loginPass){
  			$("#passMsg").html("密码不能为空");
  		}else{
  			$("#passMsg").html("");
  		}
  	}
  
  	//校验 方法 
  	function validate(){
  		var loginName=$("#loginName").val();
  		if(""==loginName || ""==loginPass){
  			return false;
  		}else{
  			
  		}
  		
  	}
  
  	//登录按钮响应方法 
  	function sub(){
  		
  		var loginName=$("#loginName").val();
  		//如果登录名和密码都不为空  则提交 
  		if(""!=loginName && ""!=loginPass){
  			$.ajax({
				url: "/RochyOnlineStore/user/login.do",
				data: {
					'type':null,
					'loginName':$('#loginName').val(),
					'loginPass':$('#loginPass').val()
				},
				//data:  "id=" + $('#J_UserName').val() + "&pass=" + $('#J_Pass').val(),
				dataType:"text",
				success: function (data) {	
					alert(data);
				},
				error:function(){
					alert('error');
				}
			});
  		}
  		
  		
		
		
		//或者以下： 
		
		/*$.post("/httpText/ValiServlet", { id : $('#J_UserName').val(), pass : $('#J_Pass').val() },
		   	function(data){
		     	console.log(data.msg);
		   	}
	   	);*/
	   

  	}

  </script>
 
</html>
