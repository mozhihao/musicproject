package com.mzh.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.Ablum;
import com.mzh.po.Comment;
import com.mzh.po.Music;
import com.mzh.service.AblumService;
import com.mzh.service.BgimgService;
import com.mzh.service.CommentService;
import com.mzh.service.MusicService;

@Controller
public class AblumController {
	@Resource
	private AblumService ablumService;
	@Resource
	private CommentService commentService;
	@Resource
	private MusicService musicService;
	@Resource
	private BgimgService bgimgService;
	
	@RequestMapping("/index")
	public String showAllAblum(ModelMap map,HttpServletRequest req){
		map.addAttribute("HotAblum", ablumService.getAblumByHot());
		List list=ablumService.getAblumByHot();
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
		map.put("ranbg", bgimgService.getBgImg());
		map.put("pageNow", pageNow);
		map.put("HotAblum", dpfc.dispaly2(list,pageNow,size,6));
		map.put("rowCount", dpfc.showpageCount2(size,6));
		//分页结束
		return "indexs";
	}
	
	
	@RequestMapping("/ranking")
	public String showRranking(ModelMap map){
		map.put("ranking", ablumService.getAblumBydownloadNum());
		return "ranking";
	}
	
	@RequestMapping("/ablumDetailed")
	public String showablumDetailed(int albumId,ModelMap map,HttpServletRequest req){
		Ablum ablum=ablumService.getAblumById(albumId);
		List<Music> musiclist=musicService.getMusicByAblumId(albumId);
		List<Comment> commentlist=commentService.getListByAblumid(albumId);
		map.put("ablum", ablum);
		map.put("musiclist", musiclist);
		//分页开始
				displayfunc dpfc=new displayfunc();
				int pageNow;
				int size=commentlist.size();
				String tmp=req.getParameter("pageNow");
				if(tmp==null||Integer.parseInt(tmp)<1){
					pageNow=1;
				}else if(Integer.parseInt(tmp)>dpfc.showpageCount2(size,6)){
					 pageNow=dpfc.showpageCount2(size,6);
				}else{
					pageNow=Integer.parseInt(tmp);
				}
				map.put("pageNow", pageNow);
				map.put("commentlist", dpfc.dispaly2(commentlist,pageNow,size,6));
				map.put("rowCount", dpfc.showpageCount2(size,6));
				//分页结束
		return "ablumDetailed";
		
	}
	//
	@RequestMapping("/test")
	public String test(ModelMap map,int ablumId){
		List musiclist=musicService.getMusicByAblumId(ablumId);
		map.put("musiclist", musiclist);
		return "test";
	}
	
}
