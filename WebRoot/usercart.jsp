<%@ page language="java" import="java.util.*" import="com.mzh.po.CartItem" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M������</title>
     <script type="text/javascript">
   function select_all(){
     all = document.getElementById("checkall");
     subCheckbox = document.getElementsByName("ablum");
      for (var i=0;i<subCheckbox.length;i++)
     {
      subCheckbox[i].checked = all.checked;
     }
   }
     myFuncMain();
  </script>
  </head>
  <body>
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- �м� -->
		 <div id="music_box" >
		 <form action="cartSum" method="post">
			<table>
				<tr>
					<th><input type="checkbox"  id="checkall" onclick="select_all()">ȫѡ</th>
					<th>��Ʒ��Ϣ</th>
					<th>���</th>
					<th>����</th>
				</tr>
		<%
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<CartItem> l=(List)request.getAttribute("usercart");
			for(CartItem ci:l){%>
				<tr>
					<td>
						<input type="checkbox" name="ablum" value="<%=ci.getCartItemId()%>">
					</td>
					<td width="500">
					<div class="album" >
						 <a class="left" href="SongInfo.php?albumId=<%=ci.getAblumId()%>" target="_blank">
						 <img src="<%if(ci.getProductPic()!=""){%><%=ci.getProductPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
						 <dl id="yz">
                			<dt>ר������<span><%=ci.getProductName()%></span></dt>
                		</dl>
                	</div>
					</td>
					<td>
						RMB:<%=ci.getPrice() %>
					</td>
					<td>
						<a href=delcartitem?cartItemId=<%=ci.getCartItemId() %>>ɾ��</a>
					</td>
           <%}%>
           <tr>
           <td>��<%=count %>ҳ</td>
           <td><a href="usercart?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">��һҳ</a></td>
           <td><a href="usercart?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">��һҳ</a></td>
           <td>��<%=rowCount %>ҳ</td>
           <td><input type="submit" value=����></td></tr>
			</table>
			</form>
 </div>		
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
