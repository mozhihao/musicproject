package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.UserDao;
import com.mzh.po.User;

@Component
public class UserService {
	@Resource
	private UserDao userDao;
	
	public void add(User user){
		System.out.println("UserService.add()");
		userDao.add(user);
	}
	
	public User getUserbyId(int id) { 
		return userDao.getUserbyId(id);
	}
	
	public boolean login(User u){
		int id=userDao.getUser(u).getId();
		if (id==0)
			{
			return false;
			}
		else
			return true;
	}
	
	public User getUserByName(User u){
		return userDao.getUser(u);
	}
	//统计用户数量
	public String getUserNum(){
		return userDao.getUserNum();
	}
	
	public void upUser(User user) { 
		userDao.upUser(user);
	}
	
	public List showAllUser(){
		return userDao.getAllUser();
	}
	
	public void delUser(User user) { 
		userDao.delUser(user);
	}
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
}
