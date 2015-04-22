<%@ page language="java" import="java.util.*"  import="com.mzh.po.User"  import="com.mzh.po.Music" import="com.mzh.po.Ablum" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<title>admin</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="css/bg/style.css" media="all" />
	<link rel="stylesheet" href="css/bg/dropzone.css"  />
	<!--[if IE]><link rel="stylesheet" href="css/ie.css" media="all" /><![endif]-->
	<script src="./js/phone/jquery1.2.6.js"></script>
	<script src="./js/phone/jQueryFormValidator.js"></script>
	<script src="./js/upload/ajaxfileupload.js"></script>
	<script>
    	function ajaxFileUpload1()
	{
		$.ajaxFileUpload({
         url:'bgaddblumpic',
         fileElementId:'uFile',
         success: function (data, status){
           alert("上传图片成功");
         },
         error: function (data, status)
         {
            alert("上传失败，请重新尝试!");
          }
              }
 );

	}
		function ajaxFileUpload2()
	{
		$.ajaxFileUpload({
         url:'bgaddablumfile',
         fileElementId:'uFile2',
         success: function (data, status){
           alert("上传文件成功！");
         },
         error: function (data, status)
         {
            alert("上传失败，请重新尝试!");
          }
              }
 );

	}
</script>
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
		<li class="section">
			<a href="bgmusic"><span class="icon">&#127748;</span> 多媒体</a>
			<ul class="submenu">
				<li><a href="bguploadmusic.html">上传文件</a></li>
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
				<h1>音乐专辑创建</h1>
				<h2>Ablum Creat</h2>
			</hgroup>
		</header>
		<div class="content">
			专辑照片
			<input type="file" id="uFile" name="uFile" />
			<button class="button" id="buttonUpload" onclick="return ajaxFileUpload1();">上传照片</button>
			<p><p><br>专辑文件
			<input type="file" id="uFile2" name="uFile2" />
			<button class="button" id="buttonUpload" onclick="return ajaxFileUpload2();">上传文件</button><p><p><br>
			<form id='Form1' action="bgaddablumaction" method="post"  causeformvalidate="true">
			歌手<input name='albumAuthor'>
			价格<input name='ablumPrice' id='UInt16'><tt id="TipUInt16"></tt><br><br>
			专辑名称<input name='albumName'>
			是否设置为热推专辑<br>
			<select class="shortselect" name="hot">
				<option value=0>否</option>
 	 			<option value=1>是</option>
			</select><br><br>
 	 		<input type="submit" value="创建">
			</form>
			<script type="text/javascript">
            $(document).ready(function() {
                $("#Form1").SetValidateSettings({});
                $("#UInt16").SetValidateSettings({
                    FormValidate: {
                        Empty: {
                            Value: true
                        },
                        Type: {
                            Value: "UInt16",
                            Message: "必须是短整型数据"
                        }
                    },
                    Message: {
                        Text: {
                            Show: "请输入价格",
                            Success: "正确！",
                            Error: "请输入数字",
                            Focus: "输入中..."
                        },
                        MessageSpaceHolderID: "TipUInt16"
                    }
                });
            });
        </script>
		</div>
	</section>
</section>

<script src="js/bg/jquery.wysiwyg.js"></script>
<script src="js/bg/custom.js"></script>
<script src="js/bg/cycle.js"></script>
<script src="js/bg/jquery.checkbox.min.js"></script>
<script src="js/bg/jquery.tablesorter.min.js"></script>
</body>
</html>