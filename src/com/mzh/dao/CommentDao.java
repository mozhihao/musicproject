package com.mzh.dao;

import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Comment;

@Component
public class CommentDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//增加评论
	public void addComment(Comment c){
		hibernateTemplate.save(c);
		hibernateTemplate.clear();
	}
	
	//所有评论
	public List<Comment> getAllComment() { 
		List<Comment> comment=this.hibernateTemplate.find("from Comment");
		hibernateTemplate.clear();
		return comment;
}	
	//用id获评论
	public List<Comment> getListByid(int id){
		List<Comment> list=this.hibernateTemplate.find("from Comment where comment_id = ? ",id);
		hibernateTemplate.clear();
		return list; 
	}
	
	//用Ablumid获评论
	public List<Comment> getListByAblumid(int id){
		List<Comment> list=this.hibernateTemplate.find("from Comment where ablum_id = ? ",id);
		hibernateTemplate.clear();
		return list; 
	}
	
	//update更新
	public void upComment(Comment c) { 
		this.hibernateTemplate.update(c);  
		hibernateTemplate.clear();
}
	//删除del
	public void delComment(Comment c) { 
		this.hibernateTemplate.delete(c);  
		hibernateTemplate.clear();
}	
	//获取总评论数
	public String getCommentNum() { 
		SessionFactory sf=hibernateTemplate.getSessionFactory();
		Session session=sf.openSession();
		String sql="SELECT COUNT(*) from comment ;";
//		List res = new Arr/ayList();
		List res = session.createSQLQuery(sql).list();
		session.close();
		sf.close();
		hibernateTemplate.clear();
		return  res.get(0)+"";
}	
	//判断是否已经评论
	public List boolcomment(String ablum_name,String user_name) {
		System.out.println("aname:"+ablum_name+"!!!!!uname:"+user_name);
		List<Comment> list=this.hibernateTemplate.find("from Comment where ablum_name = ?  and user_name = ? ",new String[]{ablum_name,user_name});
		hibernateTemplate.clear();
		return list;
	}
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
