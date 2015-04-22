package com.mzh.dao;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Ablum;

@Component
public class AblumDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//���Ablum
	public void addAblum(Ablum a){
		System.out.println("DAO��"+a.getAlbumPic());
		hibernateTemplate.save(a);
		hibernateTemplate.clear();
	}
	
	public List getAblumByHot(){
		List list=this.hibernateTemplate.find("from Ablum where hot=1");
		System.out.println("CartDao.getAblumByHot()");
		return list;
	}
	
	//����ר��
	public List getAllAblum() { 
		System.out.println("CartDao.getAllAblum()");
		hibernateTemplate.clear();
		return this.hibernateTemplate.find("from Ablum");
	}
	//ר��ģ����ѯ
	public List getAblumByName(String albumName) { 
		System.out.println("��Ablum_nameΪ"+albumName+"��ר��");
		List list=this.hibernateTemplate.find("from Ablum where albumName like  ? 	 ","%"+albumName+"%");
		hibernateTemplate.clear();
		System.out.println(list+"!!");
		return list;
	}
	//getAblumById
	public Ablum getAblumById(int id) {
		Ablum ablum=(Ablum)this.hibernateTemplate.get(Ablum.class,id);
		hibernateTemplate.clear();
		return ablum;
	}
	
	//����������������ǰ10ר��
	public List<Ablum> getAblumBydownloadNum() { 
		List<Ablum> list=this.hibernateTemplate.find("from Ablum  order by downloadNum DESC limit 0,10");
		hibernateTemplate.clear();
		return list;
	}
	
	
	//ͳ��ר����
	public String getAblumNum(){
		SessionFactory sf=hibernateTemplate.getSessionFactory();
		Session session=sf.openSession();
		String sql="SELECT COUNT(*) from ablum ;";
//		List res = new Arr/ayList();
		List res = session.createSQLQuery(sql).list();
		session.close();
		sf.close();
		return  res.get(0)+"";
	}
	
	//��̨������ֹ���ר��
	public List getAllCommentAblum(){
		SessionFactory sf=hibernateTemplate.getSessionFactory();
		Session session=sf.openSession();
		String sql="select a.albumName ,a.ablumPrice,a.albumAuthor,a.albumId," +
				"(SELECT COUNT(*) from comment c where a.albumId=c.ablum_id) as comment " +
				"from ablum a;";
		List res = new ArrayList();
		res = session.createSQLQuery(sql).list();
		session.close();
		return res;
	}
	
	//��̨�������ֹ���ר��
	public List getAllCommentAblumbyKey(String key){
		SessionFactory sf=hibernateTemplate.getSessionFactory();
		Session session=sf.openSession();
		String sql="select a.albumName ,a.ablumPrice,a.albumAuthor,a.albumId," +
				"(SELECT COUNT(*) from comment c where a.albumId=c.ablum_id) as comment " +
				"from ablum a where a.albumName like ? ;";
		SQLQuery query  = session.createSQLQuery(sql);
		query .setParameter(0, "%"+key+"%");
		List res=query.list();
//		List res = new ArrayList();
//		res.add(key);
//		res.add("%"+key+"%");
//		res = session.createSQLQuery(sql).list();
		session.close();
		return res;
	}
		
	
	//update����
		public void upAblum(Ablum ablum) { 
			System.out.println("UserDao.upAblum()");
			this.hibernateTemplate.update(ablum);  
			hibernateTemplate.clear();
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
