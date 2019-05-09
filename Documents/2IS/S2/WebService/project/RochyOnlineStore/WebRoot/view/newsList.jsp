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
		
			
			$(function(){
				readCarProducts();
			});

		
		function readCarProducts(){
			$.ajax({
				url:'/RochyOnlineStore/news/newsList.do',
				type:'post',
				data:{
  				},
				success:function(result){
					$('#carProductTab').html(
							"<tr><td style='width: 150px;'></td><td>News Number</td>"
							+ "<td>News Title</td></tr>");
					var carProductHtml = '';
					
					$.each(eval('('+result+')'),function(index,item){
						
						carProductHtml = "<tr><td style='width: 150px;'></td><td><input type='text' value='"+item.id+"' readonly='readonly' style='width: 30px;'/></td>"
												+"<td><a href='../view/newsDetail.jsp?id="+item.id+"'>"+item.title+"</a></td></tr?";
												
						$('#carProductTab').append(carProductHtml);	
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
		  <h1 align="center">Security News</h1>
		</div>
  		<div>
  			<table id="carProductTab" class="table table-striped table-hover" style="float: clear;margin-top: 10px;padding-top: 20px;">
  				<tr>
  					<td>News Number</td>
  					<td>News Title</td>
  				</tr>
  				
  			</table>
  			

  		</div>
  	</div>
  </body>
</html>
