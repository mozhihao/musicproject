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
	//增加新闻
	public void addNews(News n){
		System.out.println("Newsdao.add()"+"加一个新闻标题为:"+n.getNews_title());
		hibernateTemplate.save(n);
		hibernateTemplate.clear();
	}
	
	//所有新闻
	public List getAllNews() { 
		System.out.println("UserDao.getAllNews()");
		List news=this.hibernateTemplate.find("from News order by time desc");
		hibernateTemplate.clear();
		return news;
}	
	//用id获取新闻
	public News getNewsByid(int id){
		News news=(News)this.hibernateTemplate.get(News.class, id); 
		hibernateTemplate.clear();
		return news;
	}
	
	//update更新
	public void upNews(News news) { 
		System.out.println("UserDao.upNews()");
		this.hibernateTemplate.update(news);  
		hibernateTemplate.clear();
}
	//删除del
	public void delNews(News news) { 
		System.out.println("UserDao.delNews()");
		this.hibernateTemplate.delete(news);  
		hibernateTemplate.clear();
}	
	//统计新闻数量
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
