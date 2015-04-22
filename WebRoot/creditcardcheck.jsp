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
		<table  border="1" cellpadding="2" cellspacing="0">
		<tr><th>用户名</th><th>卡号</th><th>余额</th></tr>
		<tr><td><%=cc.getUsername() %></td><td><%=cc.getCardnum() %></td><td>$<%=cc.getGold() %></td></tr>
		</table>
  </body>
</html>
