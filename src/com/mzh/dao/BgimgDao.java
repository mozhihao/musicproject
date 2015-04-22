package com.mzh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.User;

@Component
public class BgimgDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	//Ëæ»ú»ñÈ¡
		public String getBgImg(){
			SessionFactory sf=hibernateTemplate.getSessionFactory();
			Session session=sf.openSession();
			String sql="SELECT bgurl FROM bgimg ORDER BY rand() LIMIT 1;";
//			List res = new Arr/ayList();
			List res = session.createSQLQuery(sql).list();
			session.close();
			sf.close();
			return  (String)res.get(0);
		}
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
