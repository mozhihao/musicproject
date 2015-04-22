package com.mzh.action;

import java.awt.BufferCapabilities.FlipContents;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mzh.po.Ablum;
import com.mzh.po.Buyrecord;
import com.mzh.po.CartItem;
import com.mzh.po.Comment;
import com.mzh.po.Music;
import com.mzh.po.News;
import com.mzh.po.Admin;
import com.mzh.po.User;
import com.mzh.service.AblumService;
import com.mzh.service.CartItemService;
import com.mzh.service.CartService;
import com.mzh.service.CommentService;
import com.mzh.service.MusicService;
import com.mzh.service.NewsService;
import com.mzh.service.AdminService;
import com.mzh.service.UserService;
import com.mzh.util.EncodingTool;

@Controller
public class BGController {
	@Resource
	private AblumService ablumService;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private CartService cartService;
	@Resource
	private MusicService musicService;
	@Resource
	private AdminService adminService;
	@Resource
	private NewsService newsService;
	@Resource
	private CommentService commentService;
	@Resource
	private UserService userService;
	
	//test
	@RequestMapping("/test1")
	public String test(){
		return "test1";
	}
	
	
	//��½
	@RequestMapping("/bglogin")
	public String showBGLogin(HttpServletRequest req){
		if(req.getSession().getAttribute("r")!=null){
			return "redirect:bgindex";
		}
		return "bg/bglogin";
	}
	
	@RequestMapping("/bgLoginaction")
	public String showBGLoginaction(HttpServletRequest req,ModelMap map,Admin r){
		if(adminService.login(r)){
			Admin admin=adminService.getUserByPwd(r);
			req.getSession().setAttribute("r", admin);
			req.getSession().setAttribute("rname", admin.getName());
			return "redirect:bgindex";
		}else{
			return "redirect:bglogin";
		}
	}
	
	//��ҳ(��ʾҳ)
	@RequestMapping("/bgindex")
	public String bgindex(ModelMap map){
		map.put("ablumNum", ablumService.getAblumNum());
		map.put("commentNum", commentService.getCommentNum());
		map.put("userNum", userService.getUserNum());
		map.put("newsNum", newsService.getNewsNum());
		return "bg/bgindex";
	}
	
	//ע��
	@RequestMapping("/bgoutlogin")
	public String bgloginout(HttpServletRequest req){
		req.getSession().removeAttribute("rname");
		req.getSession().removeAttribute("r");
		return "redirect:bglogin";
	}
	
	//������ʾҳ
	@RequestMapping("/bgnews")
	public String showBgNews(ModelMap map,HttpServletRequest req){
		List list=newsService.getAllNews();
		//��ҳ��ʼ
		displayfunc dpfc=new displayfunc();
		int pageNow;
		int size=list.size();
		String tmp=req.getParameter("pageNow");
		if(tmp==null||Integer.parseInt(tmp)<1){
			pageNow=1;
		}else if(Integer.parseInt(tmp)>dpfc.showpageCount2(size,8)){
			 pageNow=dpfc.showpageCount2(size,8);
		}else{
			pageNow=Integer.parseInt(tmp);
		}
		map.put("pageNow", pageNow);
		map.put("allnews", dpfc.dispaly2(list,pageNow,size,8));
		map.put("rowCount", dpfc.showpageCount2(size,8));
				//��ҳ����
			return "bg/bgnews";
	}
	//��������(��ʾҳ)
	@RequestMapping("/bgaddnews")
	public String addBgNews(ModelMap map,String news_title,String edit){
//		News news=new News();
//		news.setNews_content(edit);
//		news.setNews_title(news_title);
////		news.setTime(news_title);
//		newsService.addNews(news);
			return "bg/bgaddnews";
	}
	
	@RequestMapping("/bgaddnewsaction")
	public String addBgNewsAction(ModelMap map,String news_title,String news_content,HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		String tmp=EncodingTool.encodeStr(news_content);
		String tmp_title=EncodingTool.encodeStr(news_title);
		News news=new News();
		news.setNews_content(tmp);
		news.setNews_title(tmp_title);
//		news.setTime(news_title);
		newsService.addNews(news);
			return "redirect:bgnews";
	}
	
