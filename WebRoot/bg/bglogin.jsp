<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link  rel="stylesheet" type="text/css" href="css/BackStageStyleLogin.css" />
    <title>M银行用户登陆</title>
  </head>
  <body>
		<form action="bgLoginaction" method="post">
  		<div id="box">
                  M音乐商店后台系统！
                <div>
			账号：<input type=text name=adminname class="input_c" id="usn"/><br>
			密码:<input type="password" name=pwd class="input_c" id="pwd"/><br> 
			<input type=submit value=登陆  name='sub'/>
			<input  type="reset" value='重置' />
		</div>
		</div>
		</form>
  </body>
</html>
