<%@ page language="java" import="java.util.*"  import="com.mzh.po.Music" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
  <h1><strong>M</strong>音乐后台</h1>
  <% Music music=(Music)request.getAttribute("music");  %>
    <fieldset>
     <legend>更新音乐</legend>    
  <form action="bgupmusicaction?musicId=<%= music.getMusicId() %>" method="post" id="FormDemo10_1" >
  <dl>
  		<dt>音乐名</dt>
  		<dd><input type="text" name='music_name' value='<%=music.getMusic_name() %>' ></dd>
  		<dt>介绍</dt>
  		<dd><textarea rows="2"  name='introdution' ><%=music.getIntrodution() %></textarea></dd>
 	 	<dt>价格</dt>
 	 	<dd><input type="text" id="price" name=price value=<%=music.getPrice() %>></dd>
 	 	<dt>风格</dt>
 	 	<dd>
 	 		<select id="type" name="type">
 	 			<option value=rock>摇滚</option>
 	 			<option value=blue>布鲁斯</option>
 	 			<option value=Popular>流行音乐</option>
 	 		</select>
 	 	</dd>
 	 
 	 	<dd><input type="submit" value="提交" /></dd>
  </dl>
  </form>
  </fieldset>
  </body>
</html>




   
       
 