	//ɾ������
	@RequestMapping("/bgdelNews")
	public String delNews(ModelMap map,HttpServletRequest req){
		News news=new News();
		int news_id=Integer.parseInt(req.getParameter("News_id"));
		news.setNews_id(news_id);
		newsService.delNews(news);
			return "redirect:bgnews";
	}
	//�����޸�ҳ
	@RequestMapping("/bgupnews")
	public String bgaddnews(ModelMap map,HttpServletRequest req){
		int News_id=Integer.parseInt(req.getParameter("News_id"));
		News news=newsService.getNewsByid(News_id);
		map.put("News", news);
			return "bg/bgupnews";
	}
	//���Ÿ���
	@RequestMapping("/upNews")
	public String bgupnews(ModelMap map,News news){
		System.out.println(news.getNews_id());
		newsService.upNews(news);
		map.put("News", news);
			return "redirect:bgnews";
	}
	
	//���۲鿴
	@RequestMapping("/allComment")
	public String allComment(HttpServletRequest req,ModelMap map){
		List<Comment> list=commentService.getAllComment();
		//��ҳ��ʼ
		displayfunc dpfc=new displayfunc();
		int pageNow;
		int size=list.size();
		String tmp=req.getParameter("pageNow");
		if(tmp==null||Integer.parseInt(tmp)<1){
			pageNow=1;
			}else if(Integer.parseInt(tmp)>dpfc.showpageCount(size)){
			 pageNow=dpfc.showpageCount(size);
		}else{
			pageNow=Integer.parseInt(tmp);
		}
		map.put("pageNow", pageNow);
		map.put("allComment", dpfc.dispaly(list,pageNow,size));
		map.put("rowCount", dpfc.showpageCount(size));
		//��ҳ����		
			return "allComment";
	}
	
	//����ɾ��
	@RequestMapping("/delComment")
	public String delComment(HttpServletRequest req,ModelMap map){
		Comment comment=new Comment();
		int comment_id=Integer.parseInt(req.getParameter("comment_id"));
		comment.setComment_id(comment_id);
		commentService.delComment(comment);
			return "allComment";
	}
	//�ϴ�����(��ʾҳ)
	@RequestMapping("/bguploadmusic")
	public String uploadmusic(ModelMap map){
		map.put("allablum", ablumService.getAllAblum());
			return "bg/bguploadmusic";
	}
	//�û�����ҳ����ʾҳ��
	@RequestMapping("/bguser")
	public String bguser(HttpServletRequest req,ModelMap map){
		List list=userService.showAllUser();
		//��ҳ��ʼ
		displayfunc dpfc=new displayfunc();
		int pageNow;
		int size=list.size();
		String tmp=req.getParameter("pageNow");
		if(tmp==null||Integer.parseInt(tmp)<1){
			pageNow=1;
		}else if(Integer.parseInt(tmp)>dpfc.showpageCount2(size,6)){
			 pageNow=dpfc.showpageCount2(size,6);
		}else{
		pageNow=Integer.parseInt(tmp);				}
		map.put("pageNow", pageNow);
		map.put("alluser", dpfc.dispaly2(list,pageNow,size,6));
		map.put("rowCount", dpfc.showpageCount2(size,6));
		//��ҳ����
			return "bg/bguser";
	}

	
	//��ý�����ҳ����ʾҳ��
	@RequestMapping("/bgmusic")
	public String bgmusic(ModelMap map,HttpServletRequest req){
		List list=ablumService.getAllCommentAblum();
		displayfunc dpfc=new displayfunc();
		int pageNow;
		int size=list.size();
		String tmp=req.getParameter("pageNow");
		if(tmp==null||Integer.parseInt(tmp)<1){
			pageNow=1;
		}else if(Integer.parseInt(tmp)>dpfc.showpageCount2(size,8)){
			 pageNow=dpfc.showpageCount2(size,8);
		}else{
		pageNow=Integer.parseInt(tmp);				}
		map.put("pageNow", pageNow);
		map.put("ablum", dpfc.dispaly2(list,pageNow,size,8));
		map.put("rowCount", dpfc.showpageCount2(size,8));
		return "bg/bgmusic";
	}
	
	//����ר����ʾҳ
	@RequestMapping("/bgupablum")
	public String delAblum(ModelMap map,HttpServletRequest req){
		int albumId=Integer.parseInt(req.getParameter("ablumId"));
		Ablum ablum=ablumService.getAblumById(albumId);
		map.put("ablum", ablum);
//		ablum.setAlbumId(albumId);
//		ablumService.upAblum(ablum);
			return "bg/bgupablum";
	}
	
	//����ר������ҳ
	@RequestMapping("/bgupablumaction")
	public String bgupAblum(ModelMap map,Ablum ablum){
		System.out.println(ablum.getAblumPrice());
		ablumService.upAblum(ablum);
		map.put("ablum", ablum);
			return "redirect:bgmusic";
	}
	
