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
	//注册用户
	public void add(User u){
		System.out.println("UserDao.add()"+"user名:"+u.getUname());
		hibernateTemplate.save(u);
	}
	
	//单条用户查询、搜索用
	public User getUserById(int id) { 
			 System.out.println("找id为"+id+"的家伙");
			    return (User)this.hibernateTemplate.get(User.class, id);  
	}  
	
	//登陆用
	public User getUser(User user) { 
		System.out.println("UserDao.getuser()");
		List<User> list=this.hibernateTemplate.find(" from User where uname=? and pwd=?" , new String[]{user.getUname(),user.getPwd()});
		for(User tmp:list){
			user.setId(tmp.getId());
		}
		return user;
}	
	
	//User的个人详细信息获取
	public User getUserbyId(int id) { 
		return (User)this.hibernateTemplate.get(User.class, id);  
	}
	
	//所有人
	public List getAllUser() { 
		System.out.println("UserDao.getAllUser()");
		return this.hibernateTemplate.find("from User");
}	
	//统计用户数量
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
	//删除del
	public void delUser(User user) { 
		System.out.println("UserDao.delUser()");
		this.hibernateTemplate.delete(user);  
}
	//update更新
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
