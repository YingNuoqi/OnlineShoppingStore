

  	function lvaliName(){
  		var lloginName=$("#lloginName").val();
  		if(""==lloginName){
  			$("#lnameMsg").html("Login name can't be empty");
  		}else{
  			$("#lnameMsg").html("");
  		}
  		
  	}  
  	
  	function lvaliPass(){
  		var lloginPass=$("#lloginPass").val();
  		if(""==lloginPass){
  			$("#lpassMsg").html("password can't be empty");
  		}else{
  			$("#lpassMsg").html("");
  		}
  	}
  
  	function lvalidate(){
  		var lloginName=$("#lloginName").val();
  		if(""==lloginName || ""==lloginPass){
  			return false;
  		}else{
  			
  		}
  		
  	}
  
  	function lsub(){
  		
  		var lloginName=$("#lloginName").val();
  		if(""!=lloginName && ""!=lloginPass){
  			$.ajax({
				url: "/RochyOnlineStore/user/login.do",
				data: {
					'type':null,
					'loginName':$('#lloginName').val(),
					'loginPass':$('#lloginPass').val()
				},
				//data:  "id=" + $('#J_UserName').val() + "&pass=" + $('#J_Pass').val(),
				dataType:"text",
				success: function (data0) {
					
					var data=eval('('+data0+')');
					var user=data.user;
					if(user!=null && user!=''){
						var userId=user.id;
						var userName=user.name;
						$("#HiIdSpan").html(userId);
						$("#HiNameSpan").html(userName);
					}
										
					var msg=data.msg;
					alert(msg);
								
					$("#logAndRegDiv").fadeOut("normal");
					
					$("#userNameDiv").show();
					$("#logDiv").hide();
					$("#exitDiv").show();

				},
				error:function(){
					alert("");
					console.info('error');
				}
			});
  		}
  		
 
	   

  	}