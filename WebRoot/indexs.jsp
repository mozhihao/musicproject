<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M音乐网</title>
  </head>
  <body >
<!-- 头 -->
		<%String bgimg=(String)request.getAttribute("ranbg"); %>
  		<div id="ee2" style="background-image: url(<%=bgimg%>);">
  		<div style="background-image: url(images/test1.png);">
  		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="advertisement.jsp"></jsp:include>
<!-- 中间 -->  
		 <div id="music_box_index" >
			<h1>热点推荐</h1>  
		<%
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Ablum> l=(List)request.getAttribute("HotAblum");
			for(Ablum a:l){%>
			<div class="album" >
			<!-- 链接到介绍播放页，还没写 -->
            <a class="left" href="ablumDetailed?albumId=<%=a.getAlbumId()%>" target="_blank">
            <img src="<%if(a.getAlbumPic()!=""){%><%=a.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>专辑名：<span><%=a.getAlbumName()%></span></dt>
                <dt>价格：<%= a.getAblumPrice()%>元</a> </dt>
                <dt>歌手：<span><%=a.getAlbumAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?albumId=<%=a.getAlbumId()%>" target="_blank">立即购买</a>       <a href="add_cart_succeed?albumId=<%=a.getAlbumId() %>">加入购物车</a></dt>
            </dl>
            </div>	
           <%}%>
           <p>
           <td>第<%=count %>页</td>
           <td><a href="index?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">上一页</a></td>
           <td><a href="index?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">下一页</a></td>
           <td>共<%=rowCount %>页</td>
           </div>
           </div>
 </div>		
			
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
