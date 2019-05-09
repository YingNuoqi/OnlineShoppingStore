<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>Rochy Store</title>
  		<script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery-1.9.1.min.js"></script>   
	    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script> 
	    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	    
	    <!-- Bootstrap -->
	    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
	     
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/icon.css">   
		
		 
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.2/themes/default/datebox.css">   
		
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
		<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
		<script>
		
		var p=0;
		
		var info="";
		
		$(function(){
			$('#shopCarAllCheckBox').bind("click",function(){
				if($(this)[0].checked==true){
					$('input[flag="product"]').prop('checked',true);
					getCheckProduct();
				}else{
					$('input[flag="product"]').prop('checked',false);
					getCheckProduct();
				}
			});
			
			$('input[flag="product"]').bind("click",function(){
				getCheckProduct();
			});
			
			readCarProducts();
		});
		
		
		
		function readCarProducts(){
			if($("#hiddenUserId").val()==''){
	  			alert("Please login first! ");
	  			return;
	  		}
			$.ajax({
				url:'/RochyOnlineStore/shopCar/getCarProductsByUserId.do',
				type:'post',
				data:{
  					'userId':""+$("#hiddenUserId").val()
  				},
				success:function(result){
					$('#carProductTab').html(
							"<tr><td>Product ID</td>"
							+ "<td>Product Name</td>"+"<td>Added Time</td><td>Quantity</td><td>Unit Price</td><td>Total Price</td><td>Status</td><td>My Comments</td><td>Operation</td></tr>");
					var carProductHtml = '';
					$.each(eval('('+result+')'),function(index,item){
						carProductHtml = "<tr><td><input type='text' value='"+item.productId+"' readonly='readonly' style='width: 30px;'/></td>"
										+"<td><a href='../view/productDetail.jsp?productId="+item.productId+"'>"+item.productName+"</a></td>"
										+"<td>"+item.addDateStr+"</td>"
										+"<td>&nbsp;&nbsp;"
										+"<span>"+item.productCount+"</span>"
										+"&nbsp;&nbsp;</td>"
										+"<td><span>"+toDecimal2(item.productPrice)+"<span></td>"
										+"<td><span>"+toDecimal2(item.allThisProductPrice)+"<span></td>"
										+"<td><a href='javascript:delProduct("+item.productId+")'>Delete</a></td></tr>";
						$('#carProductTab').append(carProductHtml);	
						p=p+item.productPrice*item.productCount;
						$("#allPrice").html(p);
						var or=item.productId+","+item.productCount;
						info=info+or+";";
					});
				}
			});
		}
		function changeCount(productId,productCount,type){
			if(type==1){
				productCount--;
			}else{
				productCount++;
			}
			$.ajax({
				url:'/RochyOnlineStore/shopCar/updateProductCount.do',
				type:'post',
				data:{
					'productId':productId,
					'productCount':productCount
				},
				success:function(){
					readCarProducts();
				}
			});
		}
		
		function delProduct(productId){
			if(confirm("Confirm deletion?")){
				$.ajax({
					url:'/RochyOnlineStore/shopCar/delProductByProductId.do',
					type:'post',
					data:{
						'productId':productId,
						'userId':""+$("#hiddenUserId").val()
					},
					success:function(){
						readCarProducts();
					}
				});
			}
		}
		
		function clearShopCar(){
			if(confirm("Confirm empty shopping cart? ")){
				$.ajax({
					url:'/RochyOnlineStore/shopCar/clearShopCar.do',
					type:'post',
					data:{
						'userId':""+$("#hiddenUserId").val()
					},
					success:function(){
						readCarProducts();
					}
				});
			}else{
				//do nothing
			}
			
			
		}
		

		function buyBtn(){
			if(confirm("")){
			
			};
			if(confirm("Confirm payment?")){
				
				$.ajax({
					url: "/RochyOnlineStore/order/addFromCar.do",
					data: {
						'userId':""+$("#hiddenUserId").val(),
						'info':info,
						'state':0
					},
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	
						
						
						if(confirm("Payment is successful, please wait for delivery. Please check the logistics status in the order. ")){
							window.location.href="../view/main.jsp?";
						}
					},
					error:function(){
						alert('Order submission error');
					}
				});   
			}
		};
		

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
  </head>
  
  <body>
  		
  		<div align="center">
  		<div>
  			<%@ include file="../view/head.jsp" %>
  			<input type="hidden" value="<%=request.getParameter("productId")%>" id="productId" name="productId" />
  		</div>
  		<div class="jumbotron">
		  <h1 align="center">My Shopping Cart</h1>
		</div>
  		<div>
  			<button id="clearShopCar" class="btn btn-default" style="float: right;" onclick="clearShopCar()">Clear Cart</button>
  			<table id="carProductTab" class="table table-striped table-hover" style="float: clear;margin-top: 10px;padding-top: 20px;">
  				<tr>
  					<td><input id="shopCarAllCheckBox" type="checkbox" ></td>
  					<td>Product Name</td>
  					<td>Added Time</td>
  					<td>Quantity</td>
  					<td>Unit Price</td>
  					<td>Total Price</td>
  					<td>Operation</td>
  				</tr>
  				
  			</table>
  			<div>
  				<span>Total shopping cart products:<span id="allPrice"></span>€</span><br/>
  			</div>
  			
  			<p>
  				<br/>
  				<a href="#" class="btn btn-primary" role="button" id="pay_btn" onclick="buyBtn();"><span class="glyphicon glyphicon-usd"></span>Settlement shopping cart</a> 
  			</p>
  		</div>
  		</div>
  </body>
</html>
