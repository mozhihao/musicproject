package com.mzh.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mzh.po.Ablum;
import com.mzh.po.Buyrecord;
import com.mzh.po.CartItem;
import com.mzh.po.Creditcard;
import com.mzh.po.Music;
import com.mzh.po.User;
import com.mzh.service.AblumService;
import com.mzh.service.BuyrecordService;
import com.mzh.service.CartItemService;
import com.mzh.service.CartService;
import com.mzh.service.CreditcardService;
import com.mzh.service.MusicService;
import com.mzh.service.UserService;

@Controller
public class PayController {
	@Resource
	private AblumService ablumService;
	@Resource
	private MusicService musicService;
	@Resource
	private UserService userService;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private CreditcardService creditcardService;
	@Resource
	private BuyrecordService  buyrecordService;
	
	
	/**
	 *���̣��ж��Ƿ��ѹ����ж����࣬�ύ�������������ݿ⣬�����ж����룬�ж�������ɹ����������ݿ�״̬ 
	 * 
	 **/
	@RequestMapping("confirmationMessage")
	public String confirmationMessage(HttpServletRequest req,ModelMap map,HttpServletResponse resp) throws IOException{
		req.setCharacterEncoding("gbk");  
		resp.setCharacterEncoding("gbk");  
		PrintWriter out = resp.getWriter();
		Boolean isBuy=false;
		User u=(User)req.getSession().getAttribute("u");
		List<Buyrecord> list=buyrecordService.getRecordByUserId(u.getId());
		//����musicʱ
		if(req.getParameter("musicId")!=null){
			int musicid=Integer.parseInt(req.getParameter("musicId"));
			for(Buyrecord tmp:list){
				if(tmp.getMusicid()==musicid){
					isBuy=true;
					break;
				}
			}
			//����ѹ�������������ʷ
			if(isBuy==false){
				Music music=musicService.getMusicByid(musicid);
				map.put("music", music);
				return "confirmationMessage";
			}else{
				StringBuilder builder = new StringBuilder();  
                builder.append("<script type=\"text/javascript\">");  
                builder.append("alert('���������ڶ����У����ѹ��򣬵���˴��鿴');");  
                builder.append("window.top.location.href='");  
                builder.append("buyRecord");  
                builder.append("';");  
                builder.append("</script>");  
                out.print(builder.toString());  
                return null;
			}
		//����ablumʱ
		}else if(req.getParameter("albumId")!=null){
			int albumId=Integer.parseInt(req.getParameter("albumId"));
			for(Buyrecord tmp:list){
				if(tmp.getAblumid()==albumId){
					isBuy=true;
					break;
				}
			}
			if(isBuy==false){
			Ablum a=ablumService.getAblumById(Integer.parseInt(req.getParameter("albumId")));
			map.put("ablum",a);
			return "confirmationMessage";
			}else{
	             StringBuilder builder = new StringBuilder();  
                 builder.append("<script type=\"text/javascript\">");  
                 builder.append("alert('��ר�����ڶ����У������ѹ��򣬵���˴��鿴');");  
                 builder.append("window.top.location.href='");  
                 builder.append("buyRecord");  
                 builder.append("';");  
                 builder.append("</script>");  
				out.print(builder.toString());
				return null;
				}
		}else if(req.getParameter("albumId")==null&&req.getParameter("albumId")==null){
			String errMsg="<script type=\"text/javascript\">window.location.href='index';</script>";
			out.print(errMsg.toString());
			return null;
		}else
			return "index";
	}
	
	//���붩������
	@RequestMapping("pay")
	public String showPay(HttpServletRequest req,ModelMap map){
		User tmp=(User)req.getSession().getAttribute("u");
		User u=userService.getUserbyId(tmp.getId());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String date=formatter.format(new Date());
		if(req.getParameter("albumId")==null){//����
			System.out.println("����music");
			Music music=musicService.getMusicByid(Integer.parseInt(req.getParameter("musicId")));
			Buyrecord buyrecord=new Buyrecord();
			buyrecord.setMusicid(music.getMusicId());
			buyrecord.setPrice(music.getPrice());
			buyrecord.setUserid(u.getId());
			buyrecord.setDate(date);
			buyrecord.setMusicname(music.getMusic_name());
			buyrecordService.saveRecord(buyrecord);
			map.put("price",music.getPrice());
			map.put("music", music.getMusicId());
			map.put("br", buyrecord);
		}else{//ר��
			Ablum a=ablumService.getAblumById(Integer.parseInt(req.getParameter("albumId")));
			Buyrecord buyrecord=new Buyrecord();
			buyrecord.setAblumid(a.getAlbumId());
			buyrecord.setPrice(a.getAblumPrice());
			buyrecord.setUserid(u.getId());
			buyrecord.setDate(date);
			buyrecord.setAblumname(a.getAlbumName());
			buyrecord.setAblumpic(a.getAlbumPic());
			buyrecordService.saveRecord(buyrecord);
			map.put("price",a.getAblumPrice());
			map.put("album", a.getAlbumId());
			map.put("br", buyrecord);
		}
		return "pay";
	}

