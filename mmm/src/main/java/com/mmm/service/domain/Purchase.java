package com.mmm.service.domain;

import java.sql.Timestamp;
import java.util.List;


public class Purchase {
	
	private int purchaseNo;				// 구매관리번호
	private int purchaseUser;			// 회원 참조
	private Product purchaseProd;		// 고른 상품
//	private Product listProd;			// 상품 리스트
	private int purchaseStatus;			// 0:구매완료 , 1:구매취소,2:선물완료,4:선물취소
	private int purchasePrice;			// 구매 가격
	private Timestamp purchaseDate;		// 구매 일시
	private String rcPhone;				// 받는사람 휴대전화번호
	private String rcName;				// 받는사람 이름
	private String message;				// 선물 메세지
	private int purchaseQuantity;
	
	
	
	public Purchase() {
	}



	public int getPurchaseNo() {
		return purchaseNo;
	}



	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}



	public int getPurchaseUser() {
		return purchaseUser;
	}



	public void setPurchaseUser(int purchaseUser) {
		this.purchaseUser = purchaseUser;
	}



	public Product getPurchaseProd() {
		return purchaseProd;
	}



	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}



	public int getPurchaseStatus() {
		return purchaseStatus;
	}



	public void setPurchaseStatus(int purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}



	public int getPurchasePrice() {
		return purchasePrice;
	}



	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}



	public Timestamp getPurchaseDate() {
		return purchaseDate;
	}



	public void setPurchaseDate(Timestamp purchaseDate) {
		this.purchaseDate = purchaseDate;
	}



	public String getRcPhone() {
		return rcPhone;
	}



	public void setRcPhone(String rcPhone) {
		this.rcPhone = rcPhone;
	}



	public String getRcName() {
		return rcName;
	}



	public void setRcName(String rcName) {
		this.rcName = rcName;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}



	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}



	@Override
	public String toString() {
		return "Purchase [purchaseNo=" + purchaseNo + ", purchaseUser=" + purchaseUser + ", purchaseProd="
				+ purchaseProd + ", purchaseStatus=" + purchaseStatus + ", purchasePrice=" + purchasePrice
				+ ", purchaseDate=" + purchaseDate + ", rcPhone=" + rcPhone + ", rcName=" + rcName + ", message="
				+ message + ", purchaseQuantity=" + purchaseQuantity + "]";
	}


		
	
}
