package com.mmm.service.domain;

import java.sql.Timestamp;

public class Cart {

		private int 		cartNo;					// 장바구니 관리번호
		private int		cartUser;				// 회원 참조
		private int 		quantity;				// 장바구니 수량
		private Timestamp 	cartDate;				// 카트 등록 날짜
		private int 		cartStatus;				// 장바구니에서 구매하면  삭제 되는 flag 0:장바구니 , 1:구매완료
		private Product 	product;				// 상품 참조
		
		
		
		public Cart() {
		}



		public int getCartNo() {
			return cartNo;
		}



		public void setCartNo(int cartNo) {
			this.cartNo = cartNo;
		}



		public int getCartUser() {
			return cartUser;
		}



		public void setCartUser(int cartUser) {
			this.cartUser = cartUser;
		}



		public int getQuantity() {
			return quantity;
		}



		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}



		public Timestamp getCartDate() {
			return cartDate;
		}



		public void setCartDate(Timestamp cartDate) {
			this.cartDate = cartDate;
		}



		public int getCartStatus() {
			return cartStatus;
		}



		public void setCartStatus(int cartStatus) {
			this.cartStatus = cartStatus;
		}



		public Product getProduct() {
			return product;
		}



		public void setProduct(Product product) {
			this.product = product;
		}



		@Override
		public String toString() {
			return "Cart [cartNo=" + cartNo + ", cartUser=" + cartUser + ", quantity=" + quantity + ", cartDate="
					+ cartDate + ", cartStatus=" + cartStatus + ", product=" + product + "]";
		}
	
		
		
}
