<%@ page language="java" import="java.util.*"  import="com.mzh.po.Ablum"   pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="gbk">
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
		<!-- 用户照片-->
		<p><img src="images/gly.png" alt="" height="40" width="40" />欢迎回来:<%String admin=request.getSession().getAttribute("rname")+""; %><%=admin %>:</p>
	</div>
	<div class="buttons">
		 <span class="button blue"><a href="bgoutlogin">Logout</a></span>
	</div>
</section>
</div>
<nav>
	<ul>
		<li ><a href="index"><span class="icon">&#128711;</span> 首页</a></li>
		<li class="section">
			<a href="bgnews"><span class="icon">&#128196;</span>新闻管理</a>
			<ul class="submenu">
				<li><a href="bgaddnews">写新闻</a></li>
				<li><a href="bgnews">新闻管理</a></li>
			</ul>	
		</li>
		<li>
			<a href="bgmusic"><span class="icon">&#127748;</span> 多媒体</a>
			<ul class="submenu">
				<li><a href="bguploadmusic">上传文件</a></li>
				<li><a href="bgaddablum">创建专辑</a></li>
			</ul>
		</li>
		<li><a href="bgstatistics"><span class="icon">&#128202;</span>表格分析</a></li>
		<li><a href="bguser"><span class="icon">&#128101;</span> 用户管理</a></li>
		<li>
			<a href="bgsetting"><span class="icon">&#9881;</span> 个人设置</a>
		</li>
	</ul>
</nav>
<section class="content">
	<section class="widget" style="min-height:300px">
		<header>
			<span class="icon">&#59160;</span>
			<hgroup>
				<h1>多媒体管理</h1>
				<h2>Up media </h2>
			</hgroup>
		</header>
		<% Ablum ablum=(Ablum)request.getAttribute("ablum"); %>
		<form action="bgupablumaction">
		<input type="hidden" name='albumId' readonly="readonly" value="<%=ablum.getAlbumId() %>">
		<div class="content">
			<div class="field-wrap">
				专辑名<input type="text"  name='albumName' value='<%=ablum.getAlbumName() %>'/>
				作家<input type="text"  name='albumAuthor' value='<%=ablum.getAlbumAuthor() %>'/>
				价格<input type="text"  name='ablumPrice' value='<%=ablum.getAblumPrice() %>'/>
				图片<input type="text"  name='albumPic' value='<%=ablum.getAlbumPic() %>'/>
				文件位置<input type="text"  name='fileLocation' value='<%=ablum.getFileLocation() %>'/>
				是否设置为热点推介
				<select class="shortselect" name="hot">
				<option value=0>否</option>
 	 			<option value=1>是</option>
				</select><br><br>
			</div>
			<button type="submit" class="green">修改</button>
		</div>
		</form>
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