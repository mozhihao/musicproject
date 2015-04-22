<%@ page language="java" import="java.util.*"  import="com.mzh.po.Music" import="com.mzh.po.Comment" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
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
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- �м� -->
		 <div id="music_box" >
		<%
			Ablum l=(Ablum)request.getAttribute("ablum");
			int count=Integer.parseInt(request.getAttribute("pageNow")+"");
			int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
			List<Music> musiclist=(List)request.getAttribute("musiclist");
			List<Comment> commentlist=(List)request.getAttribute("commentlist");
			%>
			<div class="album" >
			<!-- ���ӵ����ܲ���ҳ����ûд -->
            <a class="left" href="ablumDetailed?albumId=<%=l.getAlbumId()%>" target="_blank">
            <img src="<%if(l.getAlbumPic()!=""){%><%=l.getAlbumPic()%><%;}else {%><%="images/musicnull.jpg" %><%;}%>" width="110" height="110" alt="" /></a>
            <dl id="yz">
                <dt>ר������<span><%=l.getAlbumName()%></span></dt>
                <dt>�۸�<a href="" target="_blank"><%= l.getAblumPrice()%>Ԫ</a> </dt>
                <dt>���֣�<span><%=l.getAlbumAuthor() %></span></dt>
                <p>
                <dt><a href="confirmationMessage?albumId=<%=l.getAlbumId() %>" target="_blank">��������</a>       <a href="add_cart_succeed?albumId=<%=l.getAlbumId() %>">���빺�ﳵ</a></dt>
            </dl>
            </div>
            
            <!-- ר�����������ַ���λ -->
            <table id='MusicTable'>
            <tr><th><input type="checkbox"  id="checkall" onclick="select_all()">ȫѡ</th><th>������</th><th>�ۼ�</th><th>����/����</th></tr>
           	<% for(Music tmp:musiclist) {%> 
            <tr><td><input type="checkbox" name="ablum" id="<%=tmp.getAlbum_id()%>"></td>
            <td><%=tmp.getMusic_name() %></td>
            <td><%=tmp.getPrice() %></td>
            <td><a href="confirmationMessage?musicId=<%=tmp.getMusicId()%>">��</a></td><%} %>
            </tr></table>
            
           <!-- ������ -->
           <table id='CommentTable'>
           	<tr>
           		<td>�û�</td><td>����</td><td>����</td>
           	</tr>
	           <% for(Comment tmp:commentlist) {%>
           	<tr>
	           <td><%=tmp.getUser_name()%></td>
	           <td><%=tmp.getComment() %></td>
	           <td><%=tmp.getComment_time() %></td>
           	</tr>
	           <%} %>
           </table>
           <td>��<%=count %>ҳ</td>
           <td><a href="ablumDetailed?albumId=<%= l.getAlbumId() %>&&pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">��һҳ</a></td>
           <td><a href="ablumDetailed?albumId=<%= l.getAlbumId() %>&&pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">��һҳ</a></td>
           <td>��<%=rowCount %>ҳ</td>
            	<!-- ����������λ -->
            	
 </div>		
 		 <div id="floatMenu">
				<iframe src="test?ablumId=<%=l.getAlbumId() %>" id="iframepage" name="iframepage"   width="500px" frameborder="0" height="680px"  scrolling="auto" ></iframe>
 		 </div>
			
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
