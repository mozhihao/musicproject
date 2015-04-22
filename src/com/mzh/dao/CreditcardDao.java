package com.mzh.dao;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Ablum;
import com.mzh.po.Creditcard;
import com.mzh.po.Music;
import com.mzh.po.User;

@Component
public class CreditcardDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//add银行卡，暂时不用
	public void addCreditcard(Creditcard cc){
		hibernateTemplate.save(cc);
		hibernateTemplate.clear();
	}
	
	//登陆用
	public Creditcard getCreditcardByCardnum(Creditcard cc) { 
			List<Creditcard> list=this.hibernateTemplate.find(" from Creditcard where cardnum=? and pwd=?" , new Object[]{cc.getCardnum(),cc.getPwd()});
			hibernateTemplate.clear();
			if(list.size()<1){
				return null;
			}
			return list.get(0);
	}	
		
	//前台注册用
	public Creditcard getCreditcardByCardnumForReg(String Cardnum) { 
			List<Creditcard> list=this.hibernateTemplate.find(" from Creditcard where cardnum=? " , Cardnum);
			hibernateTemplate.clear();
			if(list.size()<1){
				return null;
			}
			return list.get(0);
	}
	
	//remove银行卡
	public void delCreditcard(Creditcard cc) { 
		this.hibernateTemplate.delete(cc);  
		hibernateTemplate.clear();
}
	//扣钱、充值、更改密码时用
	public void upCreditcard(Creditcard cc) { 
		this.hibernateTemplate.update(cc);  
		hibernateTemplate.clear();
}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
