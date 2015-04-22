package com.mzh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.User;

@Component
public class UserDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//ע���û�
	public void add(User u){
		System.out.println("UserDao.add()"+"user��:"+u.getUname());
		hibernateTemplate.save(u);
	}
	
	//�����û���ѯ��������
	public User getUserById(int id) { 
			 System.out.println("��idΪ"+id+"�ļһ�");
			    return (User)this.hibernateTemplate.get(User.class, id);  
	}  
	
	//��½��
	public User getUser(User user) { 
		System.out.println("UserDao.getuser()");
		List<User> list=this.hibernateTemplate.find(" from User where uname=? and pwd=?" , new String[]{user.getUname(),user.getPwd()});
		for(User tmp:list){
			user.setId(tmp.getId());
		}
		return user;
}	
	
	//User�ĸ�����ϸ��Ϣ��ȡ
	public User getUserbyId(int id) { 
		return (User)this.hibernateTemplate.get(User.class, id);  
	}
	
	//������
	public List getAllUser() { 
		System.out.println("UserDao.getAllUser()");
		return this.hibernateTemplate.find("from User");
}	
	//ͳ���û�����
	public String getUserNum(){
		SessionFactory sf=hibernateTemplate.getSessionFactory();
		Session session=sf.openSession();
		String sql="SELECT COUNT(*) from user ;";
//		List res = new Arr/ayList();
		List res = session.createSQLQuery(sql).list();
		session.close();
		sf.close();
		return  res.get(0)+"";
	}
	//ɾ��del
	public void delUser(User user) { 
		System.out.println("UserDao.delUser()");
		this.hibernateTemplate.delete(user);  
}
	//update����
	public void upUser(User user) { 
		System.out.println("UserDao.upUser()");
		this.hibernateTemplate.update(user);  
}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
