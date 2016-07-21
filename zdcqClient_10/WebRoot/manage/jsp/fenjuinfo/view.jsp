<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	</HEAD>
	<body>
		<form>
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="2"
						height="26">
						<strong><STRONG>查看分局信息</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						分局名称:
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<s:property value="fjName"/>
					</td>
				</tr>
				
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						IP地址：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<s:property value="ipAddress"/>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						联系地址：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<s:property value="fjLocation"/>
					</td>
				</tr>
				<TR>
					<td class="ta_01" style="WIDTH: 100%" align="right" bgColor="#f5fafe" colSpan="4">
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</TR>
			</table>
		</form>
	</body>
</HTML>