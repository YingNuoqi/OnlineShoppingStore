  	$(function(){
  		$("#addCatWin").hide();
  		getUserList();
  		getCompanyList();
  		getCategoryList();
  		getProductList();
  		getOrderList();
  		getNewsList();
  		$("#addCatWin").window('close'); 
  		$('#addProductWin').window('close');
  		$('#addNewsWin').window('close');
  	});
  	
  	function deleteUser(id){
  		$.ajax({
				url: "/RochyOnlineStore/user/delete.do",
				data: {
					'id':id           
				},
				dataType:"text",
				contentType:"application/x-www-form-unlencoded;charset=utf-8",
				success: function (data) {	
					//var data=eval("("+data+")");
					alert(data);
					$('#companyList').datagrid('reload');
					$('#userList').datagrid('reload');
				},
				error:function(){
					alert('error');
				}
			});  
  	}

  
  	function getUserList(){
	  	$('#userList').datagrid({
	  		url:'/RochyOnlineStore/user/userList.do',
	  		queryParams:{
	  			'type': 1,
				'id': $("#userId").val(),
				'name': $("#userName").val(),
				'loginName': $("#loginName").val()
			},	  		
			fit:true,
			autoRowHeight:true,
			nowrap:true,
	  		columns:[[
	  			{title:'User ID',field:'id',width:100},
	  			{title:'User Name',field:'name',width:100},
	  			{title:'Login Name',field:'loginName',width:100},
	  			{title:'Address',field:'address',width:100},
	  			{title:'Phone Number',field:'number',width:100},
	  			{title:'Sex',field:'sex',width:100},
	  			{title:'Birthday',field:'birthday',width:100},
	  			{field:'btn',title:'Operation',width:200,align:'center',formatter:function(value,row,index){
                		var contant="<a href='javascript:void(0);' onclick='deleteUser("+row.id+")'>Delete</a>";
						return contant;
					}
                }
	  		]],
	  		fitColumns:true,
	  		pagination:true
	  	});    		
  	}
  	
  	function getCompanyList(){ 	
  		var companyType=$("#companyType").find("option:selected").val();
  		var companySize=$("#companySize").find("option:selected").val();	
  		var verify=$("#verify").find("option:selected").val();
  		var type='-1';
  		if(verify=="3"){
  			type='3';
  		}else if(verify=="0"){
  			type='0';
  		}else{
  			
  		}
  		
  		$('#companyList').datagrid({
	  		url:'/RochyOnlineStore/user/userList.do',
	  		queryParams:{
	  			'type': type,
				'id': $("#companyId").val(),
				'name': $("#companyName").val(),
				'loginName': $("#comLogName").val(),
				'companyType':companyType,
				'companySize':companySize,
				'companyOwner':$("#companyOwner").val()				
			},	  		
	  		columns:[[
	  			{title:'Verify',field:'type',width:50,
	  					formatter:function(value,row){
	  						if(row.type==0){
	  							return "<a name='btn' href='#' class='easyui-linkbutton' id='veri"+row.id+"' onclick='veri("+row.id+");'>Confirm</a>";
	  						}else if(row.type==3){
	  							value='Verified';
	  						}else{
	  							value='error';
	  						}
	  						return value;
	  					}},
	  			{title:'Company ID',field:'id',width:50},
	  			{title:'Company Name',field:'name',width:90},
	  			{title:'Login Name',field:'loginName',width:70},
	  			{title:'Address',field:'address',width:100},
	  			{title:'Phone Number',field:'number',width:100},
	  			{title:'Company Type',field:'companyType',width:70},
	  			{title:'Company Size',field:'companySize',width:100,
	  					formatter:function(value,row){
	  						if(row.companySize==0){
	  							value='Very Large（>1000）';
	  						}else if(row.companySize==1){
	  							value='Large（500-1000）';
	  						}else if(row.companySize==2){
	  							value='Middle（100-500）';
	  						}else if(row.companySize==3){
	  							value='Small（<100）';
	  						}else{
	  							value='error';
	  						}
	  						return value;
	  					}},
	  			{title:'Company Owner',field:'companyOwner',width:100},
	  			{title:'Comany Number',field:'companyNumber',width:100},
	  			{field:'btn',title:'Operation',width:100,align:'center',formatter:function(value,row,index){
                		var contant="<a href='javascript:void(0);' onclick='deleteUser("+row.id+")'>Delete</a>";
						return contant;
					}
                }
	  		]],
	  		fitColumns:true,
	  		pagination:true
	  	});    	
  	}
  	
  	function veri(id){
  		$.messager.confirm('Confirm','Confirm Verifying?',function(r){    
	    if (r){    
	    	$.ajax({ //////////////////////////////////////////////////////////
				url: "/RochyOnlineStore/user/register.do",
				data: {
					'type':3,
					'id':id           
				},
				dataType:"text",
				contentType:"application/x-www-form-unlencoded;charset=utf-8",
				success: function (data) {	
					//var data=eval("("+data+")");
					alert(data);
					$("#veri"+id).val('Verified');
					$('#companyList').datagrid('reload');
				},
				error:function(){
					alert('error');
				}
			});  
	    }    
		});   		
  	}
  	
  	function getCategoryList(){
  		$('#categoryList').datagrid({
	  		url:'/RochyOnlineStore/category/categoryList.do',  		
	  		columns:[[
	  			{title:'Category ID',field:'id',width:50},
	  			{title:'Category Name',field:'name',width:60},
	  			{title:'Description',field:'description',width:90},
	  			{field:'btn',title:'Operation',width:100,align:'center',formatter:function(value,row,index){
                		var contant="<a href='javascript:void(0);' onclick='deleteCat("+row.id+")'>Delete</a>";
						return contant;
					}
                }
	  		]],
	  		fitColumns:true,
	  		pagination:true
	  	}); 
  	}
  	
  	function getProductList(){
  		$('#productList').datagrid({
	  		url:'/RochyOnlineStore/product/productList.do',  		
	  		columns:[[
	  			{title:'Product ID',field:'id',width:50},
	  			{title:'Product Model',field:'model',width:60},
	  			{title:'Product Name',field:'name',width:60},
	  			{title:'Product Brand',field:'brand',width:60},

	  			{title:'Category',field:'categoryId',width:60},
	  			{title:'Price',field:'price',width:60,formatter:function(value,row,index){
	  				return toDecimal2(row.price);
	  			}},
	  			{title:'Cost',field:'cost',width:60,formatter:function(value,row,index){
	  				return toDecimal2(row.cost);
	  			}},
	  			{title:'Amount',field:'number',width:60},
	  			{title:'images',field:'imgUrls',width:90},
	  			{title:'Description',field:'description',width:60},
	  			{field:'btn',title:'Operation',width:100,align:'center',formatter:function(value,row,index){
                		var contant="<a href='javascript:void(0);' onclick='deletePro("+row.id+")'>Delete</a>" ;
						return contant;
					}
                }
	  		]],
	  		fitColumns:true,
	  		pagination:true
	  	}); 
  	}
  	
  	function deleteCat(id){
  		$.ajax({
			url: "/RochyOnlineStore/category/delete.do",
			data: {
				'id':id           
			},
			dataType:"text",
			contentType:"application/x-www-form-unlencoded;charset=utf-8",
			success: function (data) {	
				alert(data);
				$('#categoryList').datagrid('reload');
			},
			error:function(){
				alert('error');
			}
		}); 
  	}
  	
  	function deletePro(id){
  		$.ajax({
			url: "/RochyOnlineStore/product/delete.do",
			data: {
				'id':id           
			},
			dataType:"text",
			contentType:"application/x-www-form-unlencoded;charset=utf-8",
			success: function (data) {	
				alert(data);
				$('#productList').datagrid('reload');
			},
			error:function(){
				alert('error');
			}
		}); 
  	}
  	
  	$('#addCatWin').window({  
			title:'Add Category',
		    width:400,    
		    height:200,    
		    modal:true   
	});
  	function addCategory(){
  		$('#addCatWin').window('open'); 		  
  	}
  	
  	function addCat(){  		
  		$('#addCatForm').form('submit',{    
  		    url:'/RochyOnlineStore/category/add.do',    
  		    onSubmit: function(){    
  		        // do some check    
  		        // return false to prevent submit;   
  				if($("#catName").isValid==false){
  					return false;
  				}else{
  					return true;
  				}
  		    },    
  		    success:function(data){    
  		        alert(data);
  		        $('#addCatForm').form('clear');
  		        $('#categoryList').datagrid('reload');
  		    }    
  		});    
  	}
  	
  	$('#addProductWin').window({  
		title:'Add Product',
	    width:400,    
	    height:400,    
	    modal:true   
	}); 
	function addPro(){
		  $('#addProductWin').window('open');  				  
	}
	
	function addProduct(){
		$('#addProductForm').form('submit',{    
  		    url:'/RochyOnlineStore/product/add.do',    
  		    onSubmit: function(){    
  		        // do some check    
  		        // return false to prevent submit;   
  				if($("#productName").isValid==false || $("#productBrand").isValid==false || $("#productModel").isValid==false || $("#productCategoryId").isValid==false || $("#productPrice").isValid==false || $("#productNumber").isValid==false){
  					return false;
  				}else{
  					return true;
  				}
  		    },    
  		    success:function(data){    
  		        alert(data);
  		        $('#addProductForm').form('clear');
  		        $('#productList').datagrid('reload');
  		    }    
  		});  
	}
	
	$("#productCategoryId").combobox({
		url:'/RochyOnlineStore/category/categoryList.do',    
	    valueField:'id',   //<option value="">
	    textField:'name'   //<option text="">
	});
	
	var sendNum=0;
  	function getOrderList(){
  		$('#orderList').datagrid({
	  		url:'/RochyOnlineStore/order/orderList.do',  
	  		fitColumns:true,
	  		//width:1000,
	  		columns:[[
	  			{title:'Order ID',field:'id',width:35},
	  			{title:'User ID',field:'userId',width:50},
	  			{title:'Address',field:'address',width:60},
	  			{title:'Contact Number',field:'phoneNumber',width:60},
	  			{title:'Product ID',field:'productId',width:60},
	  			{title:'Product Category',field:'categoryId',width:60},
	  			{title:'Product Price',field:'productPrice',width:60,formatter:function(value,row,index){
	  				return toDecimal2(row.productPrice);
	  			}},
	  			{title:'Perchase Amount',field:'number',width:90},
	  			{title:'Total amount',field:'text',width:90,formatter:function(value,row,index){
	  				return toDecimal2(row.productPrice*row.number);
	  			}},
                {title:'User Comment',field:'memo',width:60},
                {field:'btn',title:'Operation',width:100,align:'center',formatter:function(value,row,index){
                	var ss="<div name='sendDiv' style='display: inline;' id='sendDiv"+row.id+"'><a href='javascript:void(0);' onclick='send("+row.id+");'>[Deliver]</a></div>";
                	if(row.state==1 || row.state==2){
                    	var ss="<div name='sendDiv' style='display: inline;' id='sendDiv"+row.id+"'><a href='javascript:void(0);' onclick='send("+row.id+");'></a></div>";
                	}else{
                		
                	}
	            		var contant=ss
	            		+"&nbsp;<div style='display: inline;' ><a href='javascript:void(0);' onclick='deleteOrder("+row.id+")'>[Delete]</a></div>";
	            		if(row.state==1||row.state==2){
	            			$("#sendDiv"+row.id+"").hide();
	            		}
						return contant;
					}
	            },
	            {field:'state',title:'Order Status',width:100,align:'center',formatter:function(value,row,index){
	  					if(row.state==-1||row.state==0){
	  						if($("#sendDiv"+row.id).is(":hidden")){
	  							value="Wait4Receive";
	  							$("#sendDiv"+row.id).html('');
	  						}else{
	  							value="Wait4Deliver";$("#sendDiv"+row.id).show();
	  						}
	  						
	  					}else if(row.state==1){
	  						value="Received,not Comment";
	  						$("#sendDiv"+row.id).hide();
	  					}else if(row.state==2){
	  						value="Completed";
	  						$("#sendDiv"+row.id+"").hide();
	  						//var s=document.getElementsByName("sendDiv"+row.id)[0];
	  					}
						return "<span id='statDiv"+row.id+"'>"+value+"</span>";
					}
	            }
	  		]],
//	  		fitColumns:true,
	  		pagination:true
	  	}); 
  	}

   	function send(id){
  		if(confirm("Confirm Delivering？")){
  			//$('#orderList').datagrid('reload');
  			$("#sendDiv"+id).hide();
  			if($("#statDiv"+id).html()=='Wait4Deliver'){
  				$("#statDiv"+id).html("Wait4Receive");
  			};
  		}
  	}
  	
 	 function toDecimal2(f) {    
       //var f = parseFloat(x);    
       if (isNaN(f)) {    
           return false;    
       }    
       f = Math.round(f*100)/100;    
       var s = f.toString();    
       var rs = s.indexOf('.');    
       if (rs < 0) {    
           rs = s.length;    
           s += '.';    
       }    
       while (s.length <= rs + 2) {    
           s += '0';    
       }    
       return s;    
   }  
  	
  	function deleteOrder(id){
  		$.ajax({
			url: "/RochyOnlineStore/order/delete.do",
			data: {
				'id':id           
			},
			dataType:"text",
			contentType:"application/x-www-form-unlencoded;charset=utf-8",
			success: function (data) {	
				alert(data);
				$('#orderList').datagrid('reload');
			},
			error:function(){
				alert('error');
			}
		}); 
  	}
	
  	
  	function getNewsList(){
  		$('#newsList').datagrid({
	  		url:'/RochyOnlineStore/news/newsList.do',  		
	  		columns:[[
	  			{title:'News ID',field:'id',width:50},
	  			{title:'News Title',field:'title',width:60},
	  			{title:'News Content',field:'content',width:60}
	  			
	  		]],
	  		fitColumns:true,
	  		pagination:true
	  	}); 
  	}
  	
  	function deleteNews(id){
  		$.ajax({
			url: "/RochyOnlineStore/news/delete.do",
			data: {
				'id':id           
			},
			dataType:"text",
			contentType:"application/x-www-form-unlencoded;charset=utf-8",
			success: function (data) {	
				alert(data);
				$('#newsList').datagrid('reload');
			},
			error:function(){
				alert('error');
			}
		}); 
  	}
	
  	$('#addNewsWin').window({  
		title:'Add Product',
	    width:600,    
	    height:500,    
	    modal:true   
	}); 
	function addNewsBtn(){
		  $('#addNewsWin').window('open');  				  
	}
	
	function addNews(){
		
		$('#addNewsForm').form('submit',{    
  		    url:'/RochyOnlineStore/news/add.do',    
  		    onSubmit: function(){    
  		        // do some check    
  		        // return false to prevent submit;   
  				if($("#newsTitle").isValid==false || $("#newsContent").isValid==false){
  					return false;
  				}else{
  					return true;
  				}
  		    },    
  		    success:function(data){    
  		        alert(data);
  		        $('#addNewsForm').form('clear');
  		        $('#newsList').datagrid('reload');
  		    }    
  		});  
	}

	
	
	