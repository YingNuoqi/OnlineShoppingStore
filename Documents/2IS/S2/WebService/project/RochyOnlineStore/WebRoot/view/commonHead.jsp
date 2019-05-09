<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>

  <head>
    <script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script> 
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
	 	   
  </head>
   
  	<div align="center">
  					
		<div style="padding-top: 20px;">
			<nav class="navbar navbar-default" role="navigation">
			  <!-- Brand and toggle get grouped for better mobile display -->
			  <div class="navbar-header">
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			      <span class="sr-only">Toggle navigation</span>
			      <span class="icon-bar"></span>
			      <span class="icon-bar"></span>
			      <span class="icon-bar"></span>
			    </button>
			    <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;Homepage</a>
			  </div>
			
			  <!-- Collect the nav links, forms, and other content for toggling -->
			  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Shopping Cart</a></li>
			      <li><a href="#"><span class="glyphicon glyphicon-usd"></span>&nbsp;Order</a></li>
			      <li class="dropdown">
			        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;User Center <b class="caret"></b></a>
			        <ul class="dropdown-menu">
			          <li><a href="#">Action</a></li>
			          <li><a href="#">Another action</a></li>
			          <li><a href="#">Something else here</a></li>
			          <li class="divider"></li>
			          <li><a href="#">Separated link</a></li>
			          <li class="divider"></li>
			          <li><a href="#">One more separated link</a></li>
			        </ul>
			      </li>
			    </ul>

			    <form class="navbar-form navbar-left" role="search">
			      <div class="form-group">
			        <input type="text" class="form-control" placeholder="Search">
			      </div>
			      <button type="submit" class="btn btn-default">Search for products</button>
			    </form>
			    
			    <div>
				    <s:if test="${requestScope.userId!=null && requestScope.userId!=''}">
				    	<p><h4>${requestScope.userId},hi,<span id="HiNameSpan">${requestScope.logUserName}</span></h4></p>
				    </s:if>
				</div>

			    <div align="right">
			  		<div align="left" id="userNameDiv">
			  			<p><h4>hi,<span id="HiNameSpan">${requestScope.logUserName}</span></h4></p>
			  		</div>	 
				</div>

			    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
				  Login
				</button>

				   
			   
			  </div><!-- /.navbar-collapse -->
			</nav>
		</div>
			
	</div>
	

	<div class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title">Modal title</h4>
	      </div>
	      <div class="modal-body">
	        <p>One fine body&hellip;</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
    
  
  
  <script type="text/javascript">

//////////////////////////////////////////////////////////////////////// 	
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
  	
  	var userId=$("#userId").val();
  	var userNameDiv=$("#userNameDiv");
  	var logDiv=$("#logDiv");
  	
  	$(function(){

  		if(null==userId || ""==userId){
  			userNameDiv.hide(); 
			logDiv.show();
  		}else{			
  			userNameDiv.show();
  			logDiv.hide();
  		}		
	});
  	  	  

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
  	

  	function backReg(){
  		userTypeDiv.show();  
  		commonInfoDiv.hide();
  		companyInfoDiv.hide(); 
  		personInfoDiv.hide();
  	}
  	

  	function valiName(){
  		loginName=$("#loginName").val();	
  		
  		if(""!=loginName){
 
	  			$.ajax({
					url: "/RochyOnlineStore/user/valiLoginName.do",
					data: {
						'loginName':loginName,	
						'type':userType
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
				$("#name").val('');
				$("#loginName").val('');
				$("#rePass").val('');
				$("#loginPass").val('');
				
			},
			error:function(){
				alert('error');
			}
		});
  	}
  	
  </script>

