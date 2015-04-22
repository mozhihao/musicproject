package com.mzh.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mzh.service.AblumService;
import com.mzh.service.MusicService;
import com.mzh.util.EncodingTool;

@Controller
public class FileUploadController2 {

	@Resource
	private AblumService ablumService;
	@Resource
	private MusicService musicService;
  /*
   * SpringMVC中的文件上传
   * @第一步：由于SpringMVC使用的是commons-fileupload实现，故将其组件引入项目中
   * @这里用到的是commons-fileupload-1.2.1.jar和commons-io-1.3.2.jar
   * @第二步：spring-mvx中配置MultipartResolver处理器。可在此加入对上传文件的属性限制
   *  <bean id="multipartResolver"  
   *  class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
   *	 <!-- 设置上传文件的最大尺寸为10MB -->  
   *		<property name="maxUploadSize">  
   *			<value>10000000</value>  
   *		 </property>  
   * </bean> 
   * 第三步：在Controller的方法中添加MultipartFile参数。该参数用于接收表单中file组件的内容
   *第四步：编写前台表单。注意enctype="multipart/form-data"以及<input type="file" name="****"/>
   *  如果是单个文件 直接使用MultipartFile 即可
   */ 

  /**
   * 下载
   * @param request
   * @param response
   * @return
   * @throws Exception
   */
  @RequestMapping("/download")  
  public String download(HttpServletRequest request,  
      HttpServletResponse response) throws Exception {  
	  
//		String storeName = "1.jpg";  
    String type= request.getParameter("type")+"/";
//    request.setCharacterEncoding("gbk");
    int id= Integer.parseInt(request.getParameter("id"));
    String storeName=null;
    String downloadname=null;
    String contentType = null;
    if(type.equals("music/")){
    	storeName=musicService.getMusicByid(id).getFile_Location();
    	downloadname=musicService.getMusicByid(id).getMusic_name()+".mp3";
    	contentType="audio/mp3";
    }else{
    	storeName=ablumService.getAblumById(id).getFileLocation();
    	downloadname=ablumService.getAblumById(id).getAlbumName()+".rar";
    	contentType = "application/x-tar";  
    }
//    storeName=new String(storeName.getBytes("ISO-8859-1"),"gbk"); 
    System.out.println(storeName);
    System.out.println(contentType);
    FileUploadController2.download(request, response, storeName, contentType,type,downloadname);  
    return null;  
  }  
  
  
  //文件下载 主要方法
  public static void download(HttpServletRequest request,  
      HttpServletResponse response, String storeName, String contentType,String type,String downloadname
       ) throws Exception {  
    
    request.setCharacterEncoding("UTF-8");  
    BufferedInputStream bis = null;  
    BufferedOutputStream bos = null;  
  
    //获取项目根目录
    String ctxPath = request.getSession().getServletContext()  
        .getRealPath("");  
    
    //获取下载文件露肩
    String downLoadPath = ctxPath+"/"+storeName;//+".rar";  "/upload/"
  
    //获取文件的长度
    long fileLength = new File(downLoadPath).length();  

    //设置文件输出类型
    response.setContentType(contentType);  
    response.setHeader("Content-disposition", "attachment; filename="  
        + new String(downloadname.getBytes("utf-8"), "ISO8859-1")); 
    //设置输出长度
    response.setHeader("Content-Length", String.valueOf(fileLength));  
    //获取输入流
    bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
    //输出流
    bos = new BufferedOutputStream(response.getOutputStream());  
    byte[] buff = new byte[2048];  
    int bytesRead;  
    while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
      bos.write(buff, 0, bytesRead);  
    }  
    //关闭流
    bis.close();  
    bos.close();  
  }  
   
}