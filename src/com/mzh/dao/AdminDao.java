package com.mzh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Admin;
import com.mzh.po.User;

@Component
public class AdminDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//ע���û�
	public void add(Admin r){
		hibernateTemplate.save(r);
		hibernateTemplate.clear();
	}
	
	//��½��
	public Admin getUser(Admin r) { 
		System.out.println("����:"+r.getAdminname());
		System.out.println("����:"+r.getPwd());
		List<Admin> list=this.hibernateTemplate.find(" from Admin where adminname=? and pwd=?" , new String[]{r.getAdminname(),r.getPwd()});
		hibernateTemplate.clear();
		if(list.size()>0){
		return list.get(0);
		}
		else 
			return null;
	}	
	
	//Root�ĸ�����ϸ��Ϣ��ȡ
	public Admin getUserbyId(int id) {
		Admin admin=(Admin)this.hibernateTemplate.get(Admin.class, id);
		hibernateTemplate.clear();
		return admin;  
	}
	
	//update����
	public void upAdmin(Admin Admin) { 
		this.hibernateTemplate.update(Admin);  
		hibernateTemplate.clear();
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
