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
			out.print("<script>alert('���ȵ�¼')</script>");
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
			out.print("<script>alert('���ȵ�¼')</script>");
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
			out.print("<script>alert('���ȵ�¼')</script>");
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
			out.print("<script>alert('����Ҫ������')</script>");
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
			out.print("<script>alert('ע��ɹ�,����ȷ��ǰ����½,���ס���Ŀ���Ϊ��"+creditcard.getCardnum()+"')</script>");
	        out.print("<script>window.location.href='creditcardlogin'</script>");
	        out.flush();
	        out.close();
		}else{
		out.print("<script>alert('��������')</script>");
		out.print("<script>window.location.href='creditcardreg'</script>");
		out.flush();
		out.close();
		}}
	}
	
	//��Ǯ����ֵ
	@RequestMapping("/creditcardchargeaction")
	public String creditcardcharge(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		String gold=req.getParameter("gold");
		if(IsNumTool.checkString(gold)==false){
			out.print("<script>alert('���Ҫ������')</script>");
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
			out.print("<script>alert('�˺Ż�������������³���')</script>");
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
	
	//��ҳ,�����û��½��û��½����
	@RequestMapping("/creditcardinfo")
	public String showCreditcardindex(HttpServletRequest req ,HttpServletResponse resp,ModelMap map) throws IOException{
		resp.setCharacterEncoding("gbk");
		req.setCharacterEncoding("gbk");
		PrintWriter out = resp.getWriter();
		if(req.getSession().getAttribute("creditcardinfo")==null){
			out.print("<script>alert('���ȵ�¼')</script>");
			out.print("<script>window.location.href='creditcardlogin'</script>");
			out.flush();
			out.close();
			return null;
		}else
		return "creditcardinfo";
	}
	
	//del,ע����
	@RequestMapping("/delcreditcard")
	public String delcreditcard(HttpServletRequest req,Creditcard creditcard){
		creditcardService.delCreditcard(creditcard);
		req.getSession().removeAttribute("creditcardinfo");
		//map.addAttribute("allAblum", ablumService.getAllAblum());
			return "creditcardlogin";
	}
	
	//ע��,�˳��˺�
		@RequestMapping("/outCreditcardLogin")
		public String outcreditcard(HttpServletRequest req){
			req.getSession().removeAttribute("creditcardinfo");
				return "redirect:creditcardlogin";
		}
}
