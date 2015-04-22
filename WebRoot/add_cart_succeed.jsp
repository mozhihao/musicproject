<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
		<p>你已成功将该音乐加入购物车
		<%Ablum a=(Ablum)request.getAttribute("cartablum"); %>
		<div class="album" >
			 <a class="left">
            <img src="<%if(a.getAlbumPic()!=""){%><%=a.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>专辑名：<span><%=a.getAlbumName()%></span></dt>
                <dt>价格：<a href="" target="_blank"><%= a.getAblumPrice()%>元</a> </dt>
                <dt>歌手：<span><%=a.getAlbumAuthor() %></span></dt><p>
                 </dl>
                 <a href="javascript:history.go(-1)">返回上一页</a>
                 <a href="sum_cart" >结算</a>
                 
            </div>	
 </div>		
			
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
