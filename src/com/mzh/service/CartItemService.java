package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.CartItemDao;
import com.mzh.dao.MusicDao;
import com.mzh.po.CartItem;
import com.mzh.po.Music;

@Component
public class CartItemService {
	@Resource
	private CartItemDao cartItemDao;

	public void addCartItem(CartItem ci){
		cartItemDao.addCartItem(ci);
	}
	
	public List<CartItem> getCartItemByName(String CartItem) {
		return cartItemDao.getCartItemByName(CartItem);
	}
	
	public List<CartItem> getCartItemByCartId(int CartId) {
		return cartItemDao.getCartItemByCartId(CartId);
		
	}
	
	public CartItem getCartItemByCartItemId(int CartItemId) {
		return (CartItem)cartItemDao.getCartItemByCartItemId(CartItemId).get(0);
	}
	
	public List<CartItem> getAllCartItem() { 
		return cartItemDao.getAllCartItem();
	}

	public int GetItemsCount(CartItem ci){
		int id=ci.getCartId();
		return cartItemDao.GetItemsCount(id);
	}
	public void delCartItem(CartItem cartItem) { 
		cartItemDao.delCartItembycartItemId(cartItem);
	}
	public void claerAllCartItem(int cartId) { 
		cartItemDao.claerAllCartItem(cartId);
	}
}
