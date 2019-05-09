<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		
	    
	    <link href="<%=basePath%>/css/style.css" type="text/css"  rel="stylesheet" />
	    <link href="<%=basePath%>/css/style2.css" type="text/css"  rel="stylesheet" />
	    
	    <script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.3.2/jquery-1.9.1.min.js"></script>   
	    <script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script> 
	    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	    
	    <!-- Bootstrap -->
	    <link rel="stylesheet" href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
	     

		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/icon.css">  
		<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui-1.3.5/themes/default/easyui.css">   		 
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-1.3.5/themes/default/datebox.css">   
		
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/user.css"> 
		<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
	 	   
	 	<title>Rochy Store</title>
  	</head>
  	
  	
  
  <body>
  	<div align="center">
  		<div>
  			<%@ include file="../view/head.jsp" %>
  		</div>
		
		<div id="banner">
			<div class="bannerCon">
		        <div class="before"><img src="../images/left.png" width="32" heigth="63" alt="" /></div>
		        <div class="after"><img src="../images/right.png" width="32" height="63" alt="" /></div>
		        <div class="scroll">
		        	<img src='../images/a2.jpg' width="750" height="500" alt="" />
		        	<img src='../images/a1.jpg' width="750" height="500" alt="" />      
		            <img src='../images/a3.jpg' width="750" height="500" alt="" />
		            <img src='../images/a4.jpg' width="750" height="500" alt="" />
		            <img src='../images/a5.jpeg' width="750" height="500" alt="" />
		            <img src='../images/a6.jpeg' width="750" height="500" alt="" />
		            <img src='../images/a1.jpg' width="750" height="500" alt="" />
		        </div> 
		        <div class="bannerBut">
		        	<ul>
		            	<li style="display:none"></li><li class="hover"></li><li></li><li></li><li></li><li></li><li></li>
		            </ul>
		        </div>   
		    </div>
		</div>
  		<br>
		<div class="jumbotron" >
		  <h1 align="center">Welcome to MIAGE Security Products Store</h1>
		</div>
		
		
		
		<div class="page-header">
  			<h2 align="center">Please browse the products by the following product categories</h2>
		</div>

	</div>
	
	
	<div class="wrap">

    	<div class="slide">
            <div class="slide_point">
               <span class="cur_point point1"><img width="210px" height="280px" src="../images/0_1.jpg" onclick="openProList(1);"></span>
               <span class="point2"><img width="200px" height="250px" src="../images/0_2.jpg" onclick="openProList(2);"></span>
               <span class="point3"><img width="200px" height="250px" src="../images/0_3.jpg" onclick="openProList(3);"></span>
               <span class="point4"><img width="200px" height="250px" src="../images/0_4.jpg" onclick="openProList(4);"></span>
               <span class="point4"><img width="200px" height="250px" src="../images/0_5.jpg" onclick="openProList(5);"></span>
            </div>
            <div class="slide_cont">
                <ul class="clearfix">
                    <li>
                    	<img src="../images/1_1.jpeg" hspace="10" usemap="#s_map_1" ismap="ismap"/>
                    	<map name="s_map_1" class="s_map">
                    		<area class="map_point" shape="rect" coords="10,20,170,300" href="#" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="220,20,390,300" href="siteall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="420,20,600,300" href="pageall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="620,20,810,300" href="pageal.htm" target="_blank" alt="" title=""> 
                    	</map>
                    </li>
                    <li>
                    	<img src="../images/1_2.jpg" hspace="10" usemap="#s_map_2"/>
                    	<map name="s_map_2" class="s_map">
                    		<area class="map_point" shape="rect" coords="10,20,170,300" href="urlall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="300,20,500,300" href="siteall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="620,20,810,300" href="pageal.htm" target="_blank" alt="" title=""> 
                    	</map>
                    </li>
                    <li>
                    	<img src="../images/1_3.jpg" hspace="10" usemap="#s_map_3"/>
                    	<map name="s_map_3" class="s_map">
                    		<area class="map_point" shape="rect" coords="10,20,170,300" href="urlall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="220,20,390,300" href="siteall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="420,20,600,300" href="pageall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="620,20,810,300" href="pageal.htm" target="_blank" alt="" title=""> 
                    	</map>
                    </li>
                    <li>
                    	<img src="../images/1_4.png" hspace="10" usemap="#s_map_4"/>
                    	<map name="s_map_4" class="s_map">
                    		<area class="map_point" shape="rect" coords="10,20,170,300" href="urlall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="300,20,500,300" href="siteall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="620,20,810,300" href="pageal.htm" target="_blank" alt="" title=""> 
                    	</map>
                    </li>
                    <li>
                    	<img src="../images/1_5.jpeg" hspace="10" usemap="#s_map_4"/>
                    	<map name="s_map_4" class="s_map">
                    		<area class="map_point" shape="rect" coords="10,20,170,300" href="urlall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="300,20,500,300" href="siteall.htm" target="_blank" alt="" title=""> 
							<area class="map_point" shape="rect" coords="620,20,810,300" href="pageal.htm" target="_blank" alt="" title=""> 
                    	</map>
                    </li>
                </ul>
            </div>
         </div> 

</div>
    
  </body>
  
  <script type="text/javascript">
  

  	 function openProList(categoryId){
  	 	window.open("productList.jsp"+"?categoryId="+categoryId);
  	 }
  	  	
  	  	
  	 

