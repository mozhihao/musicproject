<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户登陆</title>
  </head>
  <body background="images/login.jpg">
  <jsp:include page="head.jsp"></jsp:include>
   <div id="music_box" style="margin-top: 50px; background:rgba(255, 255, 255, .15); height: 350px;">
   <center><h1 style="color: white;">用户注册</h1></center>
   	<div id="login_box">
		<form action="loginaction" method="post">
			<input type=text name=uname class="input_c" id="usn" /><br/>
			<input type="password" name=pwd class="input_c" id="pwd" /><br/>
			<input type=submit value=登陆  />
			<input  type="reset" value='重置' />
   			<a href="reg">注册</a>
		</form>
		</div>
 </div>
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
