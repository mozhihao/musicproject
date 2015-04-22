package com.mzh.dao;

import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Ablum;
import com.mzh.po.Buyrecord;

@Component
public class BuyrecordDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	  public void saveRecord(Buyrecord buyrecord) {  
		  this.hibernateTemplate.save(buyrecord);  
		  hibernateTemplate.clear();
	  }
	//ËùÓÐ×¨¼­
	public List getRecordByUserId(int userId) {
		return this.hibernateTemplate.find("from Buyrecord where userid = ?  order by date desc",userId);
	}
	
	public List getRecordByUserIdState(int userId) {
		return this.hibernateTemplate.find("from Buyrecord where userid = ? and state = 1 order by date desc",userId);
	}
	
	public List getRecordByUserIdState0(int userId) {
		return this.hibernateTemplate.find("from Buyrecord where userid = ? and state = 0 order by date desc",userId);
	}
	
	public void delRecord(Buyrecord buyrecord){
		 this.hibernateTemplate.delete(buyrecord);
	}
	
	  public void upRecord(Buyrecord buyrecord) {  
		  this.hibernateTemplate.update(buyrecord);  
		  hibernateTemplate.clear();
	  }
	
	public List getRecordById(int brid) { 
		return this.hibernateTemplate.find("from Buyrecord where brid = ? ",brid);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
