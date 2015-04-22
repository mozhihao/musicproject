<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M音乐网</title>
    <script src="js/phone/jquery1.2.6.js"></script>
    <script src="js/upload/ajaxfileupload.js"></script>
    <script language="JavaScript" type="text/JavaScript">
	function dml(theURL,winName,features) {window.open(theURL,winName,features);}
</script>
	<script>
    function ajaxFileUpload()
	{
		$.ajaxFileUpload({
         url:'uploadimg',
         fileElementId:'uFile',
         success: function (data, status){
           alert("上传头像成功");
         },
         error: function (data, status)
         {
            alert("上传失败，请重新尝试!");
          }
              }
 );}
 </script>
  </head>
  <body>
<!-- 头 -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- 中间 -->
		 <div id="music_box" >
		<%
			User u=(User)request.getAttribute("userinfo");
		%>
		<table>
		<tr><td>您的基本信息:</td></tr>
		<tr><td>账号名称:<%=u.getUname() %></td></tr>
		<tr><td>电话号码：<%=u.getPhone() %></td><td><a target="_self" onClick="dml('upphone?phone=<%=u.getPhone() %>','','width=550,height=380')">修改电话号码</a></td></tr>
		<tr><td><a href="creditcardlogin">查看余额</a></td></tr>
		<tr>
		<td>当前头像:<img alt="" src="<%=u.getUpic()%>" width="50px" height="50px"></td>
		<td><input type="file" id="uFile" name="uFile" />
		<button class="button" id="buttonUpload" onclick="return ajaxFileUpload();">上传照片</button>
		</td>
		</tr>
		<tr><td>身份证号:<%=u.getIdentitycard() %></td></tr>
		<tr><td><a target="_self" onClick="dml('uppwd','','width=550,height=380')">修改密码</a> </td> </tr>
		</table>
			
 </div>		
<!-- 尾 -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
