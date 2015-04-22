package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.AblumDao;
import com.mzh.dao.CommentDao;
import com.mzh.po.Ablum;
import com.mzh.po.Comment;

@Component
public class CommentService {
	@Resource
	private CommentDao commentDao;

	public void addComment(Comment c){
		commentDao.addComment(c);
	}
	
	public List<Comment> getAllComment() { 
		return commentDao.getAllComment();
	}
	
	public List<Comment> getListByid(int id){
		return commentDao.getListByid(id);
	}

	public void upComment(Comment c) { 
		 commentDao.upComment(c);
	}
	public void delComment(Comment c) { 
		commentDao.delComment(c);
	}
	
	public List<Comment> getListByAblumid(int id){
		return commentDao.getListByAblumid(id);
	}
	//��ȡ��������
	public String getCommentNum() { 
		return commentDao.getCommentNum();
	}
	//�ж��Ƿ��Ѿ�����
	public boolean boolcomment(String ablum_name,String user_name) {
		if (commentDao.boolcomment(ablum_name, user_name).size()>0){
			System.out.println("����Ϊ"+commentDao.boolcomment(ablum_name, user_name).size());
			return true; 
		}
		else {
			System.out.println("����Ϊ"+commentDao.boolcomment(ablum_name, user_name).size());
			return false;
	}
	}
	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	
	
}
