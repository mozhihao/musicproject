<%@ page language="java" import="java.util.*"  import="com.mzh.po.Music" import="com.mzh.po.Comment" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
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
  <script src="js/audio/audio.min.js"></script>
  <script>
     $(function() { 
        // Setup the player to autoplay the next track
        var a = audiojs.createAll({
          trackEnded: function() {
            var next = $('tr td.playing').next();
            if (!next.length) next = $('tr td').first();
            next.addClass('playing').siblings().removeClass('playing');
            audio.load($('a', next).attr('data-src'));
            audio.play();
          }
        });
        
        // Load in the first track
        var audio = a[0];
            first = $('tr a').attr('data-src');
        $('tr td').first().addClass('playing');
        audio.load(first);

        // Load in a track on click
        $('tr td').click(function(e) {
          e.preventDefault();
          $(this).addClass('playing').siblings().removeClass('playing');
          audio.load($('a', this).attr('data-src'));
          audio.play();
        });
        // Keyboard shortcuts
        $(document).keydown(function(e) {
          var unicode = e.charCode ? e.charCode : e.keyCode;
             // right arrow
          if (unicode == 39) {
            var next = $('td.playing').next();
            if (!next.length) next = $('tr td').first();
            next.click();
            // back arrow
          } else if (unicode == 37) {
            var prev = $('td.playing').prev();
            if (!prev.length) prev = $('tr td').last();
            prev.click();
            // spacebar
          } else if (unicode == 32) {
            audio.playPause();
          }
        })
      });
    </script>
  </head>
  <body>
<!-- 头 -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- 中间 -->
		 <div id="music_box" >
		<%
			Ablum l=(Ablum)request.getAttribute("ablum");
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Music> musiclist=(List)request.getAttribute("musiclist");
			List<Comment> commentlist=(List)request.getAttribute("commentlist");
			%>
			<div class="album" >
			<!-- 链接到介绍播放页，还没写 -->
            <a class="left" href="ablumDetailed?albumId=<%=l.getAlbumId()%>" target="_blank">
            <img src="<%if(l.getAlbumPic()!=""){%><%=l.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>专辑名：<span><%=l.getAlbumName()%></span></dt>
                <dt>价格：<a href="" target="_blank"><%= l.getAblumPrice()%>元</a> </dt>
                <dt>歌手：<span><%=l.getAlbumAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?albumId=<%=l.getAlbumId() %>" target="_blank">立即购买</a>       <a href="add_cart_succeed?albumId=<%=l.getAlbumId() %>">加入购物车</a></dt>
            </dl>
            </div>
            
            <!-- 专辑包含的音乐放置位 -->
            <table id='MusicTable'>
            <tr><th><input type="checkbox"  id="checkall" onclick="select_all()">全选</th><th>单曲名</th><th>售价</th><th>购买/下载</th></tr>
           	<% for(Music tmp:musiclist) {%> 
            <tr><td><input type="checkbox" name="ablum" id="<%=tmp.getAlbum_id()%>"></td>
            <td><%=tmp.getMusic_name() %></td>
            <td><%=tmp.getPrice() %></td>
            <td><a href="confirmationMessage?musicId=<%=tmp.getMusicId()%>">买</a></td><%} %>
            </tr></table>
            
           <!-- 评论区 -->
           <table id='CommentTable'>
           	<tr>
           		<td>用户</td><td>内容</td><td>日期</td>
           	</tr>
	           <% for(Comment tmp:commentlist) {%>
           	<tr>
	           <td><%=tmp.getUser_name()%></td>
	           <td><%=tmp.getComment() %></td>
	           <td><%=tmp.getComment_time() %></td>
           	</tr>
	           <%} %>
           </table>
           <td>第<%=count %>页</td>
           <td><a href="ablumDetailed?albumId=<%= l.getAlbumId() %>&&pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">上一页</a></td>
           <td><a href="ablumDetailed?albumId=<%= l.getAlbumId() %>&&pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">下一页</a></td>
           <td>共<%=rowCount %>页</td>
            	<!-- 播放器放置位 -->
            	
 </div>		
 		 <div id="floatMenu">
				<iframe src="test?ablumId=<%=l.getAlbumId() %>" id="iframepage" name="iframepage"   width="500px" frameborder="0" height="680px"  scrolling="auto" ></iframe>
 		 </div>
			
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
