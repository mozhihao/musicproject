<%@ page language="java" import="java.util.*" import="com.mzh.po.CartItem" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M音乐网</title>
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
<!-- 头 -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- 中间 -->
		 <div id="music_box" >
		 <form action="cartSum" method="post">
			<table>
				<tr>
					<th><input type="checkbox"  id="checkall" onclick="select_all()">全选</th>
					<th>商品信息</th>
					<th>金额</th>
					<th>操作</th>
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
                			<dt>专辑名：<span><%=ci.getProductName()%></span></dt>
                		</dl>
                	</div>
					</td>
					<td>
						RMB:<%=ci.getPrice() %>
					</td>
					<td>
						<a href=delcartitem?cartItemId=<%=ci.getCartItemId() %>>删除</a>
					</td>
           <%}%>
           <tr>
           <td>第<%=count %>页</td>
           <td><a href="usercart?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">上一页</a></td>
           <td><a href="usercart?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">下一页</a></td>
           <td>共<%=rowCount %>页</td>
           <td><input type="submit" value=结算></td></tr>
			</table>
			</form>
 </div>		
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
