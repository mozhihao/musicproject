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
	//add���п�����ʱ����
	public void addCreditcard(Creditcard cc){
		hibernateTemplate.save(cc);
		hibernateTemplate.clear();
	}
	
	//��½��
	public Creditcard getCreditcardByCardnum(Creditcard cc) { 
			List<Creditcard> list=this.hibernateTemplate.find(" from Creditcard where cardnum=? and pwd=?" , new Object[]{cc.getCardnum(),cc.getPwd()});
			hibernateTemplate.clear();
			if(list.size()<1){
				return null;
			}
			return list.get(0);
	}	
		
	//ǰ̨ע����
	public Creditcard getCreditcardByCardnumForReg(String Cardnum) { 
			List<Creditcard> list=this.hibernateTemplate.find(" from Creditcard where cardnum=? " , Cardnum);
			hibernateTemplate.clear();
			if(list.size()<1){
				return null;
			}
			return list.get(0);
	}
	
	//remove���п�
	public void delCreditcard(Creditcard cc) { 
		this.hibernateTemplate.delete(cc);  
		hibernateTemplate.clear();
}
	//��Ǯ����ֵ����������ʱ��
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