	//�ϴ�����1
	@RequestMapping("/bguploadmusicaction1")
	public String bgupAblum(ModelMap map,Music music,HttpServletRequest req,HttpServletResponse resp)throws UnsupportedEncodingException{
		//���룬��������
		music.setAuthor(EncodingTool.encodeStr(music.getAuthor()));
		System.out.println(EncodingTool.encodeStr(music.getAuthor()));
		music.setMusic_name(EncodingTool.encodeStr(music.getMusic_name()));
		music.setIntrodution(EncodingTool.encodeStr(music.getIntrodution()));
		music.setAlbum(ablumService.getAblumById(music.getAlbum_id()).getAlbumName());
		req.getSession().setAttribute("uploadinfo", music);
			return "bg/bguploadmusic2";
	}
	
	//�ϴ�����2
	@RequestMapping("/bguploadmusic2")
	public String bgupAblum2(ModelMap map,Music music,HttpServletRequest req,HttpServletResponse resp)throws UnsupportedEncodingException{
			return "bg/bguploadmusic2";
	}
	
	@RequestMapping("/bguploadmusicaction2")
	@ResponseBody
	 public String uploadmusicaction2(@RequestParam MultipartFile uFile, HttpServletRequest request, HttpServletResponse response, ModelMap map){
	    try{
	      if(uFile != null && !uFile.isEmpty()){
	    	  request.setCharacterEncoding("gbk");
	    	  response.setCharacterEncoding("gbk");
	        String fileName = uFile.getOriginalFilename(); 
	        System.out.println(fileName);
	        String path ="E:/Workspaces/MyEclipse 10/music2/WebRoot/upload/mp3";  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }
	        uFile.transferTo(targetFile);
	        String tmppath="upload/mp3/"+fileName;
	        Music tmp=(Music)request.getSession().getAttribute("uploadinfo");
	        tmp.setFile_Location(tmppath);
	        tmp.setTmp_file_Location(tmppath);
	        musicService.addMusic(tmp);
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }
	    return "";
	}
	//ר���Ĵ�����ʾҳ��
	@RequestMapping("/bgaddablum")
	public String showBgAddAblum(ModelMap map){
		return "bg/bgaddablum";
		}
		//ר����ͼƬ�ϴ�
	@RequestMapping("/bgaddblumpic")
	@ResponseBody
	public String bgaddablumpic(@RequestParam MultipartFile uFile, HttpServletRequest request, HttpServletResponse response, ModelMap map){
		try{
		      if(uFile != null && !uFile.isEmpty()){
		    	  request.setCharacterEncoding("gbk");
		    	  response.setCharacterEncoding("gbk");
		        String fileName =uFile.getOriginalFilename();
		        System.out.println(fileName+"!!!!!!!!!4");
		        String path ="E:/Workspaces/MyEclipse 10/music2/WebRoot/upload/img";  //
		        File targetFile = new File(path, fileName);  //C:/Users/Administrator/Workspaces/MyEclipse 10/music2/WebRoot/upload/mp3
		        if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        }
		        String picLocation="upload/img/"+fileName;
		        request.getSession().setAttribute("piclocation", picLocation);
		        uFile.transferTo(targetFile);
		      }
		    }catch(Exception e){
		      e.printStackTrace();
		    }
		return "";
	}
		
	//ר�����ļ��ϴ�
	@RequestMapping("/bgaddablumfile")
	@ResponseBody
	public String bgaddablumfile(@RequestParam MultipartFile uFile2, HttpServletRequest request, HttpServletResponse response, ModelMap map){
		try{
		      if(uFile2 != null && !uFile2.isEmpty()){
		    	  request.setCharacterEncoding("gbk");
		    	  response.setCharacterEncoding("gbk");
		        String fileName = uFile2.getOriginalFilename();  
		        String fileLocation="upload/ablum/"+fileName;
		        request.getSession().setAttribute("filelocation", fileLocation);
		        String path ="E:/Workspaces/MyEclipse 10/music2/WebRoot/upload/ablum";  
		        File targetFile = new File(path, fileName);  
		        if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        }
		        uFile2.transferTo(targetFile);
		      }
		    }catch(Exception e){
		      e.printStackTrace();
		    }
		return "";
	}
	
	//ר���Ĵ�������ҳ
		@RequestMapping("/bgaddablumaction")
		public String bgAddAblumAction(ModelMap map,HttpServletRequest req,HttpServletResponse resp,Ablum ablum) throws IOException{
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			//�����
			ablum.setAlbumAuthor(EncodingTool.encodeStr(ablum.getAlbumAuthor()));
			ablum.setAlbumName(EncodingTool.encodeStr(ablum.getAlbumName()));
			String piclocation=(String)req.getSession().getAttribute("piclocation");
			String filelocation=(String)req.getSession().getAttribute("filelocation");
			ablum.setAlbumPic(piclocation);
			ablum.setFileLocation(filelocation);
			ablumService.addAblum(ablum);
			return "redirect:bgmusic";
			}
	//��̨ר������
	@RequestMapping("/bgmusicsearch")
	public String bgablumsearch(ModelMap map,HttpServletRequest req,String search){
		List list=ablumService.getAllCommentAblumbyKey(search);
		map.put("search", list);
		return "bg/bgmusicsearch";
	}	
	
	//ĳר���µ����ָ�����ʾҳ
	@RequestMapping("/bgupmusic")
	public String showBgUpMusic(ModelMap map,HttpServletRequest req,int musicId){
		map.put("music", musicService.getMusicByid(musicId));
		return "bg/bgupmusic";
	}
		
	//ɾ������
	@RequestMapping("/bgdelmusic")
	public String delMusic(ModelMap map,HttpServletRequest req,int musicId){
		Music music=musicService.getMusicByid(musicId);
		int id=music.getAlbum_id();
		System.out.println(id+"!!!!!!!!!");
		musicService.delMusic(music);
			return "redirect:bgablummusic?ablumId="+id;
	}
	//��ʷ����(��ʾҳ)
	@RequestMapping("/hisMusic")
	public String hisMusic(ModelMap map,HttpServletRequest req){
			return "hisMusic";
	}
	//��ʷ����()
		@RequestMapping("/recMusic")
		public String recMusic(ModelMap map,HttpServletRequest req){
			//����	
			return "hisMusic";
		}
	//ĳר���µ����ֹ�����ʾҳ
		@RequestMapping("/bgablummusic")
		public String showBgAblumMusic(ModelMap map,HttpServletRequest req,int ablumId){
			map.put("music", musicService.getMusicByAblumId(ablumId));
			return "bg/bgablummusic";
		}
		
	//ר���Ĵ���
