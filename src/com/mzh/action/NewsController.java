package com.mzh.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.News;
import com.mzh.service.AblumService;
import com.mzh.service.NewsService;

@Controller
public class NewsController {
	@Resource
	private NewsService newsService;
	@RequestMapping("/News")
	public String showNews(ModelMap map,HttpServletRequest req){
		List list=newsService.getAllNews();
		//分页开始
		displayfunc dpfc=new displayfunc();
		int pageNow;
		int size=list.size();
		String tmp=req.getParameter("pageNow");
		if(tmp==null||Integer.parseInt(tmp)<1){
			pageNow=1;
		}else if(Integer.parseInt(tmp)>dpfc.showpageCount2(size,15)){
			 pageNow=dpfc.showpageCount2(size,15);
		}else{
			pageNow=Integer.parseInt(tmp);
		}
		map.put("pageNow", pageNow);
		map.put("news", dpfc.dispaly2(list,pageNow,size,15));
		map.put("rowCount", dpfc.showpageCount2(size,15));
		//分页结束
		return "news";
	}
	
	@RequestMapping("/addnews")
	public String addNews(ModelMap map,News news){//String News_title,String News_content
		System.out.println(news.getNews_content());
		//		News news=new News();
//		news.setNews_content(news_content);
//		news.setNews_title(news_title);
		newsService.addNews(news);
		map.addAttribute("news", newsService.getAllNews());
			return "redirect:bgindex";
	}

}
