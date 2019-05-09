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
  			
  			nameSpan.html("Company Name：");
  			
  			
  		}else{ //personal
  			userTypeDiv.hide(); 
  			commonInfoDiv.show();
  			personInfoDiv.show(); 
  			
  			nameSpan.html("Real Name：");
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
					},
					//data:  "id=" + $('#J_UserName').val() + "&pass=" + $('#J_Pass').val(),
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	
						if(data=='0'){
							$("#nameMsg").html("Login name existed, please change");
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
  			$("#nameMsg").html("login name can't be empty");
  			valiname=false;
  		}
  	}
  	
  	function valiPass(){
  		pass=$("#loginPass").val();
  		if(""!=pass){
  			var length=pass.length;
	  		if(length<6 || length>12){
	  			$("#passMsg").html("password length error");
	  			return false;
	  		}else{
	  			$("#passMsg").html("");
	  			return true;
	  		}
  		}else{
  			$("#passMsg").html("password can't be empty");
  			return false;
  		}
  		
  		
  	}
  	
  	function valiRePass(){
  		var rePass=$("#rePass").val();
  		var pass=$("#loginPass").val();
  		if(""!=rePass && ""!=pass){
  			if(rePass!=pass){
  				$("#rePassMsg").html("two password not equal");
  				return false;
  			}else{
  				$("#rePassMsg").html("");
  				return true;
  			}
  		}else{
  			$("#rePassMsg").html("please enter password again");
  			return false;
  		}
  	}
  	
  	function valiTrueName(){
  		name=$("#name").val();
  		if(""!=name){
  			$("#trueNameMsg").html("");
  			return true;
  		}else{
  			$("#trueNameMsg").html("name can't be empty");
  			return false;
  		}
  	}
  	
  	function valiAddress(){
  		address=$("#address").val();
  		if(""!=address){
  			$("#addressMsg").html("");
  			return true;
  		}else{
  			$("#addressMsg").html("地址不能为空");
  			return false;
  		}
  	}
  	
  	function valiNumber(){
  		number=$("#number").val();
  		if(""!=number){
  			$("#numberMsg").html("");
  			return true;
  		}else{
  			$("#numberMsg").html("number can't be empty");
  			return false;
  		}		
  	}
  	
  	function valiComType(){
  		companyType=$("#companyType").find("option:selected").val();
  		if(""==companyType){
  			$("#comTypeMsg").html("please choose company type");
  			return false;
  		}else{
  			$("#comTypeMsg").html("");
  			return true;
  		}
  		
  	}
  	
  	function valiSize(){
  		size=$("#companySize").find("option:selected").val();
  		if(""==size){
  			$("#comSizeMsg").html("please choose company size");
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
  			$("#ownerMsg").html("company owner can't be empty");
  			return false;
  		}
  	}
  	
  	function valiComNumber(){
  		companyNumber=$("#companyNumber").val();
  		if(""!=companyNumber){
  			$("#comNumberMsg").html("");
  			return true;
  		}else{
  			$("#comNumberMsg").html("company number can't be empty");
  			return false;
  		}
  	}
  
  	function validate(){ 

  		//personal 
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
  		//personal
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
			//data:  "id=" + $('#J_UserName').val() + "&pass=" + $('#J_Pass').val(),
			dataType:"text",
			contentType:"application/x-www-form-unlencoded;charset=utf-8",
			success: function (data) {	
				//var data=eval("("+data+")");
				alert(data);
				window.location.href="../index.jsp";
			},
			error:function(){
				alert('error');
			}
		});
  	}