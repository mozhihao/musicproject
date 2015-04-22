<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<link  rel="stylesheet" type="text/css" href="css/BackStageStyleLogin.css" />
    <title>M银行用户登陆</title>
  </head>
  <body>
		<form action="creditcardloginaction" method="post">
  		<div id="box">
                  M银行欢迎你！！！
                <div>
			卡号：<input type=text name=cardnum class="input_c" id="usn"/><br>
			密码:<input type="password" name=pwd class="input_c" id="pwd"/><br> 
			<input type=submit value=登陆  name='sub'/>
			<input  type="reset" value='重置' />
   			<a href="creditcardreg">注册</a>
		</div>
		</div>
		</form>
  </body>
</html>
