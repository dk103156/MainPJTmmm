package com.mmm.service.cart;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Cart;

public interface CartService {
	
	
	public void addCart(Cart cart) throws Exception;
	
	
	public Map<String, Object> getCartList(Cart cart) throws Exception;
	
	
	//장바구니에서 구매할경우 cartStatus 0에서 1로 바꾸고 장바구니목록에서 삭제
	public void updateCart(Cart cart) throws Exception;
		
	//사용자가 삭제 하는것
	public void deleteCart(Cart cart) throws Exception;
		
		
	//public Cart getProdNo(int cartNo) throws Exception;
		
		
	
	
	
	
	
	
	
	
	
}
