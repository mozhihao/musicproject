<%@ page language="java" import="java.util.*"   pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<title>admin</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="css/bg/style.css" media="all" />
	<!--[if IE]><link rel="stylesheet" href="css/ie.css" media="all" /><![endif]-->
	<!--[if lt IE 9]><link rel="stylesheet" href="css/lt-ie-9.css" media="all" /><![endif]-->
</head>
<body>
<div class="testing">
<header class="main">
	<h1><strong>M</strong> 音乐后台</h1>
	
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
		<li class="section"><a href="bgindex"><span class="icon">&#128711;</span> 首页</a></li>
		<li>
			<a href="bgnews"><span class="icon">&#128196;</span> 新闻管理</a>
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
	<section class="widget">
		<header>
			<span class="icon">&#128200;</span>
			<hgroup>
				<h1>浏览统计</h1>
				<h2>An insiders view</h2>
			</hgroup>
			<aside>
				<button class="left-btn">&#59229;</button><button class="right-btn">&#59230;</button>
			</aside>
		</header>
		<div class="content cycle">
			<div id="flot-example-2" class="graph-area"></div>
			<div id="flot-example-1" class="graph-area"></div>
			<div class="pie graph-area"></div>
		</div>
		</div>
	</section>
	
	<div class="widget-container">
		
		<section class="widget 	small">
			<header>
				<span class="icon">&#128319;</span>
				<hgroup>
					<h1>快捷发布新闻</h1>
					<h2>Speed News up</h2>
				</hgroup>
			</header>
			<form action="bgaddnewsaction">
			<div class="content">
				<div class="field-wrap">
					<input type="text" value="Title" name='news_title'/>
				</div>
				<div class="field-wrap">
					<textarea id="quick_post" rows="5" name='news_content'></textarea>
				</div>
				<button type="submit" class="green">Post</button> <button type="submit" class="">Preview</button>
			</div>
			</form>
		</section>
	
		<section class="widget small">
			<header> 
				<span class="icon">&#128318;</span>
				<hgroup>
					<h1>总体统计</h1>
					<h2>Summary  &amp; statistics</h2>
				</hgroup>
			</header>
			<div class="content">
				<section class="stats-wrapper">
					<div class="stats">
						<p><span><%=request.getAttribute("ablumNum") %></span></p>
						<p>记录专辑量</p>
					</div>
					<div class="stats">
						<p><span><%=request.getAttribute("commentNum") %></span></p>
						<p>总评论量</p>
					</div>
				</section>
				<section class="stats-wrapper">
					<div class="stats">
						<p><span><%=request.getAttribute("userNum") %></span></p>
						<p>用户量</p>
					</div>
					<div class="stats">
						<p><span><%=request.getAttribute("newsNum") %></span></p>
						<p>发布新闻量</p>
					</div>

				</section>
			</div>
		</section>
		
	</div>
</section>
<script src="js/bg/jquery.min.js"></script>
<script src="js/bg/jquery.wysiwyg.js"></script>
<script src="js/bg/custom.js"></script>
<script src="js/bg/cycle.js"></script>
<script src="js/bg/jquery.checkbox.min.js"></script>
<script src="js/bg/flot.js"></script>
<script src="js/bg/flot.resize.js"></script>
<script src="js/bg/flot-time.js"></script>
<script src="js/bg/flot-pie.js"></script>
<script src="js/bg/flot-graphs.js"></script>
<script src="js/bg/cycle.js"></script>
<script src="js/bg/jquery.tablesorter.min.js"></script>
<script type="text/javascript">
// Feature slider for graphs
$('.cycle').cycle({
	fx: "scrollHorz",
	timeout: 0,
    slideResize: 0,
    prev:    '.left-btn', 
    next:    '.right-btn'
});
</script>
</body>
</html>