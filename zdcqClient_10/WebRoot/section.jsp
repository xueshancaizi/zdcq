<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻列表</title>
</head>
<style>
A.red1 {
    color: #393939;
    text-decoration: none;
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}

</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
    function loadNewsList() {
         var sid= "${sid}"
         var fenJuId = "${fjInfo.fjId}";
 		 $.ajax({    
				url:"${fjInfo.ipAddress}"+"/zdcqServer/ws/service/snewslist/"+ sid +"/" + fenJuId ,
				contentType:"application/json",   
				type:"GET",  
                dataType: "jsonp",
				jsonp: "callback",
				//jsonpCallback:"CallbackHandler",  
				error:function(XMLHttpRequest, textStatus, errorThrown) {   
					    alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
					  }, 
				success:function(json) {  
					  //ClassifyNews = json['ClassifyNews']; //解析json数组  
					  newslist = json["News"]; //得到newslist对象
					 
					  getPage(newslist);  
	  
				  }   
		  });  
  
    }
    
 		function getJSONData(pn) {   
			    var totalCount = newslist.length; // 总记录数  
			 
				var pageSize = 20; // 每页显示几条记录  
				var pageTotal = Math.ceil(totalCount / pageSize); // 总页数  
			
				var startPage = pageSize * (pn - 1);  
				var endPage = startPage + pageSize - 1;  
				var $ul = $("#${sid}");  
				$ul.empty(totalCount);  
				for (var i = 0; i < pageSize; i++) {  
					$ul.append('<tr class="tr-tag"></tr>');  
				}  
				
				var dataRoot = newslist;  //获得ajax array[]
				var sid= "${sid}"
				if (pageTotal == 1) {     // 当只有一页时  
					for (var j = 0; j < totalCount; j++) {  
					dataRoot[j].updateTime = dataRoot[j].updatetime.substring(0,11);
					title = dataRoot[j].title.substring(0,30);
					 
						$(".tr-tag").eq(j).append("<td  height='28'><a href='${pageContext.request.contextPath}/VisitAction_showNewsDetail.action?sid="+ sid +"&fjId="+'${fjInfo.fjId}'+"&newsId="+dataRoot[j].id +"' target='_blank' title='"+dataRoot[j].title+"'><font style='font-family: 微软雅黑;font-size:16px;color:#000000;'>&nbsp;&nbsp;&nbsp"+"<img src='${pageContext.request.contextPath}/images/zhengwugkxin_06.jpg' style='border: 0px;margin: 9px 0px 0px 5px;'/>"+"&nbsp&nbsp;"+ title +"</font></a></td>").append("<td align='right'><font style='font-family: 微软雅黑;font-size:16px;'>"+dataRoot[j].updateTime+"</font></td>")   
					}  
				} else {  
					for (var j = startPage, k = 0; j < endPage, k < pageSize; j++, k++) {  
						if( j == totalCount){  
							break;       // 当遍历到最后一条记录时，跳出循环  
						}  
						dataRoot[j].updateTime = dataRoot[j].updatetime.substring(0,11);
						title = dataRoot[j].title.substring(0,30);
						$(".tr-tag").eq(k).append("<td  height='28'><a href='${pageContext.request.contextPath}/VisitAction_showNewsDetail.action?sid="+ sid +"&fjId="+'${fjInfo.fjId}'+"&newsId="+dataRoot[j].id +"' title='"+dataRoot[j].title +"' target='_blank' ><font style='font-family: 微软雅黑;font-size:16px;color:#000000;'>&nbsp;&nbsp;&nbsp;"+"<img src='${pageContext.request.contextPath}/images/zhengwugkxin_06.jpg' style='border: 0px;margin: 9px 0px 0px 5px;'/>"+"&nbsp;&nbsp;"+ title +"</font></a></td>").append("<td align='right'><font style='font-family: 微软雅黑;font-size:16px;'>"+dataRoot[j].updateTime+"</font></td>")  
					}  
				}  
				$(".page-count").text(pageTotal);  
		}  
		
		function getPage(newslist) {  
		                			
						pn = 1;  
						var totalCount = newslist.length; // 总记录数  
						var pageSize = 20; // 每页显示几条记录  
						var pageTotal = Math.ceil(totalCount / pageSize); // 总页数  
						$(".pageSize").text(pageSize);
						$(".totalPage").text(totalCount);
						$(".pageTotal").text(pageTotal);
						$("#next").click(function() {  
			
									if (pn == pageTotal) {  
										alert("后面没有了");  
										pn = pageTotal;  
									} else {  
										pn++;  
										gotoPage(pn);  
									}  
								});  
						$("#prev").click(function() {  
									if (pn == 1) {  
										alert("前面没有了");  
										pn = 1;  
									} else {  
										pn--;  
										gotoPage(pn);  
									}  
								})  
						$("#firstPage").click(function() {  
									pn = 1;  
									gotoPage(pn);  
								});  
						$("#lastPage").click(function() {  
									pn = pageTotal;  
									gotoPage(pn);  
								});  
						$("#page-jump").click(function(){  
							if($(".page-num").val()  <= pageTotal && $(".page-num").val() != ''){  
								pn = $(".page-num").val();  
								gotoPage(pn);  
							}else{  
								alert("您输入的页码有误！");  
								$(".page-num").val('').focus();  
							}  
						})  
						$("#firstPage").trigger("click");  
						   
		}  

		function gotoPage(pn) {  
			// alert(pn);  
			$(".current-page").text(pn);  
			getJSONData(pn)  
		}  
		
		//伴随网页的启动
		$(function() {  
		   loadNewsList();
		})  
