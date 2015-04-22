package com.mzh.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;

import com.mzh.dao.CreditcardDao;
import com.mzh.po.Creditcard;

@Component
public class CreditcardService {
	@Resource
	private CreditcardDao creditcardDao;

	public void addCreditcard(Creditcard cc){
		creditcardDao.addCreditcard(cc);
	}
	
	public void delCreditcard(Creditcard cc) { 
		creditcardDao.delCreditcard(cc);
	}
	
	public Creditcard getCreditcardByCardnumForReg(String Cardnum) { 
		 return creditcardDao.getCreditcardByCardnumForReg(Cardnum);
	}
	
	public void upCreditcardGold(Creditcard cc,double gold) { 
		cc.setGold(cc.getGold()+gold);
		creditcardDao.upCreditcard(cc);
	}
	
	public void upCreditcardPwd(Creditcard cc,int pwd) { 
		cc.setPwd(pwd);
		creditcardDao.upCreditcard(cc);
	}
	
	/**登陆用,扣钱验证用*/
	public Creditcard getCreditcardByCardnum(Creditcard cc) { 
		Creditcard tmp=creditcardDao.getCreditcardByCardnum(cc);
		if(tmp==null){
			return null;
		}else
			return tmp;
	}
	
}
