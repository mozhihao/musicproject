<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" import="com.mzh.po.Ablum" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>M������</title>
  </head>
  <body>
<!-- ͷ -->
  		<jsp:include page="head.jsp"></jsp:include>
			<%User u=(User)request.getSession().getAttribute("u"); %>
<!-- �м� -->
<div id="music_box" >
		<div id='singles'>
        <div class="head_bg">
            <div class="cl top_h">
                <div class="nov m_l l" style="text-align: center;">
                <ul>
                      <li><img src=<%if (u.getUpic()==null){%>"upload/userimg/userdf.jpg"<% }%> <%=u.getUpic() %> width="50px" height="48px"></li>
                	 <li><a href="buyRecord"  >�ѹ�����</a></li>
                	 <li><a href="usercart"  >�ҵĹ��ﳵ</a></li>
                	 <li><a href="userinfo"  >�˻�����</a></li>
                	 <li><a href="userorder"  >�ҵĶ���</a></li>   
                	  <li><a href="outlogin"  >ע��</a></li>
                </ul>
				</div>
			</div>
		</div>

</div>
<!-- ������ѹ���Ʒ -->
 </div>		
			
<!-- β -->		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
