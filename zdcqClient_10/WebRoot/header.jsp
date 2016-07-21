<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.zdcq.s2sh.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>阳光征地拆迁</title>

<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
  ================================================== -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsiveslides.css" />

<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
<!--[if lt IE 9]>
		<script src="js/html5.js"></script>
	<![endif]-->

<link href='${pageContext.request.contextPath}/images/favicon.ico' rel='icon' type='image/x-icon' />

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/responsiveslides.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			pager : true,
			nav : true,
			speed : 500,
			maxwidth : 800,
			namespace : "centered-btns"
		});
	});
</script>

</head>
<body>
	<!--------------Header--------------->
	<header>
		<div class="zerogrid">
			<img src="${pageContext.request.contextPath}/images/headerBg.jpg">
		</div>
	</header>
	<!-- 导航栏 -->
	<div style="width:1200px; height:80px; margin:0 auto;">
	   <table style="width:1200px; height:80px;" >
	   <tr>
	      <c:forEach items="${fenJuList}" var="f" varStatus="fs">	
	       <c:if test="${fs.count == 8}">
              </tr><tr>
           </c:if>
	       
		   <td align="center">
		   		<a href="${pageContext.request.contextPath}/servlet/ControllerSevlet?op=fjxx&fjId=${f.fjId}" target="select">${f.fjName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>	
		   </td>
		 </c:forEach>
		 </tr>
	   </table>
	</div>