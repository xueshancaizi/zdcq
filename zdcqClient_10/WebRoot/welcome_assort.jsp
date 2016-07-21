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
     <!-- 日期选择 -->   

<!-- 日期选择beg -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pikaday.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pikaday.min.js"></script>

<!-- 日期选择end -->

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
       select.location.href = "${pageContext.request.contextPath}/VisitAction_fjxx.action?fjId="+ fjId +"&fid=79";
    }
		//伴随网页的启动,而加载该市的征地拆迁专栏信息
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
	   	        alert(keyWord);
	   	        var begdate = $("#txtBeginDate").val();
	   	        var enddate = $("#txtEndDate").val();
	   	        if (keyWord != "" && begdate != "" && enddate != "") 
				{
					select.location.href = "${pageContext.request.contextPath}/searchResult.jsp?keyWord=" + keyWord +"&fjId=" + fjId + "&begdate=" + begdate + "&enddate=" + enddate;				  
				}else{
				    alert("请选择开始、结束日期和关键词");
				}
	        	
	        }		
    	);
	});
	</script>

</head>
<body>
	<!--------------Header--------------->
	<header>
		<div class="zerogrid">
			 <!-- <img src="${pageContext.request.contextPath}/images/headerBg.jpg">  -->
			<!--  
			 <embed src="${pageContext.request.contextPath}/images/swf/1028_02.swf"  autostart="true" loop="true" height="140px" width="1002px"> 
-->
   <img src="${pageContext.request.contextPath}/images/PNG/${sessionScope.fjId}.PNG" height="100px" width="1002px"> 
<!--  
		<OBJECT WIDTH="1002px" HEIGHT="140px">
		<PARAM NAME=movie VALUE="${pageContext.request.contextPath}/images/swf/1028_${sessionScope.fjId}.swf"> 
		<EMBED src="${pageContext.request.contextPath}/images/swf/1028_${sessionScope.fjId}.swf" WIDTH="1002px" HEIGHT="140px" NAME="2" ALIGN=""></EMBED>
		</OBJECT>
		-->	
		</div>
	</header>  

	<!--------------Content--------------->
	<section id="content">
		<div class="zerogrid">
			<div style="width:1002px; height:0px; background-color: #ffffff;">
			    <font style="font-size:18pt; color:#C61F0C;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</div>
			<div class="row block">
				<div class="main-content col11"
					style="height:800px;width:70%; min-height:600px;border-right: 1px solid #C9C9C9;">
					<!-- target 指向 select -->
					<iframe name="select" scrolling="no" width="100%" height="100%"
						frameborder="0" src="${pageContext.request.contextPath}/content.jsp"> </iframe>
				</div>
                
				<div class="sidebar col05" style=" float:left;padding-top: 0px;">
				 <!-- 搜索框 -->
				 <div  style="padding-bottom: 5px;">
					  <div id="search">
					    <input type="text" style="width:150px; height:25px;border: 1px solid #CCC; border-radius: 3px;"name="q" value="">
					    <input type="button" style="border: 1px solid #CCC; border-radius: 3px;"id="ssss" class="button"  value="搜  索">
					  </div>
			      </div>
			      <div class="box" style="text-align: left; padding-bottom: 5px;">
			          <span><font style="font-size: 12px; font-family: 微软雅黑; color: rgb(0, 0, 0);">开始日期：</font><input  id="txtBeginDate" class="sang_Calender" type="text" style="width:90px;padding:3px 5px;border:1px solid #ccc;margin-right:10px;border-radius: 3px;"/></span><br/>
				      <span><font style="font-size: 12px; font-family: 微软雅黑; color: rgb(0, 0, 0);">结束日期：</font><input  id="txtEndDate" class="sang_Calender1"  type="text" style="width:90px;padding:3px 5px;border:1px solid #ccc;border-radius: 3px;" /></span>
			      <script type="text/javascript">
				    var picker = new Pikaday(
				    {
				        field: document.getElementById('txtBeginDate'),
				        firstDay: 1,
				        minDate: new Date('2001-01-01'),
				        maxDate: new Date('2020-12-31'),
				        yearRange: [2000,2020]
				    });
				    
				    var picker1 = new Pikaday(
				    {
				        field: document.getElementById('txtEndDate'),
				        firstDay: 1,
				        minDate: new Date('2001-01-01'),
				        maxDate: new Date('2020-12-31'),
				        yearRange: [2000,2020]
				    });
				
				</script>

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
								    	<a style="padding: 8px 10px; margin: 0px 10px 10px 0px; " href="${pageContext.request.contextPath}/VisitAction_sectionInfo.action?fjId=${sessionScope.fjId}&sid=${s.sid}" target="select" onmouseover="javascript:MySetBackColor3(this, ${s.sid})" onmouseout="javascript:MySetBackColor4(this, ${s.sid})"><span><img src="${pageContext.request.contextPath}/images/zhengwugkxin_06.jpg" style="border: 0px;margin: 9px 0px 0px 5px;"/><font id="mfont${s.sid}" style=" float:center; font-size: 16px; font-family: 微软雅黑; color: #000000;">&nbsp;${s.name}</font></span></a></li>
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
				object.style.backgroundColor="#ffffff";
				document.getElementById("mfont" + index).style.color="#000000";
				document.getElementById("mfont" + index).style.border="";
			}
			</script>
	<!--------------Footer--------------->
   <%@include file="bottom.jsp" %>

</body>
</html>