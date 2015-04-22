package com.mzh.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mzh.service.AblumService;
import com.mzh.service.MusicService;
import com.mzh.util.EncodingTool;

@Controller

public class SearchController {
	@Resource
	private AblumService ablumService;
	@Resource
	private MusicService musicService;
	@RequestMapping("search")
	public String searchMusic( String search,ModelMap map,String search_type){
		String tmp =EncodingTool.encodeStrgbk(search);
		System.out.println(search_type);
		if (search_type.equals("ablum")){
		map.put("searchResult", ablumService.getAblumByName(tmp));
		return "ablumSearchResult";
	}else{
		map.put("searchResult",musicService.getMusicByName(tmp));
		return "musicSearchResult";
	}
	
	}

}
