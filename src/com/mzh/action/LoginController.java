package com.mzh.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.User;
import com.mzh.service.UserService;

@Controller
//@SessionAttributes({"u","uname"})

public class LoginController {
	@Resource
	private UserService userService;
	@RequestMapping("loginaction")
	public String login( HttpServletRequest req,User u,ModelMap map){
		if(userService.login(u))
		{
			int id=userService.getUserByName(u).getId();
			User tmp=userService.getUserbyId(id);
			System.out.println(tmp.getUpic());
			req.getSession().setAttribute("u", tmp);
			req.getSession().setAttribute("uname", u.getUname());
			return "redirect:index";
		}
		else
			return "redirect:login";
	}
	
	@RequestMapping("/login")
	public String showLogin(){
		return "login";
	}
	
	@RequestMapping("/outlogin")
	public String outLogin(HttpServletRequest req){
		req.getSession().removeAttribute("uname");
		req.getSession().removeAttribute("u");
		System.out.println(req.getSession().getAttribute("uname")+"!!!!!!!!!!");
		return "redirect:index";
	}

}
