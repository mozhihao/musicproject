package com.mzh.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.Cart;
import com.mzh.po.User;
import com.mzh.service.CartService;
import com.mzh.service.CreditcardService;
import com.mzh.service.UserService;

@Controller
public class UserRegController  {

	@Resource
	private CartService cartService;
	@Resource
	private UserService userService;
	@Resource
	private CreditcardService creditcardService;
	
	@RequestMapping("/reg")
	public String showReg( ){
		return "reg";
	}
	
	//注册同时创建购物车
	@RequestMapping("regaction")
	public String reg( User u,ModelMap map,HttpServletRequest req,HttpServletResponse resp) throws IOException{
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		if(creditcardService.getCreditcardByCardnumForReg(u.getCreditcard())==null){
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('没有该银行卡 ')</script>");
            out.print("<script>window.location.href='reg'</script>");
            out.flush();
            out.close();
            return null;
		}
		System.out.println(u.getCreditcard());
		System.out.println("UserController.reg()"+"user名："+u.getUname());
		System.out.println(u.getPwd()+"!!!!");
		map.put("uname", u.getUname());
		map.put("u", userService.getUserByName(u));
		userService.add(u);
		req.getSession().setAttribute("u", u);
		req.getSession().setAttribute("uname", u.getUname());
		Cart c=new Cart();
		c.setUserId(userService.getUserByName(u).getId());
		c.setCreateDate( new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		cartService.createCart(c);
		return "redirect:index";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
}
