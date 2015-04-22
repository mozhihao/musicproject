package com.mzh.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mzh.po.News;
import com.mzh.service.AblumService;
import com.mzh.service.NewsService;

@Controller
public class testController {
	@Resource
	private NewsService newsService;

	
	@RequestMapping("/test2")
	@ResponseBody
	 public String uploadPhoto(@RequestParam MultipartFile uFile, HttpServletRequest request, HttpServletResponse response, ModelMap map){
	    try{
	      if(uFile != null && !uFile.isEmpty()){
	        String fileName = uFile.getOriginalFilename();  
//	        String path = request.getSession().getServletContext().getRealPath("upload\\mp3");  
//	        String path = request.getRealPath("upload"); 
	        String path ="C:/Users/Administrator/Workspaces/MyEclipse 10/music2/WebRoot/upload/mp3";  
	        System.out.println(path);
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }
	        uFile.transferTo(targetFile);  
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }
	    return "";
	}
	
	

}
