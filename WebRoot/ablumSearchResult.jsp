<%@ page language="java" import="java.util.*"   import="com.mzh.po.Ablum" pageEncoding="gbk"%>
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
  		<jsp:include page="head.jsp"></jsp:include>
			
			 <div id="music_box" >
			 <h3>����Ϊ�������</h3>
		<%
			List<Ablum> l=(List)request.getAttribute("searchResult");
			for(Ablum a:l){%>
			<div class="album" >
			<!-- ���ӵ����ܲ���ҳ����ûд -->
            <a class="left" href="ablumDetailed?albumId=<%=a.getAlbumId()%>">
            <img src="<%if(a.getAlbumPic()!=""){%><%=a.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>ר������<span><%=a.getAlbumName()%></span></dt>
                <dt>�۸�<a href="" target="_blank"><%= a.getAblumPrice()%>Ԫ</a> </dt>
                <dt>���֣�<span><%=a.getAlbumAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?albumId=<%=a.getAlbumId() %>" target="_blank">��������</a>       <a href="add_cart_succeed?albumId=<%=a.getAlbumId() %>">���빺�ﳵ</a></dt>
            </dl>
            </div>	
           <%}%>
 </div>		
			
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
