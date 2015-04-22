<%@ page language="java" import="java.util.*"  import="com.mzh.po.User"  import="com.mzh.po.Music" 

pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<title>admin</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="css/bg/style.css" media="all" />
	<!--[if IE]><link rel="stylesheet" href="css/ie.css" media="all" /><![endif]-->
	<script language="JavaScript" type="text/JavaScript">
function dml(theURL,winName,features) {window.open(theURL,winName,features);}
</script>
</head>
<body>
<div class="testing">
<header class="main">
	<h1><strong>M</strong>音乐后台</h1>
	<input type="text" value="search" />
</header>
<section class="user">
	<div class="profile-img">
		<p><img src="images/gly.png" alt="" height="40" width="40" /> 欢迎回来:<%=session.getAttribute("rname") %></p>
	</div>
	<div class="buttons">
		 <span class="button blue"><a href="bgoutlogin">Logout</a></span>
	</div>
</section>
</div>
<nav>
	<ul>
		<li ><a href="bgindex"><span class="icon">&#128711;</span> 首页</a></li>
		<li>
			<a href="bgnews"><span class="icon">&#128196;</span> 新闻管理</a>
			<ul class="submenu">
				<li><a href="bgaddnews">写新闻</a></li>
				<li><a href="bgnews">新闻管理</a></li>
			</ul>	
		</li>
		<li class="section">
			<a href="bgmusic"><span class="icon">&#127748;</span> 多媒体</a>
			<ul class="submenu">
				<li><a href="files-upload.html">上传文件</a></li>
				<li><a href="bgaddablum">创建专辑</a></li>
			</ul>
		</li>
		<li><a href="bgstatistics"><span class="icon">&#128202;</span>表格分析</a></li>
		<li ><a href="bguser"><span class="icon">&#128101;</span> 用户管理</a></li>
		<li>
			<a href="bgsetting"><span class="icon">&#9881;</span> 个人设置</a>
		</li>
	</ul>
</nav>
<section class="content">
	<section class="widget">
		<header>
			<span class="icon">&#59160;</span>
			<hgroup>
				<h1>音乐管理</h1>
				<h2>Music Comment</h2>
			</hgroup>
		</header>
		<div class="content">
			<table id="myTable" border="0" width="100">
				<thead>
					<tr>
						<th>music name</th>
						<th >introduction</th>
						<th>price</th>
						<th>type</th>
						<th>操作</th>
					</tr>
				</thead>
					<tbody>
						<% List<Music> l=(List<Music>)request.getAttribute

("music");
							for(Music m:l){%>
							<tr>
							<td><%=m.getMusic_name()%></td>
							<td><%=m.getIntrodution() %></td>
							<td><%=m.getPrice() %></td>
							<td><%=m.getType() %></td>
							<td><a target="_self" onClick="dml

('bgupmusic?musicId=<%=m.getMusicId() %>','','width=550,height=380')">修改</a>
								<a href="bgdelmusic?musicId=<%= 

m.getMusicId() %>" style="float: right;">删除</a>
							</td>
							</tr>
							<% 	}%>
						
					</tbody>
				</table>
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