<%@ page language="java" import="java.util.*" import="com.mzh.po.User" import="com.mzh.po.Buyrecord" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>M音乐网</title>
  </head>
  <body>
<!-- 头 -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- 中间 -->
 <div id="music_box" >
 	<%
 		User u=(User)request.getSession().getAttribute("u"); 
 		Buyrecord br=(Buyrecord)request.getAttribute("br");
 	
 	%>
 	<form action="pay_success" method="post">
	<table>
	<tr>
	<td>您的卡号</td><td><input type="text" style="width: 200;height: 30;" readonly="readonly" name="creditcard" value="<%=u.getCreditcard()%>"></td>
	<td>商品价格</td>
	<td><input type="hidden" readonly="readonly" value='<%=br.getBrid() %>' name=brid></td>
	<td><%=br.getPrice() %>元</td>
	</tr>
	<tr><td>请你输入密码</td><td><input type="password" style="width: 200;height: 30;" name=pwd ></td><td><input type="submit" value=付款></td></tr>
	</table>
	</form>
 </div>		
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
