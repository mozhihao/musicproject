<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Music" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M音乐网</title>
    <script language="javascript">
	var name = "#floatMenu";
	var menuYloc = null;
	
		$(document).ready(function(){
			menuYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")))
			$(window).scroll(function () { 
				offset = menuYloc+$(document).scrollTop()+"px";
				$(name).animate({top:offset},{duration:500,queue:false});
			});
		}); 
	 </script>
	<script language="javascript" src="js/floatmenu/jquery_mini.js"></script>
	<script language="javascript" src="js/floatmenu/jquery.dimensions.js"></script>
  </head>
  <body>
<!-- 头 -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- 中间 -->
		 <div id="music_box" >
		<%	
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Music> l=(List)request.getAttribute("type");
			for(Music c:l){%>
			<div class="album" >
			<!-- 链接到介绍播放页，还没写 -->
            <a class="left" href="ablumDetailed?albumId=<%=c.getAlbum_id()%>" target="_blank">
            <img src="images/musicnull.jpg"  width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>音乐名：<span><%=c.getMusic_name()%></span></dt>
                <dt>价格：<%= c.getPrice()%>元</a> </dt>
                <dt>歌手：<span><%=c.getAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?musicId=<%=c.getMusicId()%>" target="_blank">立即购买</a>  </dt>
            </dl>
            </div>	
           <%}%>
           <p>
           <td>第<%=count %>页</td>
           <td><a href="musictype?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">上一页</a></td>
           <td><a href="musictype?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">下一页</a></td>
           <td>共<%=rowCount %>页</td>
 		</div>		
 <!-- 右侧浮动 -->
	<div id="floatMenu">
		 <ul class="menu1">
  			  <li><a href="musictype" onclick="return true;"> 全部 </a></li>
 		 </ul>
 		 <ul class="menu2">
   			 <li><a href="musictype?type=rock" onclick="return true;"> Rock </a></li>
   			 <li><a href="musictype?type=blue" onclick="return true;"> Blue </a></li>
  			 <li><a href="musictype?type=Popular" onclick="return true;"> Popular</a></li>
 		</ul>
	</div>
			
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
