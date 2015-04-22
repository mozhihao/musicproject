<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<link  rel="stylesheet" type="text/css" href="css/BackStageStyleLogin.css" />
    <title>M银行</title>
  </head>
  <body>
		<form action="creditcardregaction" method="post">
  		<div id="box">
                  M银行注册用户
                <div style="margin: 20px;">
			姓名:<input type=text name="username"  /><br>
			密码:<input type="password" name="pwd"  /><br> 
			电话:<input type="text" name=phone  /><br>
			<input type=submit value=注册  name='sub'/>
			<input  type="reset" value='重置' />
		</div>
		</div>
		</form>
  </body>
</html>
