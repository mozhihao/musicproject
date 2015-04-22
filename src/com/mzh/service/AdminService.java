package com.mzh.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.AdminDao;
import com.mzh.po.Admin;

@Component
public class AdminService {
	@Resource
	private AdminDao adminDao;
	
	//×¢²áRoot
	public void add(Admin r){
			adminDao.add(r);
	}
	
	public Admin getUserByPwd(Admin a) { 
		return adminDao. getUser(a);
	}
	
	public boolean login(Admin a){
		if( adminDao.getUser(a)==null){
			return false;
		}
		else
			return true;
	}
	
	public Admin getUserbyId(int id) { 
		return adminDao.getUserbyId(id);
	}
	
	public void upAdmin(Admin Admin) { 
		adminDao.upAdmin(Admin);
	}

	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	
}
