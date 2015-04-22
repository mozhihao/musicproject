<%@ page language="java" import="java.util.*" import="com.mzh.po.Creditcard" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M银行用户登陆</title>
  </head>
  <body>
  		<% Creditcard cc=(Creditcard)session.getAttribute("creditcardinfo");%>
  		<h1>M银行欢迎你！！！</h1>
		<table>
		<tr><td>用户名:<%=cc.getUsername() %></td></tr>
		<tr><td>手机:<%=cc.getPhone() %></td></tr>
		<tr><td>卡号:<%=cc.getCardnum() %></td></tr>
		<a href="">更改密码</a>
		</table>
  </body>
</html>