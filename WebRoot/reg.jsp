<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	  <script type="text/javascript" src="js/reg/jquery-1.4.4.min.js"></script>
  	<script type="text/javascript" src="js/reg/formValidator-4.1.3.js" charset="UTF-8"></script>
  	 <script type="text/javascript" src="js/reg/formValidatorRegex.js" charset="UTF-8"></script>
    <title>注册页面</title>
    <script type="text/javascript">
$(document).ready(function(){
	//$.formValidator.initConfig({onError:function(){alert("校验没有通过，具体错误请看错误提示")}});
	$.formValidator.initConfig({formID:"form1",mode:'AlertTip',
		onError:function(msg){alert(msg)},
	});
	$("#password1").inputValidator({min:1,onError:"密码不能为空,请确认"});
	$("#password2").inputValidator({min:1,onError:"重复密码不能为空,请确认"}).compareValidator({desID:"password1",operateor:"=",onError:"2次密码不一致,请确认"});
	$("#shouji").inputValidator({min:11,max:11,onError:"手机号码必须是11位的,请确认"}).regexValidator({regExp:"mobile",dataType:"enum",onError:"你输入的手机号码格式不正确"});
	$("#sfzh").functionValidator({fun:isCardID});
});
function test(obj)
{
	if(obj.value=="不校验身份证")
	{
		$("#sfzh").attr("disabled",true).unFormValidator(true);
		obj.value = "校验身份证";
	}
	else
	{
		$("#sfzh").attr("disabled",false).unFormValidator(false);
		obj.value = "不校验身份证";
	}
}
</script>
  </head>
  <body background="images/reg.jpg">
  <jsp:include page="head.jsp"></jsp:include>
   <div id="music_box" style="margin-top: 50px; background:rgba(255, 255, 255, .75); height: 350px;">
   		<center><h1>用户注册</h1></center>
		<form action="regaction" method="post" id=form1>
			<div id=word1><span id=pre>用户名：</span><input type=text name=uname /></div>
			<div id=word1><span id=pre>密    码：</span><input type="password" name=pwd  id=password1 class=sz /></div>
			<div id=word1><span id=pre>重复密码：</span><input type="password" name=pwd2 id=password2 class=sz /></div>
			<div id=word1><span id=pre>手机号：</span><input type="text" name=phone id="shouji" /></div>
			<div id=word1><span id=pre>身份证：</span><input type="text" name=identitycard id=sfzh value=""/></div>
			<div id=word1><span id=pre>信用卡：</span><input type="text" name=creditcard /></div>
			<center><input type=submit value=注册  class="reg"/></center>
		</form>
</div>
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
