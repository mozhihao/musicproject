package com.mzh.dao;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.CartItem;

@Component
public class CartItemDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	/**�����Ʒ�����ﳵ*/
	public void addCartItem(CartItem ci){
		hibernateTemplate.save(ci);
		hibernateTemplate.clear();
	}
	/**������Ʒģ����ѯ*/
	public List getCartItemByName(String CartItem) { 
			System.out.println("��CartItemΪ"+CartItem+"�Ĺ���Ʒ");
			List list=this.hibernateTemplate.find("from CartItem where music_name like ? ",CartItem);
			System.out.println(list+"!!");
			hibernateTemplate.clear();
			return list;
		}  
	/**���й��ﳵ�ڵ���Ʒ*/
	public List getAllCartItem() { 
		System.out.println("CartItemDao.getAllCart()");
		return this.hibernateTemplate.find("from CartItem");
	}	
	
	/**�鿴���ﳵ�ڵ���Ʒ*/
	public List getCartItemByCartId(int CartId) {
		return this.hibernateTemplate.find("from CartItem where cartId=?",CartId);
		
	}
	
	//��ȡ���ﳵ���ж��ټ���Ʒ
	public int GetItemsCount(int cartId){
		String hql="select count(*) from Cart where cartId=?";
		Integer count = (Integer)this.hibernateTemplate.find(hql,cartId).listIterator().next();
		hibernateTemplate.clear();
		return count.intValue();
	}
	
	//id��ȡ���ﳵĳ��Ʒ
	public List getCartItemByCartItemId(int CartItemId) {
		return this.hibernateTemplate.find("from CartItem where cartItemId=?",CartItemId);
		
	}
	
	//
	public void delCartItembycartItemId(CartItem cartItem) { 
		System.out.println("CartItemDao.delCartItem()");
		this.hibernateTemplate.delete(cartItem);
		hibernateTemplate.clear();
}	
	//���ĳid�й��ﳵ��������Ʒ
	public void claerAllCartItem(int cartId) { 
		System.out.println("CartItemDao.claerAllCartItem()");
		this.hibernateTemplate.bulkUpdate("delete CartItem where cartId=?", cartId);  
		hibernateTemplate.clear();
	}	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
