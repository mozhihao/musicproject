package com.mzh.dao;

import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.mzh.po.News;

@Component
public class NewsDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//��������
	public void addNews(News n){
		System.out.println("Newsdao.add()"+"��һ�����ű���Ϊ:"+n.getNews_title());
		hibernateTemplate.save(n);
		hibernateTemplate.clear();
	}
	
	//��������
	public List getAllNews() { 
		System.out.println("UserDao.getAllNews()");
		List news=this.hibernateTemplate.find("from News order by time desc");
		hibernateTemplate.clear();
		return news;
}	
	//��id��ȡ����
	public News getNewsByid(int id){
		News news=(News)this.hibernateTemplate.get(News.class, id); 
		hibernateTemplate.clear();
		return news;
	}
	
	//update����
	public void upNews(News news) { 
		System.out.println("UserDao.upNews()");
		this.hibernateTemplate.update(news);  
		hibernateTemplate.clear();
}
	//ɾ��del
	public void delNews(News news) { 
		System.out.println("UserDao.delNews()");
		this.hibernateTemplate.delete(news);  
		hibernateTemplate.clear();
}	
	//ͳ����������
	public String getNewsNum(){
		SessionFactory sf=hibernateTemplate.getSessionFactory();
		Session session=sf.openSession();
		String sql="SELECT COUNT(*) from news ;";
//		List res = new Arr/ayList();
		List res = session.createSQLQuery(sql).list();
		session.close();
		sf.close();
		return  res.get(0)+"";
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
