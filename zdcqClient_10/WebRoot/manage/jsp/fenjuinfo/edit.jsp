<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
		<!-- 日期插件，使用jquery -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.4.2.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/jquery/jquery.datepick.css" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.datepick.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.datepick-zh-CN.js"></script>
	</HEAD>
	<script type="text/javascript">
		$(document).ready(function(){
			//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
			$('#birthday').datepick({dateFormat: 'yy-mm-dd'}); 
		});
	</script>
	<body>
		<s:form action="FenJuInfoAction_update.action" >
			&nbsp;
			<s:hidden name="fjId"></s:hidden>
			<table cellSpacing="1" cellPadding="5" width="40%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑分局信息</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td align="right" bgColor="#f5fafe" class="ta_01">
						分局名称：
					</td>
					<td align="left" class="ta_01" bgColor="#ffffff">
						<s:textfield name="fjName"></s:textfield>
					</td>
				</tr>
				<tr>
					<td align="right" bgColor="#f5fafe" class="ta_01">
						IP地址：
					</td>
					<td align="left" class="ta_01" bgColor="#ffffff">
						<s:textfield name="ipAddress"></s:textfield>
					</td>
				</tr>
				<tr>
					<td align="right" bgColor="#f5fafe" class="ta_01">
						联系地址：
					</td>
					<td align="left" class="ta_01" bgColor="#ffffff">
					    <s:textfield name="fjLocation"></s:textfield>
					</td>
				</tr>
				<tr>
					<td align="right" bgColor="#f5fafe" class="ta_01">
						是否显示：
					</td>
					<td align="left" class="ta_01" bgColor="#ffffff">
					    <s:select list="#views" listKey="id" listValue="name" name="view"></s:select>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" name="submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</HTML>