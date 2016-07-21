<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.js"></script>
<script type="text/javascript">
$("document").ready(function(){
	$("input[name='username']").focus();
});
</script>

<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="${pageContext.request.contextPath}/manage/css/Style.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<table width="452" height="290" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td bgcolor="#FFFFFF">
								<table width="452" height="290" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="74">
											<img src="${pageContext.request.contextPath}/manage/images/logintitle.jpg">
										</td>
									</tr>
									<tr>
										<td align="center" valign="bottom" background="${pageContext.request.contextPath}/manage/images/loginbg.gif">
											<s:form action="loginAction_login.action" >
											    <s:actionerror></s:actionerror>
												<table border="0" align="center" cellpadding="2" cellspacing="0">
													<tr align="center">
														<td height="30" colspan="2" style="border-bottom: 1px dotted #cccccc">
															<strong style="font-size: 14px;">请登录</strong>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<font color="000F60"><strong>用户名：</strong> </font>
														</td>
														<td>
														    <s:textfield name="loginname" cssClass="text"></s:textfield>
														    <span><s:fielderror fieldName="username"></s:fielderror></span>
															
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<strong><font color="000F60">密码： </font> </strong>
														</td>
														<td>
													        <span>
													        <s:password name="password" cssClass="text"></s:password>
													        <s:fielderror fieldName="password"></s:fielderror>
													        </span>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap colspan="2">
															<strong><font color="red"></font></strong>
														</td>
													</tr>
													<tr>
														<td height="30">
														</td>
														<td>
													        <s:submit value="确认"></s:submit>	
													        <s:reset value="取消"></s:reset>		
															
														</td>
													</tr>
												</table>
											</s:form>

											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="30" align="center">
													</td>
												</tr>
												<tr>
													<td height="23" align="center"></td>
												</tr>
											</table>
										</td>
									</tr>

								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>

