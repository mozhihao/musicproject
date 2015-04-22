package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.CartDao;
import com.mzh.po.Cart;

@Component
public class CartService {
	@Resource
	private CartDao cartDao;

	public void createCart(Cart cart){
		cartDao.createCart(cart);
	}
	
	public List getAllCart(){
		return cartDao.getAllCart();
	}

	public int getCartIdByUserId(int userId){
		return cartDao.getCartIdByUserId(userId);
	}
	
	public CartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
}
