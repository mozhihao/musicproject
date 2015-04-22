package com.mzh.action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.Ablum;
import com.mzh.po.Buyrecord;
import com.mzh.po.Comment;
import com.mzh.po.Music;
import com.mzh.po.User;
import com.mzh.service.AblumService;
import com.mzh.service.BuyrecordService;
import com.mzh.service.CommentService;
import com.mzh.service.MusicService;

@Controller
public class CommentController {
	@Resource
	private AblumService ablumService;
	@Resource
	private CommentService commentService;
	@Resource
	private MusicService musicService;
	@Resource
	private BuyrecordService buyrecordService;
	//�������ʾ����
	@RequestMapping("/usercomment")
	public String showcommentByalbumId(ModelMap map,HttpServletRequest req,int brid){
		Buyrecord br=buyrecordService.getRecordById(brid);
		System.out.println("brid��"+brid);
		User u=(User) req.getSession().getAttribute("u");
		//�ж��Ƿ�ר��
		if(br.getAblumid()!=0){
			//�ж��Ƿ��Ѿ�����
			if(commentService.boolcomment(br.getAblumname(), u.getUname())){
				return "commentflase";
			}
			System.out.println(br.getAblumname());
			int albumId=Integer.parseInt(req.getParameter("albumId"));
			map.addAttribute("commentAblum", ablumService.getAblumById(albumId));
		}else{
			//�ж��Ƿ��Ѿ�����
			if(commentService.boolcomment(ablumService.getAblumById(musicService.getMusicByid(br.getMusicid()).getAlbum_id()).getAlbumName(), u.getUname())){
				return "commentflase";
			}
			int musicId=Integer.parseInt(req.getParameter("musicId"));
			map.addAttribute("commentAblum", ablumService.getAblumById(musicService.getMusicByid(musicId).getAlbum_id()));
		}
			return "usercomment";
//		return "test����";
	}
	//�����д����
	@RequestMapping("/addComment")
	public String showaddComment(HttpServletRequest req,ModelMap map) throws UnsupportedEncodingException{
		req.setCharacterEncoding("utf-8");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String date=formatter.format(new Date());
		String comment =req.getParameter("comment");
		System.out.println(comment);
		int album_id=Integer.parseInt(req.getParameter("album_id"));
		User u=(User)req.getSession().getAttribute("u");
		Ablum a=ablumService.getAblumById(album_id);
		Comment c=new Comment();
		c.setComment_time(date);
		c.setAblum_id(a.getAlbumId());
		c.setAblum_name(a.getAlbumName());
		c.setComment(comment);
		c.setUser_name(u.getUname());
		commentService.addComment(c);//
		return "userindex";
		}
	
	//��ʾ����
	
}
