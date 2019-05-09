<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <script type="text/javascript" src="../js/jquery.min.js"></script> 
    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"/>
     
    <!-- 导入easyUI文件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/icon.css">   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery-1.8.0.min.js" charset="utf-8"></script>   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery.easyui.min.js" charset="utf-8"></script> 
	 
	<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>  
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/datebox.css">   
	 	
    <title>User Registration</title>
  </head>
  
  <body>

	  <div align="center" class="easyui-panel">
	  	<h2>User Registration</h2>
	  	<input type="hidden" id="type" name="type">
	  	<div align="center" id="userTypeDiv">
	  		<h3>Please select the type of user to register: </h3>
	  		<input type="radio" id="menu1" name="radio1" value="1"/>Personal User 
			<input type="radio" id="menu2" name="radio1" value="0"/>Company User<br/>
			<a href="javascript:void(0)" onclick="chooseType();">OK</a>
			<a href="javascript:void(0)">Cancel</a>
	  	</div>
	  	
	  	<div align="center" id="commonInfoDiv" style="display: none">
	  		<div style="color: red" id="showMsg"></div>
	    	<input type="hidden" name="id" id="id"/>
	    	*Login Name: <input class="easyui-validatebox" type="text" id="loginName" name="loginName" onblur="valiName();"/><span id="nameMsg" style="color: red"></span><br/>
	    	*Login Password: <input class="easyui-validatebox" type="password" id="loginPass" name="loginPass" onblur="valiPass();"/>(6-12 digits)<span id="passMsg" style="color: red"></span><br/>
	    	*Confirm Password: <input class="easyui-validatebox" type="password" id="rePass" name="rePass" onblur="valiRePass();"/><span id="rePassMsg" style="color: red"></span><br/>
	    	*<span id="nameSpan"></span><input class="easyui-validatebox" type="text" id="name" name="name" onblur="valiTrueName();"/><span id="trueNameMsg" style="color: red"></span><br/>
	    	*Address: <input class="easyui-validatebox" type="text" id="address" name="address" onblur="valiAddress();"/><span id="addressMsg" style="color: red"></span><br/>
	    	*Telephone Number: <input class="easyui-validatebox" type="text" id="number" name="number" onblur="valiNumber();"/><span id="numberMsg" style="color: red"></span><br/>
	  	</div>
	  	
	    <div align="center" id="personInfoDiv" style="display: none">	    		
	    	Sex: <input type="radio" name="sex" value="Male" checked="checked"  checked="checked"/>Male
			<input type="radio" name="sex" value="Female"/>Female <input type="radio" name="sex" value=""/>Secret <br/>
			Birthday: <input id="birthday" name="birthday" class="easyui-datebox" data-options="required:true,formatter :function(date){
				var y = date.getFullYear();
				var m = date.getMonth()+1;
				var d = date.getDate();
				return y+'-'+m+'-'+d;}" value="1980-1-1" style="width:150px" />  
			<br>				
	    	<a href="javascript:void(0)" onclick="validate();">Register</a>
	    	<a href="javascript:void(0)">Cancel</a>
	    </div>
	    	    	
	    <div align="center" id="companyInfoDiv" style="display: none">
	    	*Company Type: <select name="companyType" id="companyType" >
	    		<option></option>
	    		<option value="Public security">Public security (including police stations, prisons, courts, etc.)</option>
	    		<option value="Transportation">Transportation (including subway, railway, aviation, etc.)</option>
	    		<option value="Finance">Finance (including banks, securities, etc.)</option>
	    		<option value="IT or internet">IT or internet</option>
	    		<option value="Manufacturing">Manufacturing</option>
	    		<option value="Other">Other</option>
	    	</select><span id="comTypeMsg" style="color: red"></span><br/>
	    	
	    	*Company Size: <select name="companySize" id="companySize">
	    		<option></option>
	    		<option value="0">Extra large (>1000) </option>
                        <option value="1">Large (500-1000)</option>
                        <option value="2">Middle (100-500)</option>
                        <option value="3">Small (<100)</option>
	    	</select><span id="comSizeMsg" style="color: red"></span> <br/>
	    	
	    	*Company Legal Person: <input class="easyui-validatebox" type="text" id="companyOwner" name="companyOwner" onblur="valiOwner();"/><span id="ownerMsg" style="color: red"></span><br/>
	    	*Company License Registration Number: <input class="easyui-validatebox" type="text" id="companyNumber" name="companyNumber" onblur="valiComNumber();"/><span id="comNumberMsg" style="color: red"></span><br/>
	    		    	
	    	<a href="javascript:void(0)" onclick="validate();">Register</a>
	    	<a href="javascript:void(0)">Cancel</a>
	    <div>
	   
	    
	    </div>
    </div>
  </body>
  
  <script type="text/javascript">
  	
  	var commonInfoDiv=$("#commonInfoDiv");
  	var userTypeDiv=$("#userTypeDiv");
  	var personInfoDiv=$("#personInfoDiv");
  	var companyInfoDiv=$("#companyInfoDiv");
  	var nameSpan=$("#nameSpan");
  	//type
  	var userType=null;
  	//loginName
  	var loginName=null;
  	//loginPass
  	var pass=null;
  	//name
  	var name=null;
  	//address
  	var address=null;
  	//number
  	var number=null;
  	//companyType
  	var companyType=null;
  	//companySize
  	var size=null;
  	//companyOwner
  	var companyOwner=null;
  	//companyNumber
  	var companyNumber=null;
  	//sex
  	var sex=null;
  	//birthday
  	var birthday=null;
  	
  	//
  	var valiname=false;
  	  	  
  

  	function validate(){ 
  		
  		if(userType=="0"){
  			
  			if(valiNumber()==true && valiname==true && valiTrueName()==true && valiPass()==true && valiRePass()==true && valiAddress()==true && valiOwner()==true && valiComNumber()==true && valiSize()==true && valiComType()==true){
							
  				register();
  			}
  		}else if(userType=="1"){
  			if(valiNumber()==true && valiname==true && valiTrueName()==true && valiRePass()==true && valiAddress()==true && valiPass()==true){
  				register();
  			}
  		}else{
  		} 		
  	}
  	

  	function chooseType(){
  		
  		var radio=document.getElementsByName("radio1");
  		  		
  		
  		for(var i=0;i<radio.length;i++){
  			if(radio[i].checked){
  				userType=radio[i].value;
  			}
  		}	
  		$("#type").val(userType);	
  		
  		if(userType=="0"){
  			userTypeDiv.hide();  
  			commonInfoDiv.show();
  			companyInfoDiv.show(); 
  			
  			nameSpan.html("Company Full Name: ");
  			
  			
  		}else{ 
  			userTypeDiv.hide();  
  			commonInfoDiv.show();
  			personInfoDiv.show(); 
  			
  			nameSpan.html("Actual Name: ");
  		}			
  	}
  	

  	function valiName(){
  		loginName=$("#loginName").val();	
  		
  		if(""!=loginName){
 
	  			$.ajax({
					url: "/RochyOnlineStore/user/valiLoginName.do",
					data: {
						'loginName':loginName,	
					},
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	
						if(data=='0'){
							$("#nameMsg").html("Login name already exists, please change! ");
							valiname=false;
						}else{
							$("#nameMsg").html("");
							valiname=true;
						}
					},
					error:function(){
						valiname=false;
						alert('error');
					}
				});

  		}else{
  			$("#nameMsg").html("Login name cannot be empty! ");
  			valiname=false;
  		}
  	}
  	

  	function valiPass(){
  		pass=$("#loginPass").val();
  		if(""!=pass){
  			var length=pass.length;
	  		if(length<6 || length>12){
	  			$("#passMsg").html("The password is incorrect in length! ");
	  			return false;
	  		}else{
	  			$("#passMsg").html("");
	  			return true;
	  		}
  		}else{
  			$("#passMsg").html("Password cannot be empty! ");
  			return false;
  		}
  		
  		
  	}
  	
  	function valiRePass(){
  		var rePass=$("#rePass").val();
  		var pass=$("#loginPass").val();
  		if(""!=rePass && ""!=pass){
  			if(rePass!=pass){
  				$("#rePassMsg").html("Two passwords are not equal! ");
  				return false;
  			}else{
  				$("#rePassMsg").html("");
  				return true;
  			}
  		}else{
  			$("#rePassMsg").html("Please enter your password again! ");
  			return false;
  		}
  	}
  	

  	function valiTrueName(){
  		name=$("#name").val();
  		if(""!=name){
  			$("#trueNameMsg").html("");
  			return true;
  		}else{
  			$("#trueNameMsg").html("Name cannot be empty! ");
  			return false;
  		}
  	}
  	
 
  	function valiAddress(){
  		address=$("#address").val();
  		if(""!=address){
  			$("#addressMsg").html("");
  			return true;
  		}else{
  			$("#addressMsg").html("Address cannot be empty! ");
  			return false;
  		}
  	}
  	

  	function valiNumber(){
  		number=$("#number").val();
  		if(""!=number){
  			$("#numberMsg").html("");
  			return true;
  		}else{
  			$("#numberMsg").html("Number cannot be empty! ");
  			return false;
  		}		
  	}
  	

  	function valiComType(){
  		companyType=$("#companyType").find("option:selected").val();
  		if(""==companyType){
  			$("#comTypeMsg").html("Please select a company type");
  			return false;
  		}else{
  			$("#comTypeMsg").html("");
  			return true;
  		}
  		
  	}
  	
  	
  	function valiSize(){
  		size=$("#companySize").find("option:selected").val();
  		if(""==size){
  			$("#comSizeMsg").html("Please select the size of the company");
  			return false; 
  		}else{
  			$("#comSizeMsg").html("");
  			return true;
  		}
  	}
  	

  	function valiOwner(){
  		companyOwner=$("#companyOwner").val();
  		if(""!=companyOwner){
  			$("#ownerMsg").html("");
  			return true;
  		}else{
  			$("#ownerMsg").html("Company legal person cannot be empty! ");
  			return false;
  		}
  	}
  	

  	function valiComNumber(){
  		companyNumber=$("#companyNumber").val();
  		if(""!=companyNumber){
  			$("#comNumberMsg").html("");
  			return true;
  		}else{
  			$("#comNumberMsg").html("Company registration number cannot be empty! ");
  			return false;
  		}
  	}
  

  

  	function register(){
  			
  		if(userType=="1"){  		
  			
  			var radioSex=document.getElementsByName("sex");
  		  		
  		
	  		for(var i=0;i<radioSex.length;i++){
	  			if(radioSex[i].checked){
	  				sex=radioSex[i].value;
	  			}
	  		}	

  			birthday=$("#birthday").val();
  		}
  		
  		 		
  		$.ajax({
			url: "/RochyOnlineStore/user/register.do",
			data: {
				'type':userType,
				'loginName':loginName,
				'loginPass':pass,
				'name':name,
				'address':address,
				'number':number,
				'companyType':companyType,
				'companySize':size,
				'companyOwner':companyOwner,
				'companyNumber':companyNumber,
				'sex':sex,
				'birthday':birthday				
			},
			
			dataType:"text",
			contentType:"application/x-www-form-unlencoded;charset=utf-8",
			success: function (data) {	
				alert(data);
				window.location.href="../index.jsp";
			},
			error:function(){
				alert('error');
			}
		});
  	}

  </script>
 
</html>
