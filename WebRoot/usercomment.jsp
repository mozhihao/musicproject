<%@ page language="java" import="java.util.*" import="com.mzh.po.Ablum" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M评论</title>
   </head>
   <body>
   <!-- 头 -->
  		<jsp:include page="head.jsp"></jsp:include>
			
	<!-- 中间  -->
	 <div id="music_box" >
		<%
			Ablum a=(Ablum)request.getAttribute("commentAblum");
			%>
			<div class="album" >
            <a class="left" href="ablumDetailed?albumId=<%=a.getAlbumId()%>" target="_blank">
            <img src="<%if(a.getAlbumPic()!=""){%><%=a.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>专辑名：<span><%=a.getAlbumName()%></span></dt>
                <dt>价格：<%= a.getAblumPrice()%>元</a> </dt>
                <dt>歌手：<span><%=a.getAlbumAuthor() %></span></dt>
            </dl>
            </div>	
	<form action="addComment" method="post">
	请评价您所购买的专辑/单曲：<p>
      <textarea id='comment' name=comment style="margin-top: 30px;">
      </textarea>
      <input type="hidden" readonly="readonly" name=album_id value=<%=a.getAlbumId()%> /><p>
      <input type="submit" value=提交评价>
    </form>
 </div>		
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
