<%@ page language="java" import="java.util.*"  import="com.mzh.po.News" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>M������</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script type="text/javascript" src="js/css3-mediaqueries/css3-mediaqueries.js"></script>
 </head>
  <body style="height: 900px;">
<!-- ͷ -->
		<div id="ee2" style="background-image: url(images/bg_1.jpg);">
  		<div id="ee3" style="background-image: url(images/test1.png);">
  		<jsp:include page="head.jsp"></jsp:include>
<!-- �м� -->
		 <div id="music_box" >
	<h2>С���� ������</h2>	
	<table>
		<% 
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<News> l=(List)request.getAttribute("news");
			for(News n:l) {  %>
			<tr>
			<td style="width: 630px"><a href="showNews?News_id=<%=n.getNews_id()%>" ><%=n.getNews_title()%></a>
			</td>
			<td><%=n.getTime()%>
			</td>
			</tr>				
          <% 
			}
		 %>
	</table>
	 <p>
           <td>��<%=count %>ҳ</td>
           <td><a href="News?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">��һҳ</a></td>
           <td><a href="News?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">��һҳ</a></td>
           <td>��<%=rowCount %>ҳ</td>
 </div>	
 </div>
 </div>	
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
