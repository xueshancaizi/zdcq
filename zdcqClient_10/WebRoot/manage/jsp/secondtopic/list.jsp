<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	    <script language="javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.js"></script>
	   <script type="text/javascript">

			$(document).ready(function(){
				$("#add").click(function(){
					window.location.href = "${pageContext.request.contextPath}/secondTopicAction_addUI.action"
				})
			})
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1"  method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>二 级 栏 目 列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="添加" class="button_add" >
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
									<td align="center" width="17%">
										栏目ID
									</td>
									<td align="center" width="17%">
										栏目名称
									</td>
									<td align="center" width="17%">
										所属大类
									</td>
									<td  align="center" width="7%">
										修改
									</td>
									<td  align="center" width="7%">
										删除
									</td>
								</tr>
								<s:iterator value="#list" >							      
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<s:property value="sid"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<s:property value="name"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<s:property value="firstTopic.fid"/>
											</td>
											<td align="center" style="HEIGHT: 22px" width="7%">
												<s:a action="secondTopicAction_updateUI.action?sid=%{sid}">
													<img src="${pageContext.request.contextPath}/manage/images/button_view.gif" border="0" style="CURSOR: hand">
												</s:a>
											</td>
											<td align="center" style="HEIGHT: 22px" width="7%">
												<s:a action="secondTopicAction_delete.action?sid=%{sid}">
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

