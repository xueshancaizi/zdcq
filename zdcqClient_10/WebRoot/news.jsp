<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.zdcq.s2sh.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!--  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
-->
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
<style type="text/css">
    #mainDiv { background: #FFFFFF;
	        width:1002px;
	        margin:0px auto;
		}
		
	#myTitleDiv { 
	    padding-top: 20px;
	    background: #FFFFFF;
		width:99%;
		height:100px;
		margin:0 auto;
        border-bottom-color: #cccccc;
    	border-bottom-style: dashed;
    	border-bottom-width: thin;
	}
	
	#contentDiv { 
	    padding-top:10px;
	    background-color: #FFFFFF;
		margin:0 auto;
		FONT-SIZE: 14px; 
		LINE-HEIGHT: 32px;
		text-align: left;
		overflow:hidden;
		width:70%;
		border-bottom-color: #cccccc;
    	border-bottom-style: dashed;
    	border-bottom-width: thin;
    	padding-bottom: 20px;
	}   
	   
	 #contentDiv2 { 
	    padding-top:10px;
	    height:100px;
	    background-color: #FFFFFF;
		margin:0 auto;
		FONT-SIZE: 14px; 
        font-family: 宋体;
		LINE-HEIGHT: 32px;
		text-align: left;
		overflow:hidden;
		width:70%;
		border-top-color: #cccccc;
    	border-top-style: dashed;
    	border-top-width: thin;

	}    
	
	#copyright {
	    margin: 0px auto;
	    display: inline-block;
	    width: 1002px;
	    height: 120px;
	    text-align: center;
	    background: transparent url("${pageContext.request.contextPath}/images/bg-footer.png") repeat scroll 0% 0%;
	    padding: 8px 0px;
	    color: #FFF;
	}  
    
    body{ 
        text-align:center;
        background: #FFF url("${pageContext.request.contextPath}/images/webbj.jpg") repeat-x fixed 0% 0%
    }
    
    p{
        margin: 0;
       padding: 0;
    }
    #mytable {
    	width: 100%; 
    	height: 37px; 
    	margin: 0px auto 1px;
  
    	background: #ffffff url("${pageContext.request.contextPath}/images/lines3.png") ;
    	position: relative;
    	float: center;
    	padding: 0px;

    }
    #mytr{
    	background: #ffffff url("${pageContext.request.contextPath}/images/lines3.png") ;
    	text-align: center;
    	float:none;
    	font-size:20pt;
    	font-color:#0D4D78;
    	font-family: 宋体;
    	border-top-color: #cccccc;
    	border-top-style: dashed;
    }
    #mytd1{
    	background: #ffffff url("${pageContext.request.contextPath}/images/lines3.png") ;
    	text-align: center;
    	float: none;
    	font-size:20pt;
    	font-color:#0D4D78;
    	font-family: 宋体;
    }
    #mytd2{
    	background: #ffffff url("${pageContext.request.contextPath}/images/lines3.png") ;
    	text-align: left;
    	float: left;
    	font-size:12pt;
    	font-color:#0D4D78;
    	font-family: 宋体;
    	
    }
    #mytd3{
    	background: #ffffff url("${pageContext.request.contextPath}/images/lines3.png") ;
    	text-align: right;
    	float: none;
    	font-size:12pt;
    	font-color:#0D4D78;
    	font-family: 宋体;
    	
    }
