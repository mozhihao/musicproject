<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M������</title>
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
           alert("�ϴ�ͷ��ɹ�");
         },
         error: function (data, status)
         {
            alert("�ϴ�ʧ�ܣ������³���!");
          }
              }
 );}
 </script>
  </head>
  <body>
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			
<!-- �м� -->
		 <div id="music_box" >
		<%
			User u=(User)request.getAttribute("userinfo");
		%>
		<table>
		<tr><td>���Ļ�����Ϣ:</td></tr>
		<tr><td>�˺�����:<%=u.getUname() %></td></tr>
		<tr><td>�绰���룺<%=u.getPhone() %></td><td><a target="_self" onClick="dml('upphone?phone=<%=u.getPhone() %>','','width=550,height=380')">�޸ĵ绰����</a></td></tr>
		<tr><td><a href="creditcardlogin">�鿴���</a></td></tr>
		<tr>
		<td>��ǰͷ��:<img alt="" src="<%=u.getUpic()%>" width="50px" height="50px"></td>
		<td><input type="file" id="uFile" name="uFile" />
		<button class="button" id="buttonUpload" onclick="return ajaxFileUpload();">�ϴ���Ƭ</button>
		</td>
		</tr>
		<tr><td>���֤��:<%=u.getIdentitycard() %></td></tr>
		<tr><td><a target="_self" onClick="dml('uppwd','','width=550,height=380')">�޸�����</a> </td> </tr>
		</table>
			
 </div>		
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
