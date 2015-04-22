<%@ page language="java" import="java.util.*"  import="com.mzh.po.News"  import="com.mzh.po.Ablum" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<title>admin</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="css/bg/style.css" media="all" />
	<!--[if IE]><link rel="stylesheet" href="css/ie.css" media="all" /><![endif]-->
</head>
<body>
<div class="testing">
<header class="main">
	<h1><strong>M</strong>音乐后台</h1>
	<input type="text" value="search" />
</header>
<section class="user">
	<div class="profile-img">
		<p><img src="images/gly.png" alt="" height="40" width="40" /> 欢迎回来:<%String admin=request.getSession().getAttribute("rname")+""; %><%=admin %></p>
	</div>
	<div class="buttons">
		 <span class="button blue"><a href="bgoutlogin">Logout</a></span>
	</div>
</section>
</div>
<nav>
	<ul>
		<li ><a href="bgindex"><span class="icon">&#128711;</span> 首页</a></li>
		<li class="section">
			<a href="bgnews"><span class="icon">&#128196;</span> 新闻管理</a>
			<ul class="submenu">
				<li><a href="bgaddnews">写新闻</a></li>
				<li class="section"><a href="bgnews">新闻管理</a></li>
			</ul>	
		</li>
		<li >
			<a href="bgmusic"><span class="icon">&#127748;</span>多媒体</a>
			<ul class="submenu">
				<li><a href="bguploadmusic">上传文件</a></li>
				<li><a href="bgaddablum">创建专辑</a></li>
			</ul>
		</li>
		<li><a href="bgstatistics"><span class="icon">&#128202;</span>表格分析</a></li>
		<li ><a href="bguser"><span class="icon">&#128101;</span> 用户管理 </a></li>
		<li>
			<a href="bgsetting"><span class="icon">&#9881;</span>个人设置</a>
		</li>
	</ul>
</nav>
<section class="content">
	<section class="widget">
		<header>
			<span class="icon">&#59160;</span>
			<hgroup>
				<h1>新闻管理</h1>
				<h2>News Comment</h2>
			</hgroup>
		</header>
		<div class="content">
			<table id="myTable" border="0" width="100">
				<thead>
					<tr>
						<th>Id</th>
						<th>标题</th>
						<th>时间</th>
						<th>操作</th>
					</tr>
				</thead>
					<tbody>
						<% 
						int count=Integer.parseInt(request.getAttribute("pageNow")+"");
						int rowCount=Integer.parseInt(request.getAttribute("rowCount")+"");
						List<News> l=(List<News>)request.getAttribute("allnews");
							for(News tmp :l){
									%>
							<tr >
							<td ><%=tmp.getNews_id()%></td>
							<td><a href="bgupnews?News_id=<%=tmp.getNews_id()%>"><%=tmp.getNews_title() %></a></td>
							<td><%=tmp.getTime() %></td>
							<td><a href="bgdelNews?News_id=<%=tmp.getNews_id()%>">删除 </a>	</td>
							</tr>
							<% 	}%>
					</tbody>
				</table>
				<p><p>
           <td>第<%=count %>页</td>
           <td><a href="bgnews?pageNow=<%if(count-1<1)%><%=1%><%else%><%=count-1 %>">上一页</a></td>
           <td><a href="bgnews?pageNow=<%if(count+1>rowCount)%><%=rowCount%><%else%><%=count+1 %>">下一页</a></td>
           <td>共<%=rowCount %>页</td>
		</div>
	</section>
</section>
	
<script src="js/bg/jquery.min.js"></script>
<script src="js/bg/jquery.wysiwyg.js"></script>
<script src="js/bg/custom.js"></script>
<script src="js/bg/cycle.js"></script>
<script src="js/bg/jquery.checkbox.min.js"></script>
<!--<script src="js/bg/flot.js"></script>
<script src="js/bg/flot.resize.js"></script>
<script src="js/bg/flot-graphs.js"></script>
<script src="js/bg/flot-time.js"></script>
<script src="js/bg/cycle.js"></script>-->
<script src="js/bg/jquery.tablesorter.min.js"></script>
</body>
</html>