<%@ page language="java" import="java.util.*" import="com.mzh.po.User" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">>
  <head>
    <title>M������</title>
  </head>
  <body>
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- �м� -->
 <div id="music_box" >
 	<%
 		User u=(User)request.getAttribute("u"); 
 		double sum=(Double)request.getAttribute("sum");
 	%>
 	<form action="pay_cart" method="post">
	<table>
	<tr>
	<td>���Ŀ���</td><td><input type="text" style="width: 200;height: 30;" readonly="readonly" name="creditcard" value="<%=u.getCreditcard()%>"></td>
	<td>
		<input type="hidden" readonly="readonly" name=price value="<%=sum %>">
	</td>
	<td>��Ʒ�۸�</td>
	<td><%=sum %>Ԫ</td>
	</tr>
	<tr><td>������������</td><td><input type="password" style="width: 200;height: 30;" name=pwd ></td>
		<td><input type="submit" value='����'></td></tr>
	</table>
	</form>
 </div>		
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
