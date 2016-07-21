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
		
	    $("#ssss").click(
	        function(){
	            var keyWord = $("input[name='q']").attr("value").trim();   
	   	        var fjId = "${sessionScope.fjId}";
	   	        //alert(keyWord);
	   	        var begdate = $("#txtBeginDate").val();
	   	        var enddate = $("#txtEndDate").val();
	        	select.location.href = "${pageContext.request.contextPath}/searchResult.jsp?keyWord=" + keyWord +"&fjId=" + fjId + "&begdate=" + begdate + "&enddate=" + enddate;
	        }		
    	);
	});
	</script>
<!-- 搜索栏 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css" />
    <script type="text/javascript">

    </script>
 <!-- 日期选择 -->   
<link href="${pageContext.request.contextPath}/css/lyz.calendar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.5.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lyz.calendar.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $("#txtBeginDate").calendar({
            controlId: "divDate",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
            speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
            complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
            readonly: true,                                       // 目标对象是否设为只读，默认：true
            upperLimit: new Date(),                               // 日期上限，默认：NaN(不限制)
            lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
            callback: function () {                               // 点击选择日期后的回调函数
                alert("您选择的日期是：" + $("#txtBeginDate").val());
            }
        });
        $("#txtEndDate").calendar();
    });
</script>

 
 
</head>
<body>
	<!--------------Header--------------->
	<header>
		<div class="zerogrid">
			 <!-- <img src="${pageContext.request.contextPath}/images/headerBg.jpg">  -->
			 <embed  src="${pageContext.request.contextPath}/images/swf/1028_02.swf" hidden="false" autostart="true" loop="true" height="140px" width="1002px"> 
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
	<li style="border-right: thin;"><a href="#" onclick="javascript:fenjuxinxi('${f.fjId}')"  style="cursor:pointer;cursor:hand;"  target="select">${f.fjName}</a></li>
	
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
                
				<div class="sidebar col05" style="float:left;padding-top: 0px;">
				 <!-- 搜索框 -->
				 <div class="container" style="padding-bottom: 5px;">
					  <div id="search">
					    <input type="text" name="q">
					    <input type="button" id="ssss" class="button"  value="搜  索">
					  </div>
			      </div>
			      <div class="box" style="text-align: left;">
				      <span><font style="font-size: 12px; font-family: 微软雅黑; color: rgb(0, 0, 0);">开始日期：</font><input id="txtBeginDate" style="width:90px;padding:3px 5px;border:1px solid #ccc;margin-right:10px;border-radius: 3px;"/></span><br/>
				      <span><font style="font-size: 12px; font-family: 微软雅黑; color: rgb(0, 0, 0);">结束日期：</font><input id="txtEndDate" style="width:90px;padding:3px 5px;border:1px solid #ccc;border-radius: 3px;" /></span>
			      </div>
                    <c:forEach items="${firstList}" var="f">
                        <section>
						<div style="line-height: 34px; text-align: left; background:url(images/gtindex_22.gif)">		
						<a href="${pageContext.request.contextPath}/VisitAction_fjxx.action?fjId=${sessionScope.fjId}&fid=${f.fid}" target="select"><font style="font-size:14pt; color:#069;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f.name}</font></a>						
						</div>
							<div class="content" style="padding: 20px 0px 0px 0px;" >
								<ul class="list">
								    <c:forEach items="${f.secondTopic}" var="s" varStatus="fs">
								    	<li style=" line-height: 28px; box-sizing: border-box; text-align: left; ">
								    	<a style="padding: 8px 10px; margin: 0px 10px 10px 0px; " href="${pageContext.request.contextPath}/VisitAction_sectionInfo.action?fjId=${sessionScope.fjId}&sid=${s.sid}" target="select" onmouseover="javascript:MySetBackColor3(this, ${s.sid})" onmouseout="javascript:MySetBackColor4(this, ${s.sid})"><font id="mfont${s.sid}" style=" font-size: 16px; font-family: 微软雅黑; color: #000000;">🌕&nbsp;${s.name}</font></a></li>
								    </c:forEach>
								</ul>
							</div>
					    </section>
                    </c:forEach>
                    <img height="200px" width="220px" src="${pageContext.request.contextPath}/images/1027.PNG">
				</div>
			</div>
		</div>
	</section>
		   <script type="text/javascript">
	        function MySetBackColor3(object, index){
				object.style.backgroundColor="#ffffff";
				document.getElementById("mfont" + index).style.color="#436EEE";
				document.getElementById("mfont" + index).style.border="thin solid #FFC125";
			}
			function MySetBackColor4(object, index){
				object.style.backgroundColor="#fffff";
				document.getElementById("mfont" + index).style.color="#000000";
				document.getElementById("mfont" + index).style.border="";
			}
			</script>
	<!--------------Footer--------------->
   <%@include file="bottom.jsp" %>

</body>
</html>