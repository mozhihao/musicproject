<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M������</title>
  </head>
  <body >
<!-- ͷ -->
		<%String bgimg=(String)request.getAttribute("ranbg"); %>
  		<div id="ee2" style="background-image: url(<%=bgimg%>);">
  		<div style="background-image: url(images/test1.png);">
  		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="advertisement.jsp"></jsp:include>
<!-- �м� -->  
		 <div id="music_box_index" >
			<h1>�ȵ��Ƽ�</h1>  
		<%
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Ablum> l=(List)request.getAttribute("HotAblum");
			for(Ablum a:l){%>
			<div class="album" >
			<!-- ���ӵ����ܲ���ҳ����ûд -->
            <a class="left" href="ablumDetailed?albumId=<%=a.getAlbumId()%>" target="_blank">
            <img src="<%if(a.getAlbumPic()!=""){%><%=a.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>ר������<span><%=a.getAlbumName()%></span></dt>
                <dt>�۸�<%= a.getAblumPrice()%>Ԫ</a> </dt>
                <dt>���֣�<span><%=a.getAlbumAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?albumId=<%=a.getAlbumId()%>" target="_blank">��������</a>       <a href="add_cart_succeed?albumId=<%=a.getAlbumId() %>">���빺�ﳵ</a></dt>
            </dl>
            </div>	
           <%}%>
           <p>
           <td>��<%=count %>ҳ</td>
           <td><a href="index?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">��һҳ</a></td>
           <td><a href="index?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">��һҳ</a></td>
           <td>��<%=rowCount %>ҳ</td>
           </div>
           </div>
 </div>		
			
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