	@RequestMapping("pay_order")
	public String show_Pay_order(HttpServletRequest req,int brId,ModelMap map){
		Buyrecord buyrecord=buyrecordService.getRecordById(brId);
		map.put("br", buyrecord);
		return "pay_order";
	}
	
	@RequestMapping("pay_success")
	public String show_Pay_success(HttpServletRequest req,HttpServletResponse resp,ModelMap map,int pwd,int brid) throws IOException{
		req.setCharacterEncoding("gbk");  
		resp.setCharacterEncoding("gbk"); 
		PrintWriter out = resp.getWriter();
		Buyrecord br=buyrecordService.getRecordById(brid);
		User u=(User)req.getSession().getAttribute("u");
		Creditcard tmpc=new Creditcard();
		tmpc.setCardnum(u.getCreditcard());
		tmpc.setPwd(pwd);
		//�ж�����
		Creditcard cc=creditcardService.getCreditcardByCardnum(tmpc);
		if(cc==null){
			out.print("<script>alert('�������')</script>");
            out.print("<script>window.location.href='index'</script>");
            out.flush();
            out.close();
			return null;
		}else{
			//�ж��Ƿ����㹻�Ľ��
			if(cc.getGold()-br.getPrice()<0){
				out.print("<script>alert('���� ')</script>");
                out.print("<script>window.location.href='index'</script>");
                out.flush();
                out.close();
				return null;
			}else{//����
				creditcardService.upCreditcardGold(cc, 0-br.getPrice());
				br.setState(1);//��ʾ�Ѿ�����
				if(br.getAblumid()==0){//������+1
					Music tmpm=musicService.getMusicByid(br.getMusicid());
					Ablum tmpa=ablumService.getAblumById(tmpm.getAlbum_id());
					tmpa.setDownloadNum(tmpa.getDownloadNum()+1);
				}else{
					Ablum tmpa=ablumService.getAblumById(br.getAblumid());
					tmpa.setDownloadNum(tmpa.getDownloadNum()+1);
				}
				buyrecordService.upRecord(br);
				return "pay_success";
				}
			}	
		}
		
	//���ﳵ����
	@RequestMapping("pay_cart")
	public String show_Pay_Cart_success(HttpServletRequest req,ModelMap map,int pwd,double price){
		String CartItemId[]=(String[])req.getSession().getAttribute("CartItemId");
		User tmp=(User)req.getSession().getAttribute("u");//��ȡ�û�������Ϣ
		User u=userService.getUserbyId(tmp.getId());
		Creditcard tmpc=new Creditcard();//��ȡ���ÿ���Ϣ
		tmpc.setCardnum(u.getCreditcard());
		tmpc.setPwd(pwd);
		Creditcard cc=creditcardService.getCreditcardByCardnum(tmpc);//��֤����
		creditcardService.upCreditcardGold(cc, 0-price);//��Ǯ
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");//���ù�������
		String date=formatter.format(new Date());
		 //��ӵ�������ʷ
		for(String tmpId : CartItemId){
			int tmpid=Integer.parseInt(tmpId);//int
			System.out.println(tmpId.toString());
			CartItem ci=cartItemService.getCartItemByCartItemId(tmpid);
			Buyrecord buyrecord=new Buyrecord();
			buyrecord.setAblumid(ci.getAblumId());
			buyrecord.setPrice(price);
			buyrecord.setUserid(u.getId());
			buyrecord.setDate(date);
			buyrecord.setAblumname(ci.getProductName());
			buyrecord.setAblumpic(ci.getProductPic());
			buyrecord.setState(1);
			buyrecordService.saveRecord(buyrecord);
			//���ع�����+1
			Ablum tmpablum=ablumService.getAblumById(ci.getAblumId());
			tmpablum.setDownloadNum(tmpablum.getDownloadNum()+1);
			//ɾ�����ﳵ�еļ�¼
			cartItemService.delCartItem(ci);
		}
		
		req.getSession().removeAttribute("CartItemId");
		return "userindex";
	}
}
