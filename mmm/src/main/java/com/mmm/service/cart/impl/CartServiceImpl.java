package com.mmm.service.cart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.cart.CartDao;
import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;

@Service("cartServiceImpl")
public class CartServiceImpl implements CartService {
	
	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDao cartDao;
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	
	public CartServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addCart(Cart cart) throws Exception {
		cartDao.addCart(cart);
	}



	@Override
	public Map<String, Object> getCartList(Cart cart) throws Exception {
		List<Cart> list = cartDao.getCartList(cart);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list",list);
		
		return map;
	}


	@Override
	public void updateCart(Cart cart) throws Exception {
		cartDao.updateCart(cart);
	}


	@Override
	public void deleteCart(Cart cart) throws Exception {
		cartDao.deleteCart(cart);
	}
	
	
//	@Override
//	public void getProdNo(int cartNo) throws Exception {
//		cartDao.getProdNo(cartNo);
//	}
	
}
