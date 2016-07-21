<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.zdcq.s2sh.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>详细</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/content.css">

<script src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>

<script type="text/javascript">
	   function findNewsBySmallClassId(id){	
	     var fenJuId = "${fjInfo.fjId}";
		 $.ajax({   
				url:"${fjInfo.ipAddress}"+"/zdcqServer/ws/service/snewslist/"+ id +"/" + fenJuId , 
				contentType:"application/json",   
				type:"GET",  
				dataType: "jsonp",
				jsonp: "callback",
				//jsonpCallback:"CallbackHandler",   
				error:function(XMLHttpRequest, textStatus, errorThrown) {   
				         alert("该（县）区市服务器正忙...");
					    //alert(XMLHttpRequest.status);
                        //alert(XMLHttpRequest.readyState);
                        //alert(textStatus);
					  }, 
				success:function(json) {  
					  //alert(json['WrzcnetNews'].click); 
					  //ClassifyNews = json['ClassifyNews']; //解析json数组		  
					  newslist = json["News"]; //得到newslist对象
					  tianchongshuju(newslist, id); //填充数据
				  }   
		  });  
					 
	   }
	   
	  function tianchongshuju(newslist, id) {  
		 table = $("#"+id); 
		 table.children().each(function(i,n){
			 var obj = $(n);
			 obj.children().each(function(i,n){
				 var obj1 = $(n); //拿到<tr>
				 var node = newslist[i];
				    obj1.children().each(function(i,n){
					 var obj2 = $(n);  //拿到<td>
				     if(i == 0) {
                         var title = node.title.substring(0,15);
                       
						 obj2.html("<a href='${pageContext.request.contextPath}/VisitAction_showNewsDetail.action?sid="+id+"&fjId="+'${fjInfo.fjId}'+"&newsId="+ node.id+"' title='"+ node.title +"' target='_blank'> &nbsp;"+ title+"</a>");
					 }
					 else {
						 node.updateTime = node.updatetime.substring(0,11);
						 obj2.html(node.updateTime);
				     } 
					 

				});
			});
		 });
	  } 
	  
	  
	   function loadNews() {
	       //拿到链表
	        var secondList = "${secondList}";
  			<%
			    List<SecondTopic> secondList = (List<SecondTopic>)request.getAttribute("secondList");
			    for(SecondTopic st:secondList){
			    %>
			    	findNewsBySmallClassId(<%=st.getSid() %>);
			    <%
			    }
			 %>
			 
		}
		
		//伴随网页的启动,而加载
		$(function() {  
		   loadNews();
		});  
		
</script>
<body>
		<div id="main">
			<div style="width:400px; margin-bottom:20px; background-color: 27408B;">
				<a href="#"><span class="tab1">${fTopic.name}---${fjInfo.fjName}</span> </a>
			</div>
			
			<div class="all_mb all_mb2" style="width:661px;height:175px;">
            <c:forEach items="${secondList}" var="sl" varStatus="vs">
               
				<div class=${vs.index%2==0?'dzgk all_mb1':'ffcs all_mb1'}
					style="padding-right:0px;height:183px; ">
					<h1 style="padding-left: 20px; background-color:#DEF0FB;  ">
						<font style="color: #069; font-size: 16px;">${sl.name}</font><a target="_self"
							href="${pageContext.request.contextPath}/VisitAction_sectionInfo.action?fjId=${fjInfo.fjId}&sid=${sl.sid}">更多..</a>
					</h1>
					<table id="${sl.sid}" class="lby_nr lby_nr1" width="325px" border="0"
						cellspacing="0" cellpadding="0" style="font-family: 微软雅黑;">

							<tr>
								<td height="28"></td>
								<td align="right"></td>
							</tr>

							<tr>
								<td height="28"></td>
								<td align="right"></td>
							</tr>

							<tr>
								<td height="28"></td>
								<td align="right"></td>
							</tr>

							<tr>
								<td height="28"></td>
								<td align="right"></td>
							</tr>

					</table>
				</div>
				<c:if test="${vs.count%2 == 0 && vs.count != 8}">
				    </div>
		             <div class="all_mb all_mb2" style="width:661px;height:175px;">   
				</c:if>
            </c:forEach>
            </div>
</body>
</html>
