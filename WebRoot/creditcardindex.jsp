<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M银行用户登陆</title>
    <link  rel="stylesheet" type="text/css" href="css/BackStageStyle.css" />
  </head>
  <body>
		
<div id="container">
 <div id="header">
 <div id="head-container">
<ul id="menu">
<li><a href="creditcardinfo" title="Home" target="iframepage">个人设置</a></li>
<li><a href="creditcardcheck"  target="iframepage">查询余额</a></li>
<li><a href="creditcardcharge"  target="iframepage">充值</a></li>
<li><a href="outCreditcardLogin"  >注销</a></li>
</ul>
</div>
  
  </div>
  <div id="mainContent">
	<iframe src="creditcardinfo" id="iframepage" name="iframepage" frameBorder=0 scrolling=no width="100%" height="100%" ></iframe>
  </div>
  <div id="footer">莫智豪</div>
</div>
  </body>
</html>
