<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
			//function addUser(){
			//	document.Form1.action = "${pageContext.request.contextPath}/user/add.jsp";
			//	document.Form1.submit();
			//}
			
			//$(document).ready(function(){
            //     $("#add").click(function () { 
            //       window.location.href = "FenJuInfoAction_addUI.action";
                    
            //});
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form0" name="Form0" action="FenJuInfoAction_add.action" method="post">
		 
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			    <tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="2"
						height="26">
						<strong><STRONG>添加分局信息</STRONG>
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

					</td>
				</tr>
			</table>
		</form>
		
		<form id="Form1" name="Form1" action="#" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
                    <tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>分局信息列表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button  id="add" name="add" value="添加" class="button_add" >
添加
</button>
						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="26%">
										分局名称
									</td>
									<td align="center" width="16%">
										分局IP
									</td>
									<td align="center" width="26%">
										联系地址
									</td>
									<td align="center" width="10%">
										显示(是/否)
									</td>
									<td align="center" width="7%">
										编辑
									</td>
									<td align="center" width="7%">
										查看
									</td>
									<td align="center" width="7%">
										删除
									</td>
								</tr>
								<s:iterator value="#fenjuinfos" >
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="26%">
												<s:property value="fjName"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="16%">
												<s:property value="ipAddress"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="26%">
												<s:property value="fjLocation"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<s:if test="view == 1">
												     是
												</s:if>
												<s:else>
												    否
												</s:else>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<s:a action="FenJuInfoAction_updateFenJuInfoUI.action?fjId=%{fjId}">
													<img src="${pageContext.request.contextPath}/manage/images/i_edit.gif" border="0" style="CURSOR: hand">
												</s:a>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<s:a action="FenJuInfoAction_findFenJuInfoUI.action?fjId=%{fjId}">
													<img src="${pageContext.request.contextPath}/manage/images/button_view.gif" border="0" style="CURSOR: hand">
												</s:a>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<s:a action="FenJuInfoAction_deleteFenJuInfo.action?fjId=%{fjId}">
													<img src="${pageContext.request.contextPath}/manage/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</s:a>
											</td>
										</tr>
							      </s:iterator>
										

							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

