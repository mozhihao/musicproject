<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Simple demo</title>
        <script type="text/javascript" src="js/uploadimg/swfobject.js"></script>
        <script type="text/javascript" src="js/uploadimg/fullAvatarEditor.js"></script>
    </head>
    <body>
        <div style="width:632px;margin: 0 auto;text-align:center">
            <h1 style="text-align:center">��ͷ���ϴ��༭����ʾ</h1>
            <div>
                <p id="swfContainer">
                    �������Ҫ��װFlash Player��ſ�ʹ�ã����
                    <a href="http://www.adobe.com/go/getflashplayer">����</a>
                    ���ذ�װ��
                </p>
            </div>
            <button type="button" id="upload">�Զ����ϴ���ť</button>
        </div>
        <script type="text/javascript">
            swfobject.addDomLoadEvent(function () {
                var swf = new fullAvatarEditor("js/uploadimg/fullAvatarEditor.swf", "js/uploadimg/expressInstall.swf", "swfContainer", {
                        id : "swf",
                        upload_url : "/upload.php?userid=999&username=looselive",
                        method : "post",
                        src_url : "",
                        src_upload : 2
                    }, function (msg) {
                        switch(msg.code)
                        {
                            case 1 : alert("ҳ��ɹ������������");break;
                            case 2 : alert("�ѳɹ�����ͼƬ���༭��塣");break;
                            case 3 :
                                if(msg.type == 0)
                                {
                                    alert("����ͷ��׼���������û�������ʹ�á�");
                                }
                                else if(msg.type == 1)
                                {
                                    alert("����ͷ��׼���������û�δ����ʹ�ã�");
                                }
                                else
                                {
                                    alert("����ͷ��ռ�ã�");
                                }
                            break;
                            case 5 :
                                if(msg.type == 0)
                                {
                                    if(msg.content.sourceUrl)
                                    {
                                        alert("ԭͼƬ�ѳɹ���������������urlΪ��\n" +msg.content.sourceUrl);
                                    }
                                    alert("ͷ���ѳɹ���������������urlΪ��\n" + msg.content.avatarUrls.join("\n"));
                                }
                            break;
                        }
                    }
                );
                document.getElementById("upload").onclick=function(){
                    swf.call("upload");
                };
            });
        </script>
    </body>
</html>
