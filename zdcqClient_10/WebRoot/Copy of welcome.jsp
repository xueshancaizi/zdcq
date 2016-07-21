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
<script src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
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
<script type="text/javascript">

    function flash() {
       var fjId = "${sessionScope.fjId}";
       if( fjId != "0") {
            //指定iframe
       		select.location.href = "${pageContext.request.contextPath}/VisitAction_fjxx.action?fjId="+ fjId;
       }

    }
    //模拟鼠标点击导航栏，找出内容
		//伴随网页的启动,而加载
		$(function() {  
		   flash();
		})  
</script>
<!-- 导航栏 -->
	<link href="${pageContext.request.contextPath}/css/daohang.css" rel="stylesheet" type="text/css" />
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
	<!--------------Header--------------->
	<header>
		<div class="zerogrid">
			 <!-- <img src="${pageContext.request.contextPath}/images/headerBg.jpg">  -->
			 <embed  src="${pageContext.request.contextPath}/images/swf/1008_02.swf" hidden="false" autostart="true" loop="true" height="135px" width="1002px"> 
		</div>
	</header>
    <!-- 代码 开始 -->
<div id="menu2" class="menu">
	<ul>
	<li><a href="#" onclick="javascript:fenjuxinxi('0')" target="select" style="cursor:pointer;">首 页</a></li>
	<c:forEach items="${fenJuList}" var="f" varStatus="fs">
     <c:if test="${fs.count == 9}">
                  
		</ul>
		<div class="cls"></div>
	</div>
	<div id="menu2" class="menu">
	    <ul>
    
     </c:if>
	<li><a href="#" onclick="javascript:fenjuxinxi('${f.fjId}')"  style="cursor:pointer;cursor:hand;"  target="select">${f.fjName}</a></li>
	
	</c:forEach>
	</ul>
    <script type="text/javascript">
	    function fenjuxinxi(fjId) {
	        window.location.href = "${pageContext.request.contextPath}/VisitAction_fJXXFresh.action?fjId="+ fjId;
	    }
	</script>
<div class="cls"></div>
</div>
<!-- 代码 结束 -->

	<!--------------Content--------------->
	<section id="content">
		<div class="zerogrid">
			<div style="width:1002px; height:0px; background-color: #ffffff;">
			    <font style="font-size:18pt; color:#C61F0C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</div>
			<div class="row block">
				<div class="main-content col11"
					style="height:800px;width:71%; min-height:600px;border-right: 1px solid #C9C9C9;">
					<!-- target 指向 select -->
					<iframe name="select" scrolling="no" width="100%" height="100%"
						frameborder="0" src="${pageContext.request.contextPath}/content1.jsp"> </iframe>
				</div>

				<div class="sidebar col05" style="float:right;">
                    <c:forEach items="${firstList}" var="f">
                        <section>
						<div  style="text-align: left;">		
						<a href="${pageContext.request.contextPath}/VisitAction_fjxx.action?fjId=${sessionScope.fjId}&fid=${f.fid}" target="select"><font style="font-size:14pt; color:#000000;">&nbsp;&nbsp;${f.name}</font></a>
						
						</div>
							<div class="content" style="padding: 20px 0px 0px 0px;" >
								<ul class="list">
								    <c:forEach items="${f.secondTopic}" var="s" varStatus="fs">
								    	<li style=" line-height: 34px;display: block; box-sizing: border-box; text-align: left; background-color: #ffffff; ">
								    	<a style="padding: 8px 20px; margin: 0px 10px 10px 0px; background-color:#00AFE4;" href="${pageContext.request.contextPath}/VisitAction_sectionInfo.action?fjId=${sessionScope.fjId}&sid=${s.sid}" target="select" onmouseover="javascript:MySetBackColor3(this, ${s.sid})" onmouseout="javascript:MySetBackColor4(this, ${s.sid})"><font id="mfont${s.sid}" style=" font-size: 16px; font-family: 微软雅黑; color: #ffffff;">${s.name}</font></a></li>
								    </c:forEach>
								</ul>
							</div>
					    </section>
                    </c:forEach>
				</div>
			</div>
		</div>
	</section>
		   <script type="text/javascript">
	        function MySetBackColor3(object, index){
				object.style.backgroundColor="#FABD00";
				document.getElementById("mfont" + index).style.color="#ffffff";
				document.getElementById("mfont" + index).style.border="thin solid #FFC125";
			}
			function MySetBackColor4(object, index){
				object.style.backgroundColor="#00AFE4";
				document.getElementById("mfont" + index).style.color="#FFFFFF";
				document.getElementById("mfont" + index).style.border="";
			}
			</script>
	<!--------------Footer--------------->
   <%@include file="bottom.jsp" %>

</body>
</html>