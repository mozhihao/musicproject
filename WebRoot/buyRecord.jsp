<%@ page language="java" import="java.util.*" import="com.mzh.po.Buyrecord" pageEncoding="gbk"%>
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
		 <div id="music_box" style="margin-bottom :50px;" >
			<table>
				<tr>
					<th>商品信息</th>
					<th>金额</th>
					<th>操作</th><!-- 评价，下载 -->
					<th>交易日期</th>
				</tr>
		<%
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Buyrecord> l=(List)request.getAttribute("buyRecord");
			for(Buyrecord br:l){ 
				if (br.getAblumname()!=null){
				%>
				<tr>
					<td width="500">
					<div class="album" >
						 <a class="left" href="SongInfo.php?albumId=<%=br.getAblumid()%>" target="_blank">
						 <img src="<%if(br.getAblumpic()!=""){%><%=br.getAblumpic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
						 <dl id="yz">
                			<dt>专辑名：<span><%=br.getAblumname()%></span></dt>
                		</dl>
                	</div>
					</td>
					<td>
						RMB:<%=br.getPrice() %>
					</td>
					<td>
						<!-- 要写判断 --><a href='usercomment?brid=<%= br.getBrid() %>&albumId=<%=br.getAblumid()%>'>马上评价</a><br>
						<form action="download" method="post">
						<input type="hidden" readonly="readonly" name='type' value='ablum'>
						<input type="hidden" readonly="readonly" name='id' value=<%=br.getAblumid() %>>
						<input type="submit" value=下载>
						</form>
					</td>
					<td>
						<%=br.getDate() %>
					</td>
					</tr>	
           <%
           }else if(br.getMusicname()!=null){%>
          		 <tr>
					<td width="500">
					<div class="album" >
						 <a class="left" href="SongInfo.php?albumId=<%=br.getMusicid()%>" target="_blank">
						 <img src="images/musicnull.jpg" width="110" height="110" alt="" /></a>
						 <dl id="yz">
                			<dt>单曲名：<span><%=br.getMusicname()%></span></dt>
                		</dl>
                	</div>
					</td>
					<td>
						RMB:<%=br.getPrice() %>
					</td>
					<td>
						<!-- 要写判断 --><a href='usercomment?brid=<%=br.getBrid() %>&albumId=<%=br.getMusicid()%>'>马上评价</a><br>
						<form action="download" method="post">
						<input type="hidden" readonly="readonly" name='type' value='music'>
						<input type="hidden" readonly="readonly" name='id' value=<%=br.getMusicid() %>>
						<input type="submit" value=下载>
						</form>
					</td>
					<td>
						<%=br.getDate() %>
					</td>
					</tr>
             <%}
           }%>
			</table>
			<p>
           <tr>
           <td>第<%=count %>页</td>
           <td><a href="buyRecord?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">上一页</a></td>
           <td><a href="buyRecord?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">下一页</a></td>
           <td>共<%=rowCount %>页</td>
 </div>		
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
