jQuery(document).ready(function($){ 
	    var $form_modal = $('.cd-user-modal'), 
	        $form_login = $form_modal.find('#cd-login'), 
	        $form_signup = $form_modal.find('#cd-signup'), 
	        $form_modal_tab = $('.cd-switcher'), 
	        $tab_login = $form_modal_tab.children('li').eq(0).children('a'), 
	        $tab_signup = $form_modal_tab.children('li').eq(1).children('a'), 
	        $main_nav = $('.main_nav'); 
	 
	    //弹出窗口 
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
	 
	    //关闭弹出窗口 
	    $('.cd-user-modal').on('click', function(event){ 
	        if( $(event.target).is($form_modal) || $(event.target).is('.cd-close-form') ) { 
	            $form_modal.removeClass('is-visible'); 
	        }     
	    }); 
	    //使用Esc键关闭弹出窗口 
	    $(document).keyup(function(event){ 
	        if(event.which=='27'){ 
	            $form_modal.removeClass('is-visible'); 
	        } 
	    }); 
	 
	    //切换表单 
	    $form_modal_tab.on('click', function(event) { 
	        event.preventDefault(); 
	        ( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected(); 
	    }); 
	 
	    function login_selected(){ 
	        $form_login.addClass('is-selected'); 
	        $form_signup.removeClass('is-selected'); 
	        //$form_forgot_password.removeClass('is-selected'); 
	        $tab_login.addClass('selected'); 
	        $tab_signup.removeClass('selected'); 
	    } 
	 
	    function signup_selected(){ 
	        $form_login.removeClass('is-selected'); 
	        $form_signup.addClass('is-selected'); 
	        //$form_forgot_password.removeClass('is-selected'); 
	        $tab_login.removeClass('selected'); 
	        $tab_signup.addClass('selected'); 
	    } 
 
	});

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
  	
  	//页面加载时 
  	$(function(){
  		//尚未登陆时 
  		if(null==userId || ""==userId){
  			userNameDiv.hide(); 
			logDiv.show();
  		}else{  //登陆成功后 			
  			userNameDiv.show();
  			logDiv.hide();
  		}		
	});
  	  	  
  
  	//选择用户类型后的响应 
  	function chooseType(){
  		//得到radio
  		var radio=document.getElementsByName("radio1");
  		  		
  		//遍历radio
  		for(var i=0;i<radio.length;i++){
  			if(radio[i].checked){
  				userType=radio[i].value;
  			}
  		}	
  		$("#type").val(userType);	
  		//如果选择了企业用户 
  		if(userType=="0"){
  			userTypeDiv.hide();  //隐藏选择用户类型的div 
  			commonInfoDiv.show();
  			companyInfoDiv.show(); //显示企业用户注册信息 
  			
  			nameSpan.html("企业全称：");
  			
  			
  		}else{ //如果选择了个人用户 
  			userTypeDiv.hide();  //隐藏选择用户类型的div 
  			commonInfoDiv.show();
  			personInfoDiv.show(); //显示个人用户注册信息  
  			
  			nameSpan.html("真实姓名：");
  		}			
  	}
  	
  	//注册页面 返回上一层 
  	function backReg(){
  		userTypeDiv.show();  
  		commonInfoDiv.hide();
  		companyInfoDiv.hide(); 
  		personInfoDiv.hide();
  	}
  	
  	//校验登录名 
  	function valiName(){
  		loginName=$("#loginName").val();	
  		
  		if(""!=loginName){
 
	  			$.ajax({
					url: "/RochyOnlineStore/user/valiLoginName.do",
					data: {
						'loginName':loginName,	
						'type':userType
					},
					//data:  "id=" + $('#J_UserName').val() + "&pass=" + $('#J_Pass').val(),
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	
						if(data=='0'){
							$("#nameMsg").html("登录名已存在，请更换");
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
  			$("#nameMsg").html("登录名不能为空");
  			valiname=false;
  		}
  	}
  	
  	//校验密码 
  	function valiPass(){
  		pass=$("#loginPass").val();
  		if(""!=pass){
  			var length=pass.length;//密码长度 
	  		if(length<6 || length>12){
	  			$("#passMsg").html("密码长度有误");
	  			return false;
	  		}else{
	  			$("#passMsg").html("");
	  			return true;
	  		}
  		}else{
  			$("#passMsg").html("密码不能为空");
  			return false;
  		}
  		
  		
  	}
  	
  	//校验确认密码 
  	function valiRePass(){
  		var rePass=$("#rePass").val();
  		var pass=$("#loginPass").val();
  		if(""!=rePass && ""!=pass){
  			if(rePass!=pass){
  				$("#rePassMsg").html("两次密码不相等 ");
  				return false;
  			}else{
  				$("#rePassMsg").html("");
  				return true;
  			}
  		}else{
  			$("#rePassMsg").html("请再次输入密码");
  			return false;
  		}
  	}
  	
  	//姓名/企业全称不能为空 
  	function valiTrueName(){
  		name=$("#name").val();
  		if(""!=name){
  			$("#trueNameMsg").html("");
  			return true;
  		}else{
  			$("#trueNameMsg").html("名称不能为空");
  			return false;
  		}
  	}
  	
  	//校验地址 
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
  	
  	//校验电话号码 
  	function valiNumber(){
  		number=$("#number").val();
  		if(""!=number){
  			$("#numberMsg").html("");
  			return true;
  		}else{
  			$("#numberMsg").html("号码不能为空");
  			return false;
  		}		
  	}
  	
  	//校验企业类型 
  	function valiComType(){
  		companyType=$("#companyType").find("option:selected").val();//获取下拉框中选中的文本 
  		if(""==companyType){
  			$("#comTypeMsg").html("请选择企业类型");
  			return false;
  		}else{
  			$("#comTypeMsg").html("");
  			return true;
  		}
  		
  	}
  	
  	//校验企业规模
  	function valiSize(){
  		size=$("#companySize").find("option:selected").val();//获取下拉框中选中的文本 
  		if(""==size){
  			$("#comSizeMsg").html("请选择企业规模");
  			return false; 
  		}else{
  			$("#comSizeMsg").html("");
  			return true;
  		}
  	}
  	
  	//校验企业法人 
  	function valiOwner(){
  		companyOwner=$("#companyOwner").val();
  		if(""!=companyOwner){
  			$("#ownerMsg").html("");
  			return true;
  		}else{
  			$("#ownerMsg").html("企业法人不能为空");
  			return false;
  		}
  	}
  	
  	//校验企业营业执照注册号 
  	function valiComNumber(){
  		companyNumber=$("#companyNumber").val();
  		if(""!=companyNumber){
  			$("#comNumberMsg").html("");
  			return true;
  		}else{
  			$("#comNumberMsg").html("企业注册号不能为空");
  			return false;
  		}
  	}
  
  	//校验 方法 
  	function validate(){ 

  		//如果选择了企业用户 
  		if(userType=="0"){
  			//校验
  			if(valiNumber()==true && valiname==true && valiTrueName()==true && valiPass()==true && valiRePass()==true && valiAddress()==true && valiOwner()==true && valiComNumber()==true && valiSize()==true && valiComType()==true){
				//注册  				
  				register();
  			}
  		}else if(userType=="1"){
  			if(valiNumber()==true && valiname==true && valiTrueName()==true && valiRePass()==true && valiAddress()==true && valiPass()==true){
  				register();
  			}
  		}else{
  		} 		
  	}
  
  	//注册按钮响应方法 
  	function register(){
  		//如果是个人用户 	
  		if(userType=="1"){  		
  			//得到性别radio
  			var radioSex=document.getElementsByName("sex");
  		  		
  			//遍历radio
	  		for(var i=0;i<radioSex.length;i++){
	  			if(radioSex[i].checked){
	  				sex=radioSex[i].value;//获得性别 
	  				//alert(sex);///////////////
	  			}
	  		}	

  			birthday=$("#birthday").val();//////////////////////////生日的获得 
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
				$("#name").val('');
				$("#loginName").val('');
				$("#rePass").val('');
				$("#loginPass").val('');
				//$("#logAndRegDiv").fadeOut("normal");
				
				//window.location.href="../index.jsp";
			},
			error:function(){
				alert('error');
			}
		});
  	}