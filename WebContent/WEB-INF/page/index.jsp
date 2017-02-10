<%@ page contentType="text/html; charset=UTF-8" language="java"  errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>瑞泰人寿</title>
  	<link rel="shortcut icon" href="resources/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="resources/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="resources/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="resources/easyui/style.css">
	<script type="text/javascript" src="resources/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="resources/easyui/plugins/jquery.form.js"></script>
  </head>
  

	<!-- <div class="easyui-layout" style="width:100%;height:83%">
		<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
		
        <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>   
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>  
      </div>
	</div>
 -->
	<style>
.top {
	background-image: url(resources/images/home_top.jpg) ;
	background-repeat: no-repeat;
	width: 100%;
	height: 100%;
}
</style>
<body class="easyui-layout" >

    <div data-options="region:'north'" style="height:50px" class="top">
	    <div style="margin-top: 10px;text-align: right;">
	      <span style="font-size: 18px; color: #ffffff;">
	        <a href="javaScript:void(0);" onclick="tuichu();" >退出</a>|<a href="javaScript:void(0);" onclick="suoping();">锁屏</a></span>
	    </div>
    </div>   
    <div data-options="region:'west',title:' ',split:true" style="width:155px;">
    <div style="margin:10px 0;"></div>
    	
		<!-- <ul class="easyui-tree" data-options="url:'../resources/tree_data1.json',method:'get',animate:true,lines:true"></ul> -->
		<ul  id="menu"></ul>
		 <form id="tuichuFrom" action="login"></form>
    </div>
    
    <div data-options="region:'center',title:'欢迎'" style="padding:5px;background:#eee;" id="shouye"></div> 
	<div id="suoping" class="easyui-dialog"
			closed="true"
			modal="true" 
			 style="background-image:url(resources/images/background.jpg)">
			<div style="width:400px; margin: 350px auto 0 auto;margin-left:750px;">
		  		<div class="easyui-panel" title="锁屏" style="width:400px">
					<div style="padding:10px 60px 20px 60px">
					    <form id="pwdform" name="pwdform" method="POST" >
					    	<table cellpadding="5">
					    		<tr>
					    			<td>输入密码:</td>
					    			<td><input class="easyui-validatebox textbox" type="password" id="pwd" name="pwd" data-options="required:true,validType:'minLength[6]'"  missingMessage="密码不允许为空" ></input></td>
					    		</tr>
					    		<tr>
					    			<td colspan="2" style="text-align:center;"><a href="javascript:void(0)" style="width:150px;" class="easyui-linkbutton" onclick="pwdAffirm()">确  认</a></td>
					    		</tr>
					    		<tr>
					    		</tr>
					    	</table>
					    </form>
				    </div>
				</div>
			</div>
		</div>
<script type="text/javascript">
		$(function(){
			$("#menu").tree({
				url:"home/menu",
				onClick: function(node){
					//window.location.href= node.attributes.url; 
					if(node.attributes.url.length > 2){
						$('#shouye').panel('refresh', node.attributes.url);
						$('#shouye').panel('setTitle',node.text);
						}else{
						$(this).tree('expand',node.target);
						}
						//$('#dlg').dialog('close');
				}
			});
			
			
		});
		history.forward();
window.onbeforeunload=function(){
				var n=window.event.screenX - window.screenLeft;
				var b=n > document.documentElement.scrollWidth - 20;
				if(b&&window.event.clientY<0||window.event.aleKey){
					$.ajax({
					 	type:'post',
					 	url:'login/out?yh_id='+${id},
					 	dataType:'json',
					 	success:function(rel){
					 	}
					 });
				}
			}
function suoping(){
	$('#suoping').dialog({    
    title: '锁屏',    
    width: 1920,    
    height: 1080,    
    closed: false,
    closable: false,
    iconCls:'icon-add',
   	buttons: [{
					text:'确认',
					handler:function(){
					}
				}],
    modal: true   
});    
	/*$(document).keydown(function(){
		alert(arguments[0].keyCode);
		if(arguments[0].keyCode==116){
			event.keyCode=0;
			event.returnValue=0;
			return false;
		}
	});*/
}

function pwdAffirm(){
	var pwd=$('#pwd').val();	
	var yh_id='${uid }';
	var url='user/pwdAffirm?yh_id='+yh_id+'&pwd='+pwd;
	 $.ajax({
	 	type:'post',
	 	url:url,
	 	dataType:'json',
	 	success:function(rel){
			if(rel[0].status=='1'){
	 			$('#suoping').dialog('close');
	 			$('#pwd').val('');
			}else if(rel[0].status=='0'){
				$.messager.alert('警告','密码不正确');
			}else if(rel[0].status=='3'){
				$.messager.alert('警告','连接异常,请稍后再试');
			}else{
				$.messager.alert('警告','密码不正确');
				location.reload();
			}
	 	}
	 });
}
function tuichu(){
	if(confirm('是否确认退出？')){
		//$//('#tuichu').click();
		
	$('#tuichuFrom').form('submit',{
		type:'post',
	 	url:'login/tuichu?yh_id='+${uid },
	 	dataType:'json',
	 	success:function(data){
	 		history.go(0);
	 	}
	 	});
	}
}
$.ajaxSetup({
error:function(XMLHttpRequest,textStatus,errorThrown){
	if(XMLHttpRequest.status==403){
		alert('没权限');
		return false;
	}
},
complete:function(XMLHttpRequest,textStatus){
	var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus");
	if(sessionstatus=='timeout'){
		alert("系统超时请重新登录");
		$('#tuichuFrom').submit();
	}
}
});
	</script>
</body>  
</html>
