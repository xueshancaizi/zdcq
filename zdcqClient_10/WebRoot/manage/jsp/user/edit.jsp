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
		<!-- 日期选择beg -->
		<link href="${pageContext.request.contextPath}/manage/css/date_select.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/manage/js/jquery-1.8.3.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/manage/js/jquery.date_input.pack.js"></script> 
	    <script type="text/javascript">
			$(function(){
				$('.date_picker').date_input();
				})
		</script>
	    <!-- 日期选择end -->
	</HEAD>
	<script type="text/javascript">
		$(document).ready(function(){
			//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
			$('#birthday').datepick({dateFormat: 'yy-mm-dd'}); 
		});
	</script>
	<body>
		<s:form action="userAction_update.action" enctype="multipart/form-data">
			&nbsp;
			<s:hidden name="userID"></s:hidden>
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑用户信息</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						登录名：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
					    <s:textfield id="loginname" name="loginname" ></s:textfield>
					    <div id="divcheck"></div>
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						密码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
					    <s:password id="password" name="password"></s:password>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						 用户姓名：
					</td>
					<td class="ta_01" bgColor="#ffffff">
					    <s:textfield id="username" name="username"></s:textfield>
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						性别：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="radio" name="sex" id="sex男" value="男" checked="checked"/><label for="sex男">男</label>
						<input type="radio" name="sex" id="sex女" value="女"/><label for="sex女">女</label>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						出生日期：
					</td>
					<td class="ta_01" bgColor="#ffffff">
					    <input id="birthday" type="text" name="birthday" style="width:145px;background: #fefefe;border: 1px solid #bbb;font-size: 12px;color: #333;padding: 0px;border-radius: 1px; "  class="date_picker">			    
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						电话：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<s:textfield id="telephone" name="telephone"></s:textfield>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						兴趣爱好：
					</td>
					<td class="ta_01" bgColor="#ffffff" colSpan="3">
					    <s:checkboxlist  id="hobbies" list="#hobbies" listKey="hid" listValue="name" name="hids"></s:checkboxlist>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						简历资料：
					</td>
					<td class="ta_01" bgColor="#ffffff" colSpan="3">
					    <!-- 文件上传 -->
						<s:file name="resource" ></s:file>
					</td>
				</tr>
				<TR>
					<TD class="ta_01" align="center" bgColor="#f5fafe">
						备注：
					</TD>
					<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					    <s:textarea name="remark" rows="5" cols="42"></s:textarea>
					</TD>
				</TR>
				<TR>
					<td align="center" colSpan="4" class="sep1">
						<img src="${pageContext.request.contextPath}/manage/images/shim.gif">
					</td>
				</TR>

				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" name="submit" value="确定" class="button_ok">
							确定
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">重置</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</HTML>