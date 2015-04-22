package com.mzh.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.mzh.po.Ablum;
import com.mzh.po.Admin;
import com.mzh.po.Buyrecord;
import com.mzh.po.Music;
import com.mzh.po.User;
import com.mzh.service.BuyrecordService;
import com.mzh.service.UserService;

@Controller
public class UserIndexController {
	@Resource
	private UserService userService;
	@Resource
	private BuyrecordService buyrecordService;
	
	@RequestMapping("/userindex")
	public String showLogin(){
		return "userindex";
	}
	
	@RequestMapping("/userinfo")
	public String userinfo(HttpServletRequest req,ModelMap map){
		User tmp=(User)req.getSession().getAttribute("u");
		User u=userService.getUserbyId(tmp.getId());
		String phone =changep(u.getPhone());
		String creditcard=changec(u.getCreditcard());
		String identitycard=changei(u.getIdentitycard());
		u.setPhone(phone);
		u.setCreditcard(creditcard);
		u.setIdentitycard(identitycard);
		map.addAttribute("userinfo",u);
		return "userinfo";
	}
	
	/**
	 * 显示购买记录
	 * @param req
	 * @param map
	 * @return
	 */
	@RequestMapping("/buyRecord")
		public String showBuyrecord(HttpServletRequest req,ModelMap map){
		User u=(User)req.getSession().getAttribute("u");
		int userId=u.getId();
		List<Buyrecord> list=buyrecordService.getRecordByUserIdState(userId);;
		//分页开始
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
		map.put("buyRecord", dpfc.dispaly(list,pageNow,size));
		map.put("rowCount", dpfc.showpageCount(size));
		//分页结束
		return "buyRecord";
	}
	
	//没给钱的订单
	@RequestMapping("/userorder")
	public String userorder(HttpServletRequest req,ModelMap map){
		User u=(User)req.getSession().getAttribute("u");
		int uid=u.getId();
		List list=buyrecordService.getRecordByUserIdState0(uid);
		//分页开始
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
		map.put("userorder", dpfc.dispaly(list,pageNow,size));
		map.put("rowCount", dpfc.showpageCount(size));
		//分页结束
		return "userorder";
		
	}
	
	//删除订单
	@RequestMapping("/delorder")
	public void delorder(HttpServletRequest req,ModelMap map,int brId,HttpServletResponse resp) throws IOException{
		resp.setCharacterEncoding("gbk"); 
		PrintWriter out = resp.getWriter();
		Buyrecord buyrecord=buyrecordService.getRecordById(brId);
		if(buyrecord==null){
			out.print("<script>alert('错误操作')</script>");
	        out.print("<script>window.location.href='userorder'</script>");
	        out.flush();
	        out.close();
		}
		buyrecordService.delRecord(buyrecordService.getRecordById(brId));
		out.print("<script>alert('删除成功')</script>");
        out.print("<script>window.location.href='userorder'</script>");
        out.flush();
        out.close();
	}
	
	
	
	//更新电话号码
	@RequestMapping("/upphone")
	public String showUpPhone(HttpServletRequest req,ModelMap map){
		String phone=req.getParameter("phone");
		map.put("phone", phone);
		return "upuserphone";
	}
	
	@RequestMapping("/upphoneaction")
	@ResponseBody
	public String showUpPhoneaction(HttpServletRequest req,ModelMap map,String newphone){
		User tmp=(User)req.getSession().getAttribute("u");
		User u=userService.getUserbyId(tmp.getId());
		u.setPhone(newphone);
		userService.upUser(u);
		return "upuserphonesuccess";
	}
	
	@RequestMapping("/uploadimg")
	public String UpLoadImg(@RequestParam MultipartFile uFile, HttpServletRequest request, HttpServletResponse response, ModelMap map){
	    try{
		      if(uFile != null && !uFile.isEmpty()){
		        String fileName = uFile.getOriginalFilename();  
//		        String path = request.getSession().getServletContext().getRealPath("upload\\mp3");  
		        String path ="E:/Workspaces/MyEclipse 10/music2/WebRoot/upload/userimg";  
		        File targetFile = new File(path, fileName);  
		        if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        }
		        uFile.transferTo(targetFile);
		        String tmppath="upload/userimg/"+fileName;
		        System.out.println(tmppath);
		        User tmp=(User)request.getSession().getAttribute("u");
		        tmp.setUpic(tmppath);
		        userService.upUser(tmp);
		      }
		    }catch(Exception e){
		      e.printStackTrace();
		    }
		    return "";
		}
	
	
	//userbalance为余额
	@RequestMapping("/userbalance")
	public String userbalance(HttpServletRequest req,ModelMap map){
		User tmp=(User)req.getSession().getAttribute("u");
		User u=userService.getUserbyId(tmp.getId());
		return "userbalance";
	}
	
	@RequestMapping("/uppwd")
	public String showpwdsetting(){
		return "uppwd";
	}
	
	@RequestMapping("/pwdsettingaction")
	public String pwdsettingAction(ModelMap map,HttpServletRequest req,HttpServletResponse resp,String oldpwd,String newpwd) throws IOException {
		User u=(User)req.getSession().getAttribute("u");
		if(u.getPwd().equals(oldpwd)&&oldpwd!=""){
			u.setPwd(newpwd);
			userService.upUser(u);
			PrintWriter out = resp.getWriter();
			req.getSession().removeAttribute("u");
			req.getSession().setAttribute("u", u);
			 out.print("<script>alert('Up info succesee ')</script>");
             out.print("<script>window.close()</script>");
             out.flush();
             out.close();
             return null;
		}
		else{
			map.put("Msg", "原密码错误");
			return "uppwd";
		}	
	}
	
	
	
	
	
	 String changec(String target){
		 String head ="尾号为:";
		 String body = "*****";
	     String foot =target.substring(15,19);
	     return head+body+foot;
	}
	
	 String changei(String target){
		 String head = target.substring(0, 4);
		 String body = "*****";
	     String foot =target.substring(14,18);// target.substring(14,10);
	     return head+body+foot;
	}
	 
	 String changep(String target){
		 String head = target.substring(0, 4);
		 String body="****";
	     String foot = target.substring(6,11);
	     return head+body+foot;
	}
}
