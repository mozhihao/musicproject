package com.mzh.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.News;
import com.mzh.service.AblumService;
import com.mzh.service.MusicService;
import com.mzh.service.NewsService;

@Controller
public class MusicTypeController {
	@Resource
	private MusicService musicService;
	
	
	@RequestMapping("/musictype")
	public String showMusicType(ModelMap map,String type,HttpServletRequest req){
		System.out.println(type);
		List list=musicService.getMusicByMusicType(type);
		//分页开始
		displayfunc dpfc=new displayfunc();
		int pageNow;
		int size=list.size();
		String tmp=req.getParameter("pageNow");
		if(tmp==null||Integer.parseInt(tmp)<1){
			pageNow=1;
		}else if(Integer.parseInt(tmp)>dpfc.showpageCount2(size,6)){
			 pageNow=dpfc.showpageCount2(size,6);
		}else{
			pageNow=Integer.parseInt(tmp);
		}
		map.put("pageNow", pageNow);
		map.put("type", dpfc.dispaly2(list,pageNow,size,6));
		map.put("rowCount", dpfc.showpageCount2(size,6));
		//分页结束
		return "musictype";
	}

}
