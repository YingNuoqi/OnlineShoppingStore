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
  			<input type="hidden" value="<%=request.getParameter("productName")%>" id="productName" name="productName"/>
  			<input type="hidden" value="<%=request.getParameter("productPrice")%>" id="productPrice" name="productPrice"/>
  			<input type="hidden" value="<%=request.getParameter("number")%>"  name="number"/>
  		</div>
  		
  		<div align="center" style="width: 400px;">
  			<div class="jumbotron">
			  <h1 align="center">Buy Now</h1>
			</div>
  			<br/><br/><br/>
			<table class="table table-striped">
			  <tr>
			  	<td style="width: 100px;">Product Name:</td>
			  	<td><input type="text" value="<%=request.getParameter("productName")%>" readonly="readonly"/></td>
			  </tr>
			  <tr>
			  	<td>Product Quantity:</td>
			  	<td><input type="text" value="<%=request.getParameter("number")%>" readonly="readonly" id="number"/></td>
			  </tr>
			  <tr>
			  	<td>Product Unit Price</td>
			  	<td><input type="text" value="" id="sprice" readonly="readonly"/></td>
			  </tr>
			  <tr>
			  	<td>Total Price Paid</td>
			  	<td id="allPrice"></td>
			  </tr>
			  <tr>
			  	<td></td>
			  	<td>
			  		<button type="button" class="btn btn-primary" onclick="pay();">Pay</button>
			  		<button type="button" class="btn btn-default">Cancel</button>
			  	</td>
			  </tr>
			</table>
		</div>
  	</div>
  
  	
  </body>
  
  <script type="text/javascript">
	var productId;
	var productName;
	var productPrice;
	var number;
	$(function(){
		productId=$("#productId").val();
		productName=$("#productName").val();
		var price=toDecimal2(parseFloat(<%=request.getParameter("productPrice")%>));
		$("#productPrice").val(price);
		$("#sprice").val(price+"€");
		number=$("#number").val();
		var allPrice=<%=request.getParameter("productPrice")%>*<%=request.getParameter("number")%>;
		$("#allPrice").html(toDecimal2(allPrice)+"€");
	});

	//支付按钮响应事件 
	function pay(){
		var userId=$("#hiddenUserId").val();
		window.location.href="pay.jsp?";
		if(confirm("确认支付？")){
			
				//把订单提交到后台 
				$.ajax({
					url: "/RochyOnlineStore/order/add.do",
					data: {
						'productId':productId,
						'userId':userId,
						'number':<%=request.getParameter("number")%>,
						'state':0
					},
					dataType:"text",
					contentType:"application/x-www-form-unlencoded;charset=utf-8",
					success: function (data) {	

					},
					error:function(){
						alert('error');
					}
				});   
		}else{
			//do nothing
		}
		
		window.location.href="pay.jsp?";
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
</html>