</style>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/responsiveslides.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
    var newsid="${newsId}"
    var sid="${sid}"

	function findNewsByNewsID(id){		 
	 $.ajax({   
			url:"${fjInfo.ipAddress}"+"/zdcqServer/ws/service/news/"+ sid +"/"+id,   
			contentType:"application/json",   
			type:"GET",  
            dataType: "jsonp",
		    jsonp: "callback",
			timeout:50000,   
			error:function() {   
				  alert("request error!");   
				  },   
			success:function(json) {  
				 resolv_json(json['NewsModel']) ; //解析json数组
			  }   
	  });  
				 
   }
   
	 function resolv_json(json)
	 {    
		  var p=$("<p></p>");
		  var span1=$("<span></span>");
          $("#mytitle").html(json.title);
		  $("#original").html(json.origin);
		  $("#click").html(json.click);
		  
		  json.updateTime1 = json.updatetime.substring(0,11);
		  $("#updatetime").html(json.updateTime1);
		 
		  $("#contentDiv").html(json.content);

	 }
    
       //伴随网页的启动,而加载
		$(function() {  
		   findNewsByNewsID(newsid);
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
	<header style="height: 135px; width: 100%; ">
		<div class="zerogrid" >
		   <img src="${pageContext.request.contextPath}/images/PNG/${fjInfo.fjId}.PNG" style="width:100%;height:100%;"> 
			<!--  
			<embed  src="${pageContext.request.contextPath}/images/swf/1028_${fjInfo.fjId}.swf" hidden="false" autostart="true" loop="true" height="140px" width="1002px"> 
			-->
		</div>
	</header>
    <!-- 代码 开始 -->
<div id="menu2" class="menu">
	<ul>
	<li><a href="${pageContext.request.contextPath}/VisitAction_visitByCity.action?loc=${fjInfo.fjLocation}" style="cursor:pointer;">首 页</a></li>
	</ul>
<div class="cls"></div>
</div>
<!-- 代码 结束 -->

  <div id="mainDiv" style="width: 1002px; border: 1px solid #cccccc;">
    	<div id="myTitleDiv"  >
            <table id="mytable" style="color: #000000">
               
              <tr id="mytr" >
                <td id="mytd1"  style="background-color: #ffffff"><span align="center" id="mytitle" style="color: #0D4D78; font-size: 15pt;"></span></td>
              </tr>
              <tr id="mytr">
                 <td id="mytd2" style="font-size: 13px;">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表日期:<span id="updatetime"></span>&nbsp;&nbsp;&nbsp;阅读次数:<span id="click"></span>&nbsp;&nbsp;&nbsp;来源:<span id="original"></span>
                 </td>
              </tr>
              <tr id="mytr">
                 <td id="mytd3" >
					<font color="#555555" size="2">保护视力色： </font>
					<a onclick="setBackColor('FAFBE6');" href="javascript://"><font color="#555555"><img style="max-width: 10px; height: 10px; width:10px; " alt="杏仁黄" src="${pageContext.request.contextPath}/images/detail/color1.gif"  border="0"></font></a> 
					<font color="#555555">&nbsp;</font>
					<a onclick="setBackColor('FDE6E0');" href="javascript://">
						<font color="#555555"><img style="max-width: 10px; height: 10px; width:10px; " alt="胭脂红" src="${pageContext.request.contextPath}/images/detail/color3.gif"  border="0"></font></a>
					<font color="#555555">&nbsp;</font>
					<a onclick="setBackColor('F3FFE1');" href="javascript://">
						<font color="#555555"><img style="max-width: 10px; height: 10px; width:10px; " alt="芥末绿" src="${pageContext.request.contextPath}/images/detail/color4.gif"  border="0"></font></a>
					<font color="#555555">&nbsp;</font>
					<a onclick="setBackColor('DAFAFE');" href="javascript://">
						<font color="#555555"><img style="max-width: 10px; height: 10px; width:10px; " alt="天蓝" src="${pageContext.request.contextPath}/images/detail/color5.gif"  border="0"></font></a>
					<font color="#555555">&nbsp;</font>
					<a onclick="setBackColor('E9EBFE');" href="javascript://">
						<font color="#555555"><img style="max-width: 10px; height: 10px; width:10px; " alt="雪青" src="${pageContext.request.contextPath}/images/detail/color6.gif"  border="0"></font></a> 
					<font color="#555555">&nbsp;</font> 
					<a onclick="setBackColor('EAEAEF');" href="javascript://">
						<font color="#555555"> <img style="max-width: 10px; height: 10px; width:10px; " alt="灰" src="${pageContext.request.contextPath}/images/detail/color7.gif"  border="0"></font></a> 
					<font color="#555555">&nbsp;</font>
					<a onclick="setBackColor('FFFFFF');" href="javascript://">
						<img style="max-width: 10px; height: 10px; width:10px; " alt="银河白(默认色)" src="${pageContext.request.contextPath}/images/detail/color8.gif"  border="0"></a>
					<font color="#555555">【 </font>
					<a style="text-decoration:none;" href="javascript:chgfsize(16)"><font color="#555555">大</font></a>
					<a style="text-decoration:none;" href="javascript:chgfsize(14)"><font color="#555555">中</font></a>
					<a style="text-decoration:none;" href="javascript:chgfsize(12)"><font color="#555555">小</font></a>
					<font color="#555555">】</font>
                 </td>
              </tr>
            </table>         
        </div>

        <div id="contentDiv" style="font-family: 宋体;  color:black;   font-size: 12px; line-height: 20px; padding-left: 20px; padding-right: 16px; letter-spacing: 1px;  width: 90%; margin-top: 30px;"> 
          
        </div>
        <script type="text/javascript">
        function setBackColor(color){
				if(!color||color=='')
					color='FFFFFF';
				document.getElementById("contentDiv").style.backgroundColor="#"+color;
		}
		function chgfsize(size){
		        document.getElementById("contentDiv").style.fontSize=size+"px";
		}
        </script>
        <script src="${pageContext.request.contextPath}/js/gototop.js"></script>
        <div id="contentDiv2">
        	<table width="100%">
			<tr>
				<td align="left" height="25" width="217" style="padding-left: 10px;"><img
					src="${pageContext.request.contextPath}/images/1s.jpg" width="16" height="16"> <font
					color="#1A5695" size="2">关键词：</font> </td>
				<td align="right"  style="padding-right: 10px;">【<a style="text-decoration:none;"href="${pageContext.request.contextPath}/VisitAction_visitByCity.action?loc=${fjInfo.fjLocation}">返回首页</a>】	
						【<a style="text-decoration:none;"href="javascript:void(0)" onclick="goto_top();">返回顶部</a>】
						【<a style="text-decoration:none;"href="javascript:window.close()">关闭窗口</a>】
						<!-- 
						【<a style="text-decoration:none;"href="javascript:suberror2()">我要纠错</a>】
						 -->
						</td>
			
				</tr>
			</table>
        </div>
 	</div>	
	<!--------------Footer--------------->
   <div id="bottom">
   	<%@include file="bottom.jsp" %>
   </div>
</body>
</html>