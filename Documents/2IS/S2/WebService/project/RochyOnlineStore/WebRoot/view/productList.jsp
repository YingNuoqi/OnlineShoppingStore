<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
   		<%-- <script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.5/jquery-1.9.1.min.js" charset="utf-8"></script>   --%> 
	    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.10.2.min.js"></script>
	    <!-- <script
		  src="https://code.jquery.com/jquery-2.2.4.js"
		  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		  crossorigin="anonymous"></script>
	    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> -->

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
		
		<style type="text/css">
			.datagrid-cell{
				width: 650px !important;
			}
			.thumbnail{
				width: 600px !important;
			}
			
			.datagrid-body td{
				border-style:none;
			}
			.datagrid-wrap{
				margin:auto;
			}
			
			.datagrid-btable{
				margin: auto;
			}
		</style>
	 	   
	 	<title>Rochy Store</title>
  	</head>
  
  <body>
  
  	<div align="center">
  		<div>
  			<%@ include file="../view/head.jsp" %>
  			<input type="hidden" value="<%=request.getParameter("categoryId")%>" id="categoryId" name="categoryId"/>
  			<input type="hidden" value="<%=request.getParameter("text")%>" id="text" name="text"/>
  		</div>
  		
		<div class="jumbotron">
		  <h1 align="center">Product List</h1>
		</div>
  		<div >
  			<table id="tb_productList"></table>
  		</div>
  		<!--
  		<div class="row" algin="center">		
  			<div class='col-sm-6 col-md-4'  algin="center">
  			  <div class='thumbnail' align="center">
  				<img data-src='' alt='...' border='1px' height='150px' width='200px' title='图片' onclick='product_click("+row.id+");'>
  				<div class='caption'><h3>productName</h3></div>
  			  </div>
  			</div>
  		</div>  
  	-->
  	</div>
    
  </body>
  
  <script type="text/javascript">
  	var categoryId=$("#categoryId").val();
  	
  	
  		$(function(){
  			
  			if("null"!=categoryId && ""!=categoryId){
		  		$('#tb_productList').datagrid({
		  			url:'/RochyOnlineStore/product/productList.do',
			  		queryParams:{
			  			'productCategoryId':categoryId
			  			
					},	  		
			  		columns:[[
			  			{title:'',field:'imgUrls',width:80,height:80,
			  					formatter:function(value,row){
			  						var imgUrls=row.imgUrls+"";
			  						var imgs=imgUrls.split(";", 1);
			  						var img1=imgs[0];
			  						var productName=row.name;
			  						var productPrice=toDecimal2(row.price);
			  						value="<div class='col-sm-6 col-md-4'><div class='thumbnail'  align='center'>"+
			  						"<img src='"+img1+"' alt='...' border='1px' width='550px' title='Image' onclick='product_click("+row.id+");'>"+
			  						"<div class='caption'><h3><span>"+productName+"</br>"+productPrice+"€</span></h3></div></div></div></div>";
			  						
			  						return value;
			  					}
			  			}
			  		]],
			  		
			  		fitColumns:true,
			  		pagination:true
		  		});
		  	}
		  	else{
		  		var text=$("#text").val();
		  		$('#tb_productList').datagrid({
		  			url:'/RochyOnlineStore/product/productList.do',
			  		queryParams:{
			  			'productName':text
			  			
					},	  		
			  		columns:[[
			  			{title:'',field:'imgUrls',width:80,height:80,
			  					formatter:function(value,row){
			  						var imgUrls=row.imgUrls+"";
			  						var imgs=imgUrls.split(";", 1);
			  						var img1=imgs[0];
			  						var productName=row.name;
			  						var productPrice=toDecimal2(row.price);
			  						value="<div class='col-sm-6 col-md-4'><div class='thumbnail'  align='center'>"+
			  						"<img src='"+img1+"' alt='...' border='1px' width='550px' title='Image' onclick='product_click("+row.id+");'>"+
			  						"<div class='caption'><h3><span>"+productName+"</br>"+productPrice+"€</span></h3></div></div></div></div>";
			  						
			  						return value;
			  					}
			  			}
			  		]],
			  		
			  		fitColumns:true,
			  		pagination:true
		  		});
		  	}
  		});
  	
  	
  	

  	function product_click(id){
  		window.open("productDetail.jsp"+"?productId="+id); 
  	}
  	
  	function serchProduct(){
  		///var text=$("#serchText").val();
  		//var categoryId=$("#categoryId").val();
  		//window.location.href("../view/buyNow.jsp);
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
