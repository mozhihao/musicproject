<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Music" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M������</title>
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
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- �м� -->
		 <div id="music_box" >
		<%	
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Music> l=(List)request.getAttribute("type");
			for(Music c:l){%>
			<div class="album" >
			<!-- ���ӵ����ܲ���ҳ����ûд -->
            <a class="left" href="ablumDetailed?albumId=<%=c.getAlbum_id()%>" target="_blank">
            <img src="images/musicnull.jpg"  width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>��������<span><%=c.getMusic_name()%></span></dt>
                <dt>�۸�<%= c.getPrice()%>Ԫ</a> </dt>
                <dt>���֣�<span><%=c.getAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?musicId=<%=c.getMusicId()%>" target="_blank">��������</a>  </dt>
            </dl>
            </div>	
           <%}%>
           <p>
           <td>��<%=count %>ҳ</td>
           <td><a href="musictype?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">��һҳ</a></td>
           <td><a href="musictype?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">��һҳ</a></td>
           <td>��<%=rowCount %>ҳ</td>
 		</div>		
 <!-- �Ҳม�� -->
	<div id="floatMenu">
		 <ul class="menu1">
  			  <li><a href="musictype" onclick="return true;"> ȫ�� </a></li>
 		 </ul>
 		 <ul class="menu2">
   			 <li><a href="musictype?type=rock" onclick="return true;"> Rock </a></li>
   			 <li><a href="musictype?type=blue" onclick="return true;"> Blue </a></li>
  			 <li><a href="musictype?type=Popular" onclick="return true;"> Popular</a></li>
 		</ul>
	</div>
			
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
