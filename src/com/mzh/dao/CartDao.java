package com.mzh.dao;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Cart;
import com.mzh.po.User;

@Component
public class CartDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//�������ﳵ
	public void createCart(Cart c){
		//ע���ʱ�򴴽�
		hibernateTemplate.save(c);
		hibernateTemplate.clear();
	}
	
	public int getCartIdByUserId(int userId){
		Cart c=new Cart();
		List<Cart> list=this.hibernateTemplate.find(" from Cart where userId=? ",userId );
		hibernateTemplate.clear();
		return list.get(0).getCartId();
	}
	
	//���й��ﳵ(dba����)
	public List getAllCart() { 
		System.out.println("CartDao.getAllCart()");
		List cart=this.hibernateTemplate.find("from Cart");
		hibernateTemplate.clear();
		return cart;
	}	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