//		@RequestMapping("/bgaddablumaction")
//		public String showBgAddAblumaction(ModelMap map,HttpServletRequest req){
//			return "bg/bgaddablum";
//		}	
	//���ָ���
		@RequestMapping("/bgupmusicaction")
		public String BgUpMusicAction(ModelMap map,HttpServletRequest req,int musicId,String music_name,String introdution,String price,String type) {
			Music m=musicService.getMusicByid(musicId);
			m.setMusic_name(EncodingTool.encodeStr(music_name));
			m.setIntrodution(EncodingTool.encodeStr(introdution));
			m.setPrice(Double.parseDouble(price));
			m.setType(type);
			musicService.upMusic(m);
			return "bg/upmusicsuccess";
		}
	//ɾ���û�
		@RequestMapping("/bgdeluser")
		public String BgDelUser(ModelMap map,HttpServletRequest req,int id) {
			User tmp=new User();
			tmp.setId(id);
			userService.delUser(tmp);
			return "redirect:bguser";
		}
		
		
	//�������
		
	//��������
		@RequestMapping("/bgsetting")
		public String Bgsetting(ModelMap map,HttpServletRequest req) {
			return "bg/bgsetting";
		}
	
	//�������ϲ���ҳ
		@RequestMapping("/bgsettingaction")
		public String BgsettingAction(ModelMap map,HttpServletRequest req,HttpServletResponse resp,String oldpwd,String newpwd) throws IOException {
			Admin admin=(Admin)req.getSession().getAttribute("r");
			if(admin.getPwd().equals(oldpwd)&&oldpwd!=""){
				admin.setPwd(newpwd);
				adminService.upAdmin(admin);
				PrintWriter out = resp.getWriter();
				req.getSession().removeAttribute("r");
				req.getSession().setAttribute("r", admin);
				 out.print("<script>alert('Up info succesee ')</script>");
                 out.print("<script>window.location.href='bgindex'</script>");
                 out.flush();
                 out.close();
                 
                 return null;
			}
			else{
				map.put("Msg", "ԭ�������");
				return "bg/bgsetting";
			}	
		}	
}
