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
  		<form action="creditcardchargeaction" method="post">
		<table>
		<tr><td>用户名:</td><td><%=cc.getUsername() %></td></tr>
		<tr><td>银行卡号:</td><td><%=cc.getCardnum() %></td></tr>
		<tr><td>现剩余额：<td>$<%=cc.getGold() %></td></td></tr>
		<tr><td>请输入充值金额:</td><td><input type="text" name=gold></td></tr>
		<tr><td><input type="submit" value=充值></td></tr>
		</table>
		</form>
  </body>
</html>