</script>
<body>

<table width="97%">
<tbody>
<tr>
 <td valign="top">
 
<table class="center_table3" id="table15" height="50" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
 <td height="4" bgcolor="#DEF0FB" width="4"></td>
 <td bgcolor="#DEF0FB"></td>
 <td bgcolor="#DEF0FB" width="4"></td></tr><tr><td height="30" bgcolor="#DEF0FB"></td>
 <td bgcolor="#DEF0FB">
	  <table id="table16" height="30" border="0" cellpadding="0" cellspacing="0" width="100%">
	  <tbody>
	  <tr>
	  <td class="subnav2" style="padding-top:5px; text-align: left;">
		<font style=" font-size:20px; color:#069; font-family: 微软雅黑;">&nbsp;&nbsp;&nbsp;&nbsp;${name}--${fjInfo.fjName}</font>
	  </td>
	  </tr>
	  </tbody>
	  </table>
  </td>
  <td bgcolor="#DEF0FB"></td>
  </tr>
  <tr>
  <td height="4" bgcolor="#DEF0FB"></td>
  <td height="4" bgcolor="#DEF0FB"></td>
  <td height="4" bgcolor="#DEF0FB"></td>
  </tr>
  </tbody>
  </table>
  <table width="100%">
  <tbody>
  <tr>
  <td valign="top">
  <div id="show_zwgk_page">
  <table class="center_table2" id="table17" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
  <tr>
  <td height="633" valign="top">
	  <table id="${sid}" class="Table_mouseover" style="font-size:12px;" height="26" border="0" cellpadding="0" cellspacing="0" width="100%">

	  </table>
  </td>
  </tr>
  <tr>
  <td align="center">
            每页<span class="pageSize"></span>条记录/共<span class="totalPage"></span>条记录&nbsp;&nbsp;第<span class="current-page"></span>页/<span class="pageTotal"></span>页
             <a id="prev" href="#">上一页</a>
             <a id="next" href="#">下一页</a>
             <a id="firstPage" href="#">首页</a>
             <a id="lastPage" href="#">末页</a>
             <input class="page-num" type="text"  size="3"/>
             <input id="page-jump" type="button" value="跳转"/>
	         
  </td>
  </tr>

  </tbody>
  </table>
  </div>
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  </tbody>
  </table>

</body>
</html>
