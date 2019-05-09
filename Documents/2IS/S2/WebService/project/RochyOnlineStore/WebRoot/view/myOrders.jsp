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
				$("#memoDiv").hide();
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
	  			alert("Please Login first! ");
	  			return;
	  		}
			$.ajax({
				url:'/RochyOnlineStore/order/orderList.do',
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
						var productName="";

						$.ajax({
							url:'/RochyOnlineStore/product/getProductById.do',
							type:'post',
							data:{
								'id':item.productId,
							},
							success:function(data){
								var product=eval('('+data+')');
								productName=product.name;
								var s="";
								if(item.state==0){
									s="Pending receipt";
								}else if(item.state==1){
									s="Received for evaluation";
								}else if(item.state==2){
									s="Completed";
								}else{
									s="Unknow";
								}
								carProductHtml = "<tr><td><input type='text' value='"+item.productId+"' readonly='readonly' style='width: 30px;'/></td>"
												+"<td><a href='../view/productDetail.jsp?productId="+item.productId+"'>"+productName+"</a></td>"
												+"<td>"+item.time+"</td>"
												+"<td>&nbsp;&nbsp;"
												+"<span>"+item.number+"</span>"
												+"&nbsp;&nbsp;</td>"
												+"<td><span>"+toDecimal2(item.productPrice)+"<span></td>"
												+"<td><span>"+toDecimal2(item.number*item.productPrice)+"<span></td>"
												+"<td><span>"+s+"<span></td>"
												+"<td><span id='memoSpan"+item.productId+"'>"+item.memo+"<span></td>"
												+"<td><a href='javascript:setState("+item.id+")' id='sh"+item.productId+"'>[Confirm Receipt]  </a><a id='pj"+item.productId+"' name='pj"+item.productId+"' href='javascript:setMemo("+item.id+")'>[Comments]</a></td></tr>";
								$('#carProductTab').append(carProductHtml);	
								p=p+item.productPrice*item.productCount;
								$("#allPrice").html(p);
								var or=item.productId+","+item.productCount;
								info=info+or+";";
								
								if(item.memo==null || item.memo==''|| $("#memoSpan"+item.productId).html()=="undefined"){
									$("#memoSpan"+item.productId).html("");
								}
								
								if(item.state==0){
									
									$("#pj"+item.productId+"").html(""); 
								}else if(item.state==1){
									
									$("#sh"+item.productId+"").html("");
								}else if(item.state==2){
									
									$("#sh"+item.productId+"").html("");
									$("#pj"+item.productId+"").html("");
								}else{
									
								}
							}
						});
						
						
					});
				}
			});
		}
		

		function setState(id){
			if(confirm("Confirm receipt? ")){
				$.ajax({
					url: "/RochyOnlineStore/order/update.do",
					data: {
						'id':id,
						'userId':$("#hiddenUserId").val(),
						'state':1
					},
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	
						window.location.reload(true);
					},
					error:function(){
						alert('Submit error');
					}
				}); 
			}			
		}
		

		function setMemo(id){
			$("#memoDiv").show();
			$("#memoBtn").val(id);
		}
		

		function submitMemo(){
			var id=$("#memoBtn").val();
			var memo=$("#myMemo").val();
			$.ajax({
					url: "/RochyOnlineStore/order/update.do",
					data: {
						'id':id,
						'userId':$("#hiddenUserId").val(),
						'state':2,
						'memo':memo
					},
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	
						window.location.reload(true);
					},
					error:function(){
						alert('Submit error');
					}
			});
		}
		

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
		  <h1 align="center">My Orders</h1>
		</div>
  		<div>
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
  			
  			<div class="col-lg-3" align="right" id="memoDiv">
			    <div class="input-group">
			      <input type="text" class="form-control" id="myMemo">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button" onclick="submitMemo();" value="" id="memoBtn">Submit Comment</button><br/><br/>
			      </span>
			    </div>
			  </div>

  		</div>
  		</div>
  </body>
</html>
