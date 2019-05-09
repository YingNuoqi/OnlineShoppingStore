<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
   		<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery-1.9.1.min.js" charset="utf-8"></script>   
	    <script type="text/javascript" src="../js/jquery.min.js"></script> 
	    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	    
	    <!-- Bootstrap -->
	    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
	     
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/easyui.css">   
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/icon.css">   
		
		<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery.easyui.min.js" charset="utf-8"></script> 
		 
		<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>  
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/datebox.css">   
		
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
		<!--<script type="text/javascript" src="<%=basePath%>/js/register.js"></script>
		-->
		<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
	 	   
	 	<title>Rochy Store</title>
  	</head>
  
  <body>
  
  	<div align="center">
  		<div>
  			<%@ include file="../view/head.jsp" %>
  			<input type="hidden" value="<%=request.getParameter("productId")%>" id="productId" name="productId"/>
  		</div>
		
  		<div>
  			<div class="jumbotron">
			  <h1 align="center">Product Detail</h1>
			</div>
			
  			<div class='thumbnail' align="center">
  				<img src='' alt='...' border='1px' height='250px' width='550px' title='Image' id="image1" name="image1"/>
  				<div class='caption'>
  					<h3>
  						<span id="name_td">&nbsp; &nbsp; Product Name</span><br/>
  						<span id="price_td">&nbsp; &nbsp; Product Price</span><br/>
  						<span id="number_td">&nbsp; &nbsp; Product Quantity</span><br/>
  						
  						<div>
  							<table>
  								<tr>
  									<td> <span class="input-group-addon"><h6>Purchase Quantity</h6></span></td>
  									<td><button type="button" class="btn btn-default btn-lg" onclick="deleteNumber();">
										  <span class="glyphicon glyphicon-minus"></span>
									  </button>
									</td>
  									<td><input type="text" class="form-control" placeholder="number" value=1 id="buyNumber" style="width: 90px;"></td>
  									<td>
  										<button type="button" class="btn btn-default btn-lg" onclick="addNumber();">
										  <span class="glyphicon glyphicon-plus"></span>
									  </button>
  									</td>
  								</tr>	
  							</table>
						</div>
						
  						<p>
  							<a href="#" class="btn btn-primary" role="button" id="buy_btn" onclick="buyBtn();"><span class="glyphicon glyphicon-usd"></span>Purchase Immediately</a> 
  							<a href="#" class="btn btn-default" role="button" id="addCar_btn"><span class="glyphicon glyphicon-shopping-cart"></span>Add To Shopping Cart</a>
  						</p>
  					</h3>
  				</div>
  			</div> 			
			
			<br><br>
			
			<div>
  				<table id="tb_productDetail">
  					<tr>
  						<td ><h4>Product Brand: </h4></td>
  						<td id="brand_td"></td>
  					</tr>
  					<tr><td>&nbsp;</td></tr>
  					<tr>
  						<td ><h4>Product Model: </h4></td>
  						<td id="model_td" ></td>
  					</tr>
  					<tr><td>&nbsp;</td></tr>
  					<tr>
  						<td><h4>Product Description: </h4></td>
  						<td></td>
  					</tr>
  					<tr>
  						<td></td>
  						<td id="description_td" >Product Parameters: <br/>
	  						<table>
	  							<tr>
	  								<td>Storage type: TF (microSD) card</td>
	  								<td>Photosensitive element type: Other /other</td>
	  								<td>Effective distance: Other /other</td>
	  							</tr>
	  							<tr>
	  								<td>Clarity: 720p</td>
	  								<td>Focal length: Other /other</td>
	  								<td>Network connection method: Wireless connection</td>
	  							</tr>
	  							<tr>
	  								<td>Additional features: Intelligent operating system Anti-theft alarm</td>
	  								<td>Brand: <span id="brandSpan"></span></td>
	  								<td>Model: <span id="modelSpan"></span></td>
	  							</tr>
	  							<tr>
	  								<td colspan="3"><span id="imgSpan"></span></td>
	  							</tr>
	  						</table>
						</td>
  					</tr>
  					<tr><td></td><td></td></tr>
  					<tr>
  						<td></td>
  						<td><br><br><hr>
  						<br><h4><br>Product Comments<br></h4> (To protect privacy, we have hidden buyers' names) </td>
  					</tr>
  					<tr>
  						<td></td>
  						<td id="memo_td" >
  							<table id="memoTab" class="table table-striped table-hover" style="float: clear;margin-top: 10px;padding-top: 20px;">
  								<tr>
  									<td>User ID</td>
  									<td>Comments</td>
  								</tr>
  							</table>
  						</td>
  					</tr>
  					<tr><td>&nbsp;</td></tr>
  					<tr><td>&nbsp;</td></tr>
  					<tr><td>&nbsp;</td></tr>
  					<tr><td>&nbsp;</td></tr>
  					<tr><td>&nbsp;</td></tr>
  				</table>
  			</div>
  		</div>
  		
  	</div>
    
  </body>
  
  <script type="text/javascript">
  	var productId=$("#productId").val();
  	var productName;
  	var productPrice;
  
  	
  	$(function(){
  		$.ajax({
				url: "/RochyOnlineStore/product/getProductById.do",
				data: {
					'id':productId            
				},
				dataType:"text",
				contentType:"application/x-www-form-unlencoded;charset=utf-8",
				success: function (data) {	
					var data=eval("("+data+")");
					
					var imgUrls=data.imgUrls+"";
		  			var imgs=imgUrls.split(";", 4);
		  			var img1=imgs[0];
		  			var img2=imgs[1];
		  			var img3=imgs[2];
		  			var img4=imgs[3];
					
					$("#name_td").html(data.name);
					productName=data.name;
					
					
					var myPrice=toDecimal2(data.price);
					$("#price_td").html(myPrice+"€");
					productPrice=data.price;
					$("#brand_td").html("<h4>"+data.brand+"</h4>");
					$("#brandSpan").html(data.brand);
					$("#model_td").html(data.model);
					$("#modelSpan").html(data.model);
					$("#imgSpan").html("<br/><img src='"+img1+"' alt='...' border='1px' width='800px' title='Image' id='image1' name='image1'/><br/>");
					
					$("#number_td").html(data.number+"pieces");
					

		  			document.getElementById("image1").src=img1+'';
		  			readMemo();
				},
				error:function(){
					alert('error');
				}
			});   		
  	});
  	

  	function readMemo(){
  		$.ajax({
				url:'/RochyOnlineStore/order/orderList.do',
				type:'post',
				data:{
  					'productId':""+$("#productId").val()
  				},
				success:function(result){
					$('#memoTab').html(
							"<tr><td>User ID</td>"
							+ "<td>Comments</td></tr>");
					var memoHtml = '';
					$.each(eval('('+result+')'),function(index,item){
						memoHtml = "<tr><td><input type='text' value='"+item.userId+"' readonly='readonly' style='width: 30px;height:20px;'/></td>"
										+"<td>"+item.memo+"</td></tr>";
						$('#memoTab').append(memoHtml);	
					});
				}
			});
  	}

  	function addNumber(){
  		var number=$("#buyNumber").val();
  		$("#buyNumber").val(parseInt(number)+1);
  	}

  	function deleteNumber(){
  		var number=parseInt($("#buyNumber").val());
  		if(number>=1){
  			$("#buyNumber").val(number-1);
  		}		
  	}
  	
 
  	function buyBtn(){
  		var userId=$("#hiddenUserId").val();
  		if(null==userId || userId==""){
  			alert("Please login first! ");
  		}else{
  			window.location.href="../view/buyNow.jsp?productId="+productId+"&productName="+productName+"&userId="+userId+"&productPrice="+productPrice+"&number="+$("#buyNumber").val();
  		}
  		
  	}
  	

  	$('#addCar_btn').bind('click',function(){
  		if($("#hiddenUserId").val()==''){
  			alert("Please login first");
  			return;
  		}
  		$.ajax({
  			url:'/RochyOnlineStore/shopCar/addProduct.do',
  			type:'post',
  			data:{
  				'productId':productId,
  				'productCount'	:1,
  				'userId':""+$("#hiddenUserId").val(),
  				'productCount':$("#buyNumber").val()
  			},
  			success:function(){
  				alert("Added successfully, please go to the shopping cart to view and pay! ");
  			}
  			
  		});
  	});
  	
  	

  	 function toDecimal2(f) {       
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
  </script>
</html>
