package com.mzh.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.service.AblumService;
import com.mzh.service.NewsService;

@Controller
public class ShowNewsController {
	@Resource
	private NewsService news;
	@RequestMapping("/showNews")
	public String showAllAblum(int News_id,ModelMap map){
		
		map.addAttribute("ShowNew", news.getNewsByid(News_id));
			return "showNews";
	}

}
