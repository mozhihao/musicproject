<%@ page language="java" import="java.util.*" import="com.mzh.po.Ablum" import="com.mzh.po.Music" pageEncoding="gbk"%>
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

		<%
			if(request.getAttribute("ablum")!=null){
				Ablum tmp=(Ablum)request.getAttribute("ablum");
			
			%>
		<form action="pay?albumId=<%=tmp.getAlbumId()%>" method="post">
			<table>
				<tr>
					<th>��Ʒ��Ϣ</th>
					<th>���</th>
				</tr>
			<tr>
					<td width="500">
					<div class="album" >
						 <a class="left" href="ablumDetailed?albumId=<%=tmp.getAlbumId()%>" target="_blank">
						 <img src="<%if(tmp.getAlbumPic()!=""){%><%=tmp.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
						 <dl id="yz">
                			<dt>ר������<span><%=tmp.getAlbumName()%></span></dt>
                		</dl>
                	</div>
					</td>
					<td>
						RMB:<%=tmp.getAblumPrice() %>
					</td>
				</tr>
		<% }else{
				Music tmp=(Music)request.getAttribute("music");
					%>
	 <form action="pay?musicId=<%=tmp.getMusicId()%>" method="post">
			<table>
				<tr>
					<th>��Ʒ��Ϣ</th>
					<th>���</th>
				</tr>
				<tr>
					<td width="500">
					<div class="album" >
						 <a class="left" href="SongInfo.php?albumId=<%=tmp.getMusicId()%>" target="_blank">
						 <img src="images/musicnull.jpg" width="110" height="110" alt="" /></a>
						 <dl id="yz">
                			<dt>��������<span><%=tmp.getMusic_name()%></span></dt>
                		</dl>
                	</div>
					</td>
					<td>
						RMB:<%=tmp.getPrice() %>
					</td>
				</tr>
			<%}%>
				
          
           <tr>
           
           <td><input type="submit" value=�ύ����></td></tr>
			</table>
			</form>
 </div>		
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
