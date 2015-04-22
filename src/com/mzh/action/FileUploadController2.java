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
   * SpringMVC�е��ļ��ϴ�
   * @��һ��������SpringMVCʹ�õ���commons-fileuploadʵ�֣��ʽ������������Ŀ��
   * @�����õ�����commons-fileupload-1.2.1.jar��commons-io-1.3.2.jar
   * @�ڶ�����spring-mvx������MultipartResolver�����������ڴ˼�����ϴ��ļ�����������
   *  <bean id="multipartResolver"  
   *  class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
   *	 <!-- �����ϴ��ļ������ߴ�Ϊ10MB -->  
   *		<property name="maxUploadSize">  
   *			<value>10000000</value>  
   *		 </property>  
   * </bean> 
   * ����������Controller�ķ��������MultipartFile�������ò������ڽ��ձ���file���������
   *���Ĳ�����дǰ̨����ע��enctype="multipart/form-data"�Լ�<input type="file" name="****"/>
   *  ����ǵ����ļ� ֱ��ʹ��MultipartFile ����
   */ 

  /**
   * ����
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
  
  
  //�ļ����� ��Ҫ����
  public static void download(HttpServletRequest request,  
      HttpServletResponse response, String storeName, String contentType,String type,String downloadname
       ) throws Exception {  
    
    request.setCharacterEncoding("UTF-8");  
    BufferedInputStream bis = null;  
    BufferedOutputStream bos = null;  
  
    //��ȡ��Ŀ��Ŀ¼
    String ctxPath = request.getSession().getServletContext()  
        .getRealPath("");  
    
    //��ȡ�����ļ�¶��
    String downLoadPath = ctxPath+"/"+storeName;//+".rar";  "/upload/"
  
    //��ȡ�ļ��ĳ���
    long fileLength = new File(downLoadPath).length();  

    //�����ļ��������
    response.setContentType(contentType);  
    response.setHeader("Content-disposition", "attachment; filename="  
        + new String(downloadname.getBytes("utf-8"), "ISO8859-1")); 
    //�����������
    response.setHeader("Content-Length", String.valueOf(fileLength));  
    //��ȡ������
    bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
    //�����
    bos = new BufferedOutputStream(response.getOutputStream());  
    byte[] buff = new byte[2048];  
    int bytesRead;  
    while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
      bos.write(buff, 0, bytesRead);  
    }  
    //�ر���
    bis.close();  
    bos.close();  
  }  
   
}