var _index1=1;
$('.bannerBut ul li').mouseover(function(){
	$(this).addClass('hover').siblings('li').removeClass('hover');
	var _index1=$(this).index();
	$('.bannerCon .scroll').stop().animate({left:-_index1*750},500);
});


$('.after img').click(function(){
	_index1++;
	if(_index1>9){
		_index1=1;
		$('.scroll').css('left','0px');
		$('.scroll').animate({left:-_index1*750},500);
		$('.bannerBut ul li').eq(_index1).addClass('hover').siblings('li').removeClass('hover');
	}else{
		$('.bannerBut ul li').eq(_index1).addClass('hover').siblings('li').removeClass('hover');
		$('.scroll').animate({left:-_index1*750},500);
	}
});



$('.before img').click(function(){
	_index1--;
	if(_index1<1){
		_index1=9;
		$('.scroll').css('left','-7500px');
		$('.scroll').animate({left:-_index1*750},500);
		$('.bannerBut ul li').eq(_index1).addClass('hover').siblings('li').removeClass('hover');
	}else{
		$('.bannerBut ul li').eq(_index1).addClass('hover').siblings('li').removeClass('hover');
		$('.scroll').animate({left:-_index1*750},500);
	}
});


$(function(){
	
	var time = 3 * 1000;
	var bottom_time = 6 * 1000; 
	
	var spLength = $('.slide_point span').length,
		scimgWidth = $(window).width(),
		sulWidth = scimgWidth * spLength,
		sNum = 0;
		$(".slide_cont ul").width(sulWidth);
		$(".slide_cont ul li").width(scimgWidth);
	var sTimer = setInterval(moveSlide,time);
	function moveSlide(){
			sNum++;
			if (sNum >= spLength) {
				sNum = 0;
			};
			showPics(sNum);
		}

	$('.slide_point span').mouseover(function(){
			clearInterval(sTimer);
			sNum = $(this).index();
			showPics(sNum);
		}).mouseleave(function(){
			sTimer = setInterval(moveSlide,bottom_time);
		});

	function showPics(sNum){
		$(".slide_point span").eq(sNum).find('img').attr('src','../images/0_'+(sNum+1)+'.jpg');
		$(".slide_point span").eq(sNum).find('img').css({'width':'210px','height':'280px'});
		$(".slide_point span").find('img').each(function(index){
			if(sNum!=index){
				$(this).attr('src','../images/0_'+(index+1)+'.jpg');
				$(this).css({'width':'200px','height':'250px'});
			}
		});
		$(".slide_point span").eq(sNum).addClass("cur_point").siblings().removeClass("cur_point");
		$(".slide_cont ul").animate({
			"margin-left" : -scimgWidth * sNum 
		});

	}
});
	
	
	
(function($){
	
$.fn.tabso=function( options ){

	var opts=$.extend({},$.fn.tabso.defaults,options );
	
	return this.each(function(i){
		var _this=$(this);
		var $menus=_this.children( opts.menuChildSel );
		var $container=$( opts.cntSelect ).eq(i);
		
		if( !$container) return;
		
		if( opts.tabStyle=="move"||opts.tabStyle=="move-fade"||opts.tabStyle=="move-animate" ){
			var step=0;
			if( opts.direction=="left"){
				step=$container.children().children( opts.cntChildSel ).outerWidth(true);
			}else{
				step=$container.children().children( opts.cntChildSel ).outerHeight(true);
			}
		}
		
		if( opts.tabStyle=="move-animate" ){ var animateArgu=new Object();	}
		
		$menus[ opts.tabEvent]( function(){
			var index=$menus.index( $(this) );
			$( this).addClass( opts.onStyle )
				.siblings().removeClass( opts.onStyle )
			$( this).children('em').addClass(opts.onStyle2);
			$( this).siblings().children('em').removeClass( opts.onStyle2 );
			switch( opts.tabStyle ){
				case "fade":
					if( !($container.children( opts.cntChildSel ).eq( index ).is(":animated")) ){
						$container.children( opts.cntChildSel ).eq( index ).siblings().css( "display", "none")
							.end().stop( true, true ).fadeIn( opts.aniSpeed );
					}
					break;
				case "move":
					$container.children( opts.cntChildSel ).css(opts.direction,-step*index+"px");
					break;
				case "move-fade":
					if( $container.children( opts.cntChildSel ).css(opts.direction)==-step*index+"px" ) break;
					$container.children( opts.cntChildSel ).stop(true).css("opacity",0).css(opts.direction,-step*index+"px").animate( {"opacity":1},opts.aniSpeed );
					break;
				case "move-animate":
					animateArgu[opts.direction]=-step*index+"px";
					$container.children( opts.cntChildSel ).stop(true).animate( animateArgu,opts.aniSpeed,opts.aniMethod );
					break;
				default:
					$container.children( opts.cntChildSel ).eq( index ).css( "display", "block")
						.siblings().css( "display","none" );
			}
	
		});
		
		$menus.eq(0)[ opts.tabEvent ]();
		
	});
};	

$.fn.tabso.defaults={
	cntSelect : ".content_wrap",
	tabEvent2 : "mouseleave",
	tabEvent : "mouseover",
	tabStyle : "normal",
	direction : "top",
	aniMethod : "swing",
	aniSpeed : "fast",
	onStyle : "current",
	onStyle2:"tab2",
	menuChildSel : "*",
	cntChildSel : "*"
};

})(jQuery);	
  	 
  </script>
</html>
