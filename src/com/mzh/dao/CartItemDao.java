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
	/**添加物品到购物车*/
	public void addCartItem(CartItem ci){
		hibernateTemplate.save(ci);
		hibernateTemplate.clear();
	}
	/**单条物品模糊查询*/
	public List getCartItemByName(String CartItem) { 
			System.out.println("找CartItem为"+CartItem+"的购物品");
			List list=this.hibernateTemplate.find("from CartItem where music_name like ? ",CartItem);
			System.out.println(list+"!!");
			hibernateTemplate.clear();
			return list;
		}  
	/**所有购物车内的物品*/
	public List getAllCartItem() { 
		System.out.println("CartItemDao.getAllCart()");
		return this.hibernateTemplate.find("from CartItem");
	}	
	
	/**查看购物车内的物品*/
	public List getCartItemByCartId(int CartId) {
		return this.hibernateTemplate.find("from CartItem where cartId=?",CartId);
		
	}
	
	//获取购物车中有多少件商品
	public int GetItemsCount(int cartId){
		String hql="select count(*) from Cart where cartId=?";
		Integer count = (Integer)this.hibernateTemplate.find(hql,cartId).listIterator().next();
		hibernateTemplate.clear();
		return count.intValue();
	}
	
	//id获取购物车某物品
	public List getCartItemByCartItemId(int CartItemId) {
		return this.hibernateTemplate.find("from CartItem where cartItemId=?",CartItemId);
		
	}
	
	//
	public void delCartItembycartItemId(CartItem cartItem) { 
		System.out.println("CartItemDao.delCartItem()");
		this.hibernateTemplate.delete(cartItem);
		hibernateTemplate.clear();
}	
	//清除某id中购物车的所有物品
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
