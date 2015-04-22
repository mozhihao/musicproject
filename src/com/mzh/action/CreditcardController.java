package com.mzh.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mzh.po.Creditcard;
import com.mzh.service.CreditcardService;
import com.mzh.util.EncodingTool;
import com.mzh.util.IsNumTool;
import com.mzh.util.SetIdByTime;

@Controller
public class CreditcardController {
	@Resource
	private CreditcardService creditcardService;
	
	@RequestMapping("/creditcardlogin")
	public String showCreditcardLogin(){
			return "creditcardlogin";
	}
	@RequestMapping("/creditcardindex")
	public String showCreditcardindex2(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		if(req.getSession().getAttribute("creditcardinfo")==null){
			out.print("<script>alert('请先登录')</script>");
			out.print("<script>window.location.href='creditcardlogin'</script>");
			out.flush();
			out.close();
			return null;
		}else
			return "creditcardindex";
	}
	
	@RequestMapping("/creditcardcheck")
	public String showCreditcardcheck(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		if(req.getSession().getAttribute("creditcardinfo")==null){
			out.print("<script>alert('请先登录')</script>");
			out.print("<script>window.location.href='creditcardlogin'</script>");
			out.flush();
			out.close();
			return null;
		}else
			return "creditcardcheck";
	}
	
	@RequestMapping("/creditcardcharge")
	public String showCreditcardcharge(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		if(req.getSession().getAttribute("creditcardinfo")==null){
			out.print("<script>alert('请先登录')</script>");
			out.print("<script>window.location.href='creditcardlogin'</script>");
			out.flush();
			out.close();
			return null;
		}else
			return "creditcardcharge";
	}
	
	@RequestMapping("/creditcardreg")
	public String showCreditcardreg(){
			return "creditcardreg";
	}
	
	@RequestMapping("/creditcardregaction")
	public void showcreditcardregaction(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		String uname=req.getParameter("username");
		String pwd=req.getParameter("pwd");
		String phone=req.getParameter("phone");
		if(IsNumTool.checkString(pwd)==false){
			System.out.println("!!!!!!!!!!!!!!!!!");
			out.print("<script>alert('密码要纯数字')</script>");
			out.print("<script>window.location.href='creditcardreg'</script>");
			out.flush();
			out.close();
		}else{
		if(uname!=null&&uname.trim()!=""&&pwd.trim()!=""&&pwd!=null){
			int password=Integer.parseInt(pwd);
//			String username=(String) uname;
			Creditcard creditcard=new Creditcard();
			creditcard.setPwd(password);
			creditcard.setUsername(uname);
			creditcard.setCardnum(SetIdByTime.setIdByTimeStampAndRandom());
			creditcard.setPhone(phone);
			creditcard.setGold(0);
			creditcardService.addCreditcard(creditcard);
			out.print("<script>alert('注册成功,请点击确定前往登陆,请记住您的卡号为："+creditcard.getCardnum()+"')</script>");
	        out.print("<script>window.location.href='creditcardlogin'</script>");
	        out.flush();
	        out.close();
		}else{
		out.print("<script>alert('操作错误')</script>");
		out.print("<script>window.location.href='creditcardreg'</script>");
		out.flush();
		out.close();
		}}
	}
	
	//扣钱、充值
	@RequestMapping("/creditcardchargeaction")
	public String creditcardcharge(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		String gold=req.getParameter("gold");
		if(IsNumTool.checkString(gold)==false){
			out.print("<script>alert('金额要纯数字')</script>");
			out.print("<script>window.location.href='creditcardcharge'</script>");
			out.flush();
			out.close();
		}else{
		
		Creditcard creditcard=(Creditcard)req.getSession().getAttribute("creditcardinfo");
		creditcardService.upCreditcardGold(creditcard, Double.parseDouble(gold));
		}
		return "creditcardcharge";
	}
	
	@RequestMapping("/creditcardloginaction")
	public String showCreditcardLoginAction(HttpServletRequest req ,HttpServletResponse resp,Creditcard creditcard,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		Creditcard tmp=creditcardService.getCreditcardByCardnum(creditcard);
		if(tmp==null){
			out.print("<script>alert('账号或密码出错，请重新尝试')</script>");
			out.print("<script>window.location.href='creditcardlogin'</script>");
			out.flush();
			out.close();
			return null;
		}else{
			System.out.println(tmp.getGold());
			req.getSession().setAttribute("creditcardinfo", tmp);
			return "redirect:creditcardindex";
		}
	}
	
	//首页,检查有没登陆，没登陆跳回
	@RequestMapping("/creditcardinfo")
	public String showCreditcardindex(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		if(req.getSession().getAttribute("creditcardinfo")==null){
			out.print("<script>alert('请先登录')</script>");
			out.print("<script>window.location.href='creditcardlogin'</script>");
			out.flush();
			out.close();
			return null;
		}else
		return "creditcardinfo";
	}
	
	//del,注销卡
	@RequestMapping("/delcreditcard")
	public String delcreditcard(HttpServletRequest req,Creditcard creditcard){
		creditcardService.delCreditcard(creditcard);
		req.getSession().removeAttribute("creditcardinfo");
		//map.addAttribute("allAblum", ablumService.getAllAblum());
			return "creditcardlogin";
	}
	
	//注销,退出账号
		@RequestMapping("/outCreditcardLogin")
		public String outcreditcard(HttpServletRequest req){
			req.getSession().removeAttribute("creditcardinfo");
				return "redirect:creditcardlogin";
		}
}
