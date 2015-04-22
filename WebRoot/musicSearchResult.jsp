<%@ page language="java" import="java.util.*"  import="com.mzh.po.Music" pageEncoding="gbk"%>
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
  		<jsp:include page="head.jsp"></jsp:include>
			 <div id="music_box" >
			 <h3>以下为搜索结果</h3>
		<%
			List<Music> l=(List)request.getAttribute("searchResult");
			for(Music a:l){%>
			<div class="album" >
			<!-- 链接到介绍播放页，还没写 -->
            <a class="left" href="SongInfo.php?albumId=<%=a.getMusicId()%>" target="_blank">
            <img src="images/musicnull.jpg" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>音乐名：<span><%=a.getMusic_name()%></span></dt>
                <dt>价格：<a href="" target="_blank"><%= a.getPrice()%>元</a> </dt>
                <dt>歌手：<span><%=a.getAuthor() %></span></dt>
                <p>
                <dt><a href="" target="_blank">立即购买</a>       <a href="add_cart_succeed?albumId=<%=a.getMusicId() %>">加入购物车</a></dt>
            </dl>
            </div>	
           <%}%>
 </div>		
			
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
