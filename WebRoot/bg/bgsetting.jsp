<%@ page language="java" import="java.util.*"  import="com.mzh.po.Admin"  import="com.mzh.po.Ablum" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<title>admin</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="css/bg/style.css" media="all" />
	<!--[if IE]><link rel="stylesheet" href="css/ie.css" media="all" /><![endif]-->
	<script type="text/javascript">
	var msg="${requestScope.Msg}";
		if(msg!=""){
		alert(msg);
}
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
		<li>
			<a href="bgnews"><span class="icon">&#128196;</span> 新闻管理</a>
			<ul class="submenu">
				<li><a href="bgaddnews">写新闻</a></li>
				<li><a href="bgnews">新闻管理</a></li>
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
		<li class="section">
			<a href="bgsetting"><span class="icon">&#9881;</span>个人设置</a>
		</li>
	</ul>
</nav>
<section class="content">
	<section class="widget">
		<header>
			<span class="icon">&#59160;</span>
			<hgroup>
				<h1>个人设置</h1>
				<h2>Admin Setting</h2>
			</hgroup>
		</header>
		<%Admin tmp=(Admin)request.getSession().getAttribute("r"); %>
		<div class="content">
		<form action="bgsettingaction" method="post">
			<ul>
			<li>账号：<input type="text" disabled="disabled" value=<%=tmp.getAdminname() %>></li>
			<li>密码:<input type="password"  name="oldpwd"></li>
			<li>新密码:<input type="password" name="newpwd">
			<%
					String errMsg=(String)request.getAttribute("errMsg");
					if(errMsg!=null){
					 %>
					 <input type="text" disabled="disabled" value="<%=errMsg %>">
					 <%} %>
					 
			</li>
			</ul>
			<ul><li><input type="submit" value="----------------------更改----------------------"></li></ul>
		</form>
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