<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M������</title>
  </head>
  <body>
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- �м� -->
		 <div id="music_box" >
		<p>���ѳɹ��������ּ��빺�ﳵ
		<%Ablum a=(Ablum)request.getAttribute("cartablum"); %>
		<div class="album" >
			 <a class="left">
            <img src="<%if(a.getAlbumPic()!=""){%><%=a.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>ר������<span><%=a.getAlbumName()%></span></dt>
                <dt>�۸�<a href="" target="_blank"><%= a.getAblumPrice()%>Ԫ</a> </dt>
                <dt>���֣�<span><%=a.getAlbumAuthor() %></span></dt><p>
                 </dl>
                 <a href="javascript:history.go(-1)">������һҳ</a>
                 <a href="sum_cart" >����</a>
                 
            </div>	
 </div>		
			
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
