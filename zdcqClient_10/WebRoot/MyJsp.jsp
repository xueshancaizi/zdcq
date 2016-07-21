<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导航栏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath}/css/daohang.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	
		$("#menu2 li a").wrapInner( '<span class="out"></span>' );
		
		$("#menu2 li a").each(function() {
			$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
		});
	
		$("#menu2 li a").hover(function() {
			$(".out",	this).stop().animate({'top':	'48px'},	300); // move down - hide
			$(".over",	this).stop().animate({'top':	'0px'},		300); // move down - show
	
		}, function() {
			$(".out",	this).stop().animate({'top':	'0px'},		300); // move up - show
			$(".over",	this).stop().animate({'top':	'-48px'},	300); // move up - hide
		});
	
	});
	</script>
  </head>
  
  <body>
    <!-- 代码 开始 -->
<div id="menu2" class="menu">
	<ul>
	<li><a href="#">首 页</a></li>
	<li><a href="#">余姚市国土局</a></li>
	<li><a href="#">慈溪市国土局</a></li>
	<li><a href="#">奉化市国土局</a></li>
	<li><a href="#">宁海县国土局</a></li>
	<li><a href="#">象山县国土局</a></li>
	<li><a href="#">鄞州分局</a></li>
    <li><a href="#">海曙分局</a></li>
	<li><a href="#">江东分局</a></li>
	</ul>
	<div class="cls"></div>
</div>
<div id="menu2" class="menu">
    <ul>
	<li><a href="#">江北分局</a></li>
	<li><a href="#">镇海分局</a></li>
	<li><a href="#">北仑分局</a></li>
	<li><a href="#">高新区分局</a></li>
	</ul>
<div class="cls"></div>
<!-- 代码 结束 -->
  </body>
</html>
