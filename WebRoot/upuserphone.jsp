<%@ page language="java" import="java.util.*"  import="com.mzh.po.User" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <script type="text/javascript" src="js/phone/jquery1.2.6.js"></script>
  <script type="text/javascript" src="js/phone/jQuery.FormValidator.js"></script>
  <link type="text/css" href="Images/css.css" rel="Stylesheet" />
   <script type="text/javascript">
            function CheckForm() {
                return $("#FormDemo10_1").FormValidate();
            }
            $(document).ready(function() {
                $("#FormDemo10_1").SetValidateSettings({ Config: { AutoSubmit: false} });
                $("#Mobile").SetValidateSettings({
                    FormValidate: {
                        Empty: {
                            Value: true
                        },
                        Format: {
                            Value: new RegExp("^(13|15)[0-9]{9}$"),
                            Message: "手机号格式不正确"
                        }
                    },
                    Message: {
                        Text: {
                            Show: "请输入手机号码",
                            Success: "正确！",
                            Error: "必须输入手机号",
                            Focus: "输入中..."
                        },
                        MessageSpaceHolderID: "TipMobile"
                    }
                });
            });
        </script>
  </head>
  <body>
  <h1><strong>M</strong>音乐网</h1>
  <% String phone=(String)request.getAttribute("phone");  %>
    <fieldset>
     <legend>更新手机号码</legend>    
  <form action="upphoneaction" method="post" id="FormDemo10_1" >
  <dl>
  		<dt>手机号</dt>
  		<dd><input type="text" name='phone' value='<%=phone %>' readonly="readonly"></dd>
  		<dt>请输入新手机号码</dt>
  		<dd><input type="text" id="Mobile" name='newphone' /><tt id="TipMobile"></tt></dd>
 	 	<dd><input type="submit" value="提交" onclick="return CheckForm();" /></dd>
  </dl>
  </form>
  </fieldset>
  </body>
</html>




   
       
 

