<%@ page language="java" import="java.util.*"  import="com.mzh.po.News" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M“Ù¿÷Õ¯</title>
  </head>
  <body>
<!-- Õ∑ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- ÷–º‰ -->
		<div id="music_box">
		<%
			News n=(News)request.getAttribute("ShowNew");
		 %>
		<center><h2><%=n.getNews_title() %></h2></center>
		<%=n.getNews_content() %>
		
 </div>
			
<!-- Œ≤ -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
