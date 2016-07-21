<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/manage/css/Style.css" type="text/css" rel="stylesheet">
		
		<script language="javascript" src="${pageContext.request.contextPath}/manage/js/public.js"></script>
		<!--  
		<script language="javascript" src="${pageContext.request.contextPath}/manage/js/check.js"></script>
		-->
        <!-- 表单验证beg -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/manage/css/screen.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/manage/js/checkform/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/manage/js/checkform/jquery.validate.js"></script>
		<script type="text/javascript">
		$().ready(function(){
			/*
			 * 如何不能满足验证需求时,自定义验证方法
			 * 	* $.validator.addMethod(name,method,message):固定写法
			 * 		* name:添加的方法的名字
			 * 		* method:一个函数,function(value,element,param){}
			 * 			* value:是元素的值,需要验证的元素的value属性值
			 * 			* element:是元素本身,对应页面的元素
			 * 			* param:是参数,调用自定义验证方法后的value值
			 * 		* message:就是自定义的错误提示(不用)
			 * 			label标签的错误提示  -> messages设置的错误提示 -> 自定义错误提示
			 */
			/*******************************************/
			//userAction_save_do
			$("#Form1").validate({
				debug:true,
				rules:{
					loginname : "required",
					password : "required",
					birthday : "required", 
					telephone : "required", 
					hobbies : "required",
					cart : {
						required : true,
						cartLength : true,
						cartCheck : true
					}
				},
				messages:{
					loginname : "登录名不能为空",
					password : "密码不能为空",
					birthday : "生日不能为空",
					telephone : "请输入正确的电话号码", 
					hobbies : "爱好至少选择一个", 
					/*
					 * 下拉选框的验证,起作用的话:
					 * 	* 保证其中一个option选项的value值为空
					 * 	* 保证其中为空的option选项必须是第一个
					 */
				}
			});
			
		});
		</script>
        <!-- 表单验证end -->
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
	    <!-- 检查用户名是否存在 -->
	    <script type="text/javascript">
             $(document).ready(function(){
             
             	$("#loginname").blur(function(){
             		var json = {
             			loginname : $("#loginname").val()
             		}
             		if(json.loginname == ""){
             		     return;
             		}
            	    /*
					 * $.post(url,data,callback,type)
					 * 	* url:请求路径
					 * 	* data:请求参数,格式是key/value
					 * 	* callback:回调函数,function(data, textStatus){}
					 * 		* data:请求返回的数据内容,可以是HTML代码、XML片段或JSON格式等
					 * 		* textStatus:请求的状态,其值是success、error、notmodify、timeout等
					 * 		* 返回值:XMLHttpRequest对象
					 * 	* type:返回内容格式，xml, html, script, json, text, _default。
					 * 
					 * $.post()方法的请求类型一定是POST方式
					 */
             		$.post("userAction_checkLoginname.action",json,function(data, textStatus){
					//直接接收服务器端的响应数据格式为JSON格式
					console.info(data);
					//将data数据填充到div中
					$("#divcheck").empty();
					$("#divcheck").append(data);
					//var json = eval("("+data+")");
					//console.info(json);
			     });
			      $("#loginname").focus(function(){
			      	  $("#divcheck").empty();
			      });
             		
             	});
             });
		</script>
	</HEAD>
	<body>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/userAction_addUser.action" method="post" enctype="multipart/form-data">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>注册用户</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						登录名：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
					    <s:textfield id="loginname" name="loginname"></s:textfield>
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
		</form>
	</body>
</HTML>