<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/manage/css/left.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/manage/css/SimpleTree.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/manage/js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/manage/js/SimpleTree.js"></script>
<script type="text/javascript">
$(function(){
	$(".st_tree").SimpleTree({
        //可忽略该操作
		click:function(a){
			if(!$(a).attr("hasChild"))
				//right.location.href = "${pageContext.request.contextPath}/userAction_showAllUsers.action";
		}
		
	});
	
});
</script>
</head>
<body>

<div class="st_tree" style="width:300px;margin:0 auto;">
	<ul>
		<li><a href="${pageContext.request.contextPath}/forwardAction_forward.action?method=welcome"  target="right">欢迎界面</a></li>
		<li><a href="#" ref="xtgl">系统管理</a></li>
		<ul show="true">
			<li><a href="${pageContext.request.contextPath}/userAction_showAllUsers.action" target="right">用户管理</a></li>
			<li><a href="${pageContext.request.contextPath}/userAction_addUserUI.action" target="right">添加用户</a></li>
		</ul>
		<li><a href="${pageContext.request.contextPath}/FenJuInfoAction_showAllFenJuInfo.action" target="right">部门管理</a></li>
        <li><a href="#" ref="ckgl">栏目管理</a></li>
        <ul>
			<li><a href="${pageContext.request.contextPath}/firstTopicAction_findAllFirstTopic.action" target="right">总栏管理</a></li>
			<li><a href="${pageContext.request.contextPath}/secondTopicAction_findAllSecondTopic.action" target="right">大类管理</a></li>
		</ul>
	</ul>
</div>
</body>
</html>
