<%@ page language="java"  import="com.mzh.po.User" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>M音乐网</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
 <div class="handle_a">
        <div class="head_bg">
            <div class="cl top_h">
                <div class="nov m_l l">
                    <ul>
                        <li><a href="index"  class="hover"><span class="db tingico liico0"></span>M商店</a></li>
                        <li><a href="News"  class="hover6"><span class="db tingico liico8"></span>小新闻</a></li>
                        <li><a href="musictype"  class="hover4"><span class="db tingico liico6"></span>风格</a></li>
                        <li><a href="ranking" class="hover3"><span class="db tingico liico5"></span>排行榜</a></li>
                        <li><a href="creditcardlogin" class="hover5"><span class="db tingico liico7"></span>充值</a></li>
                        <li><a href="usercart"  class="hover1"><span class="db tingico liico2"></span>购物车</a></li>
                        <li><a <% if(session.getAttribute("uname")==null){%>href="login"<% } else{ %>href="userindex"<% }%>  class="hover2"><span class="db tingico liico3"></span><% if(session.getAttribute("uname")==null){%> 登陆 <% } else {%><%=session.getAttribute("uname")%><% }%></a></li>
                        <li>
                        <form method="post" action="search" id="search">
						<input name='search' style="width: 100px; height: 40px;">
						<select name='search_type' style="height: 40px;">
						 <option value ="ablum" name=ablum>ablum</option>
					  	<option  value ="music" name=music>music</option>
						</select>
						<input type="submit" name='sub' value="搜索" style="height: 40px;">
						</form>
                        </li>
                    </ul>
                <div class="park"></div>
            </div>
        </div>
    </div>
</div>		
		