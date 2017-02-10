<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>对公自助票据机业务管理系统</title>
<link rel="stylesheet" type="text/css"
	href="resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="resources/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="resources/easyui/style.css">
<script type="text/javascript" src="resources/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/easyui/jquery.easyui.min.js"></script>

<style>
.textbox {
	height: 20px;
	margin: 0;
	padding: 0 2px;
	box-sizing: content-box;
}
</style>
<script>
	//监听键盘的enter按键
	$(document).keypress(function(e) {
	
		var key = e.which;
		if (key == 13) {
			var account=$('#account').val();
			var pwd=$('#pwd').val();
			if(account==""){
				$('#account').focus();
				return ;
			}
			if(pwd==""){
				$('#pwd').focus();
				return ;
			}
			submitForm();
		}
	});
history.forward();
	function submitForm() {
		if ($("#loginform1").form('validate')) {
			$("#loginform1").submit();
		}
	}

	function clearForm() {
		$('#loginform1').form('clear');
	}
	$(function() {
		$.extend($.fn.validatebox.defaults.rules, {    
	    minLength: {    
	        validator: function(value, param){    
	            return value.length >= param[0];    
	        },    
	        message: 'Please enter at least {0} characters.'   
    }    
}); 
	});
</script>
</head>
<body background="resources/images/background.jpg">
	<div style="margin-right: 150px;">
		<div
			style="background:url(resources/images/login_dialog1.png)  no-repeat ;text-align: left; width: 420px;height: 270px;margin-top:200px;;float: right;">
			<div style="margin-top: 80px;margin-left: 150px;">
				<form id="loginform1" name="loginform1" method="POST" action="<%=request.getContextPath() %>/user.do?method=index" method="post">
					<div style="margin-top: 50px;">
						<span style="font-size: 18px;font-family:'微软雅黑'; color: #ffffff;">操作员号:</span>　<input
							class="easyui-validatebox textbox" type="text" id="account"
							name="account"  style="width: 120px"/>
					</div>
					<div style="margin-top: 10px;">
						<span style="font-size: 18px; color: #ffffff;">密</span><span
							style="margin-left:36px;font-size: 18px; color: #ffffff;">码:</span>　<input
							class="easyui-validatebox textbox" type="password" id="pwd"
							name="pwd" 
							style="width: 120px" />
					</div>
				</form>
				<div style="margin-top: 10px;font-size: 18px;margin-left: 120px;">
					<span style="cursor: pointer;" onclick="submitForm();"><img
						src="resources/images/login_button.png" width="100px"
						height="46px"> </span>
				</div>
				<div style="margin-top: 10px;">
						<span style="font-size: 18px; color: #ffffff;">${loginerror}</span>
					</div>
			</div>
		</div>


	</div>


</body>
</html>