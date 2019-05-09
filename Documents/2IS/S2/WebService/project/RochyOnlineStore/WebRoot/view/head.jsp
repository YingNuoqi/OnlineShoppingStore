<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>


	
		<div style="padding-top: 20px;">
			<nav class="navbar navbar-default" role="navigation" >
			  <!-- Brand and toggle get grouped for better mobile display -->
			  <div class="navbar-header" >
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			      <span class="sr-only">Toggle navigation</span>
			      <span class="icon-bar"></span>
			      <span class="icon-bar"></span>
			      <span class="icon-bar"></span>
			    </button>
			    <a class="navbar-brand" href="../view/main.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Homepage</a>
			  </div>
			
			  <!-- Collect the nav links, forms, and other content for toggling -->
			  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="../view/shopcar.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Shopping Cart</a></li>
			      <li><a href="../view/myOrders.jsp"><span class="glyphicon glyphicon-usd"></span>&nbsp;Order</a></li>
			      <li class="dropdown">
			        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;User Center <b class="caret"></b></a>
			        <ul class="dropdown-menu">
			          <li><a href="../view/newsList.jsp">My Security Information</a></li>
			        </ul>
			      </li>
			    </ul>
			    
			
  				<div>
			    <form class="navbar-form navbar-left" role="search">
			      <div class="form-group">
			        <input type="text" class="form-control" placeholder="Search" id="serchText">
			      </div>
			      <button type="submit" class="btn btn-default" onclick="serchProduct();">Search for products</button>
			    </form>
				</div>
			    
			    <input type="hidden" id="hiddenUserId" value="${logUserId}"/>

			    <div align="right">
			  		<div align="left" id="userNameDiv">
			  			<p><h4>[id:<span id="HiIdSpan"></span>]&nbsp;★Welcome, <span id="HiNameSpan" title="${logUserName}"></span></span></h4></p>
			  		</div>	 
				</div>

		  		<div id="logDiv" align="right" class="nav navbar-nav navbar-right">
				    <nav class="main_nav"> 
					    <ul> 
					        <li><a class="cd-signin" href="#0">Login&nbsp;&nbsp;&nbsp;&nbsp;</a></li> 
					        <li><a class="cd-signup" href="#0">Register&nbsp;&nbsp;&nbsp;&nbsp;</a></li> 
					    </ul> 	    
					</nav> 
				</div>

				<div id="exitDiv" align="right" class="nav navbar-nav navbar-right">
					<a class="cd-signin" href="#0" onclick="exit();">Sign Out&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</div>
			
			   
			   
			  </div>
			</nav>
		</div>
			
	
	
	<div class="cd-user-modal">  
	    <div class="cd-user-modal-container" id="logAndRegDiv"> 
	        <ul class="cd-switcher"> 
	            <li><a href="#0">Login</a></li> 
	            <li><a href="#0">Register</a></li> 
	        </ul> 
	 
	        <div id="cd-login">  
	            <form class="cd-form" action="/RochyOnlineStore/user/login.do"> 
	                <div align="center" class="easyui-panel" style="width: 600px; height: 400px;padding-top: 50px;">
		                <div class="input-group" style="width:300px;">
						  <span class="input-group-addon">Login Name</span>
						  <input type="text" class="form-control" id="lloginName" name="lloginName" onblur="lvaliName();"/>
						</div><span id="lnameMsg" style="color: red"></span><br/>
		                
				        <div class="input-group" style="width:300px;">
						  <span class="input-group-addon">Login Password</span>
						  <input type="password" class="form-control" id="lloginPass" name="lloginPass" onblur="lvaliPass();"/>
						</div><span id="lpassMsg" style="color: red"></span><br/>          
			    		<a href="javascript:void(0)" onclick="lsub();">Login</a>
			    		<a href="javascript:void(0)">Cancel</a>   		
		    		</div>
	            </form> 
	        </div> 
	 
	        <div id="cd-signup">  
	            <form class="cd-form"> 
	                <div align="center" class="easyui-panel" style="width: 600px; height: 400px;">
					  	<input type="hidden" id="type" name="type">
					  	<div align="center" id="userTypeDiv"><br/>
					  		<h4>Please select the type of user to register: </h4>
					  		<input type="radio" id="menu1" name="radio1" value="1"/>Personal User 
							<input type="radio" id="menu2" name="radio1" value="0"/>Company User<br/><br/>
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
							<input type="radio" name="sex" value="Female"/>Female<input type="radio" name="sex" value=""/>Secret<br/>
							Birthday: <input id="birthday" name="birthday" class="easyui-datebox" data-options="required:true,formatter :function(date){
								var y = date.getFullYear();
								var m = date.getMonth()+1;
								var d = date.getDate();
								return y+'-'+m+'-'+d;}" value="1980-1-1" style="width:150px" />  
							<br>				
					    	<a href="javascript:void(0)" onclick="validate();">Register</a>
					    	<a href="javascript:void(0)" onclick="backReg();">Return</a>
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
					    	<a href="javascript:void(0)" onclick="backReg();">Return</a>
					    	
					    	</div>
					    <div>
					   
					    
					    </div>
				    </div>
	            </form> 
	        </div>         
	    </div> 
	</div>  
  
  
  <script type="text/javascript">
  
  	jQuery(document).ready(function($){ 
	    var $form_modal = $('.cd-user-modal'), 
	        $form_login = $form_modal.find('#cd-login'), 
	        $form_signup = $form_modal.find('#cd-signup'), 
	        $form_modal_tab = $('.cd-switcher'), 
	        $tab_login = $form_modal_tab.children('li').eq(0).children('a'), 
	        $tab_signup = $form_modal_tab.children('li').eq(1).children('a'), 
	        $main_nav = $('.main_nav'); 
	 
	    $main_nav.on('click', function(event){ 
	 
	        if( $(event.target).is($main_nav) ) { 
	            // on mobile open the submenu 
	            $(this).children('ul').toggleClass('is-visible'); 
	        } else { 
	            // on mobile close submenu 
	            $main_nav.children('ul').removeClass('is-visible'); 
	            //show modal layer 
	            $form_modal.addClass('is-visible');     
	            //show the selected form 
	            ( $(event.target).is('.cd-signup') ) ? signup_selected() : login_selected(); 
	        } 
	 
	    }); 
	 

	    $('.cd-user-modal').on('click', function(event){ 
	        if( $(event.target).is($form_modal) || $(event.target).is('.cd-close-form') ) { 
	            $form_modal.removeClass('is-visible'); 
	        }     
	    }); 

	    $(document).keyup(function(event){ 
	        if(event.which=='27'){ 
	            $form_modal.removeClass('is-visible'); 
	        } 
	    }); 

	    $form_modal_tab.on('click', function(event) { 
	        event.preventDefault(); 
	        ( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected(); 
	    }); 
	 
	    function login_selected(){ 
	        $form_login.addClass('is-selected'); 
	        $form_signup.removeClass('is-selected'); 
	        $tab_login.addClass('selected'); 
	        $tab_signup.removeClass('selected'); 
	    } 
	 
	    function signup_selected(){ 
	        $form_login.removeClass('is-selected'); 
	        $form_signup.addClass('is-selected');  
	        $tab_login.removeClass('selected'); 
	        $tab_signup.addClass('selected'); 
	    } 
 
	});
	
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
  	
  	var userId=$("#hiddenUserId").val();
  	var userNameDiv=$("#userNameDiv");
  	var logDiv=$("#logDiv");
  	var exitDiv=$("#exitDiv");
  	

  	$(function(){

  		if(null==userId || ""==userId){
  			userNameDiv.hide(); 
			logDiv.show();
			exitDiv.hide();
  		}else{ 			
  			userNameDiv.show();
  			logDiv.hide();
  			exitDiv.show();
  		}		
	});
	

	function exit(){
		userNameDiv.hide(); 
		logDiv.show();
		exitDiv.hide();
	};
  	  	  
  

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
  	
  	

  	function serchProduct(){
  		var text=$("#serchText").val();
  		window.open("productList.jsp"+"?text="+text);
  	}
  	
  	
  </script>

