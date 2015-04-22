<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <link type="text/css" href="Images/css.css" rel="Stylesheet" />
<script type="text/javascript">
	var msg="${requestScope.Msg}";
		if(msg!=""){
		alert(msg);
}
</script>
  </head>
  <body>
  <h1><strong>M</strong>音乐网</h1>
  <% User u=(User)request.getSession().getAttribute("u");  %>
    <fieldset>
     <legend>更新密码</legend>    
  <form action="pwdsettingaction" method="post" >
  <dl>
  		<dt>用户</dt>
  		<dd><input type="text" disabled="disabled" value=<%=u.getUname() %>></dd>
  		<dt>旧密码</dt>
  		<dd><input type="password" name="oldpwd" /></dd>
  		<dt>请输入新密码</dt>
  		<dd><input type="password" name="newpwd" /></dd>
  		<%
					String errMsg=(String)request.getAttribute("errMsg");
					if(errMsg!=null){
					 %>
					 <input type="text" disabled="disabled" value="<%=errMsg %>">
					 <%} %>
  		
 	 	<dd><input type="submit" value="提交"  /></dd>
  </dl>
  </form>
  </fieldset>
  </body>
</html>




   
       
 

