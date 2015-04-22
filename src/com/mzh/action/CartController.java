package com.mzh.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.Ablum;
import com.mzh.po.Buyrecord;
import com.mzh.po.CartItem;
import com.mzh.po.Music;
import com.mzh.po.User;
import com.mzh.service.AblumService;
import com.mzh.service.BuyrecordService;
import com.mzh.service.CartItemService;
import com.mzh.service.CartService;
import com.mzh.service.MusicService;
import com.mzh.service.UserService;

@Controller
public class CartController {
	@Resource
	private AblumService ablumService;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private CartService cartService;
	@Resource
	private MusicService musicService;
	@Resource
	private UserService userService;
	@Resource
	private BuyrecordService buyrecordService;

	@RequestMapping("usercart")
	public String showCart(HttpServletRequest req,ModelMap map,HttpServletResponse response) throws IOException{
		req.setCharacterEncoding("gbk");
		response.setCharacterEncoding("GBK"); 
		PrintWriter out = response.getWriter();  
		User u=(User)req.getSession().getAttribute("u");
		int CartId=cartService.getCartIdByUserId(u.getId());//获取 Cart id
		List<CartItem> list=cartItemService.getCartItemByCartId(CartId);
		System.out.println(list.size()+"sssss");
		if(list.size()<1){
			out.print("<script>alert('购物车为空 ')</script>");
            out.print("<script>window.location.href='index'</script>");
            out.flush();
            out.close();
		}
		//map.addAttribute("usercart",list);
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
		map.put("usercart", dpfc.dispaly(list,pageNow,size));
		map.put("rowCount", dpfc.showpageCount(size));
		//分页结束
			return "usercart";
	}
	
	@RequestMapping("add_cart_succeed")
	public String showAdd_cart_succeed(HttpServletRequest req,Ablum ablum,ModelMap map){
		CartItem ci=new CartItem();
		User u=(User)req.getSession().getAttribute("u");
		Ablum a=ablumService.getAblumById(ablum.getAlbumId());//获取ablum id
		int cartId=cartService.getCartIdByUserId(u.getId());//获取 Cart id
		ci.setCartId(cartId);
		ci.setAblumId(a.getAlbumId());
		ci.setPrice(a.getAblumPrice());
		ci.setProductName(a.getAlbumName());
		ci.setProductPic(a.getAlbumPic());
		cartItemService.addCartItem(ci);
		map.addAttribute("cartablum",a);
		return "add_cart_succeed";
	}
	
	@RequestMapping("delcartitem")
	public String del_cart_item(HttpServletRequest req,CartItem ci,ModelMap map){
		System.out.println(ci.getCartItemId());
		cartItemService.delCartItem(ci);
		return "redirect:usercart";
	}
	
	@RequestMapping("cartSum")
	public String cartSum(HttpServletRequest req,ModelMap map,HttpServletResponse resp) throws IOException{
		resp.setCharacterEncoding("gbk");
		String tmp[]=req.getParameterValues("ablum");
		if(tmp==null){
			PrintWriter out = resp.getWriter();
			 out.print("<script>alert('请先选择要购买的物品 ')</script>");
             out.print("<script>window.location.href='usercart'</script>");
             out.flush();
             out.close();
		}
		double sum = 0;
		for(String a:tmp){
			CartItem ci=cartItemService.getCartItemByCartItemId(Integer.parseInt(a));
			sum=sum+ci.getPrice();
		}
		req.getSession().setAttribute("CartItemId", tmp);
		map.put("sum", sum);
		User user=(User)req.getSession().getAttribute("u");
		User u=userService.getUserbyId(user.getId());
		map.put("u", u);
		return "paycart";
		
	}

}
