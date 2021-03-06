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
            <h1 style="text-align:center">富头像上传编辑器演示</h1>
            <div>
                <p id="swfContainer">
                    本组件需要安装Flash Player后才可使用，请从
                    <a href="http://www.adobe.com/go/getflashplayer">这里</a>
                    下载安装。
                </p>
            </div>
            <button type="button" id="upload">自定义上传按钮</button>
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
                            case 1 : alert("页面成功加载了组件！");break;
                            case 2 : alert("已成功加载图片到编辑面板。");break;
                            case 3 :
                                if(msg.type == 0)
                                {
                                    alert("摄像头已准备就绪且用户已允许使用。");
                                }
                                else if(msg.type == 1)
                                {
                                    alert("摄像头已准备就绪但用户未允许使用！");
                                }
                                else
                                {
                                    alert("摄像头被占用！");
                                }
                            break;
                            case 5 :
                                if(msg.type == 0)
                                {
                                    if(msg.content.sourceUrl)
                                    {
                                        alert("原图片已成功保存至服务器，url为：\n" +msg.content.sourceUrl);
                                    }
                                    alert("头像已成功保存至服务器，url为：\n" + msg.content.avatarUrls.join("\n"));
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
