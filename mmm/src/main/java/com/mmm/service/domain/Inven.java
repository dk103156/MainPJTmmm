package com.mmm.service.domain;

import java.sql.Timestamp;

public class Inven {
	
	private int  invenNo;									//보관함관리번호
	private String prodPinNo;							// 상품발행번호(PIN 번호)
	private int issuedProdUser;						// 회원참조
	private String ownerId;								// 소유자 아이디
	private int prodStatus;								// 0:구매  , 1:선물
	private Timestamp issuedDate;				// 생성일자
	private Timestamp usedDate;					// 사용일자
	private String senderId;								// 보낸사람 아이디
	private int usedStatus;								// 0:미사용, 1:사용
	private Purchase issuedProdPurchase;	// 구매 참조
	private Product product;							// 상품참조
	private int invenPrice;									// 가격
	
	
	public Inven() {
	}

	
	public int getInvenNo() {
		return invenNo;
	}




	public void setInvenNo(int invenNo) {
		this.invenNo = invenNo;
	}




	public String getProdPinNo() {
		return prodPinNo;
	}


	public void setProdPinNo(String prodPinNo) {
		this.prodPinNo = prodPinNo;
	}


	public int getIssuedProdUser() {
		return issuedProdUser;
	}


	public void setIssuedProdUser(int issuedProdUser) {
		this.issuedProdUser = issuedProdUser;
	}


	public String getOwnerId() {
		return ownerId;
	}


	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}


	public int getProdStatus() {
		return prodStatus;
	}


	public void setProdStatus(int prodStatus) {
		this.prodStatus = prodStatus;
	}


	public Timestamp getIssuedDate() {
		return issuedDate;
	}


	public void setIssuedDate(Timestamp issuedDate) {
		this.issuedDate = issuedDate;
	}


	public Timestamp getUsedDate() {
		return usedDate;
	}


	public void setUsedDate(Timestamp usedDate) {
		this.usedDate = usedDate;
	}


	public String getSenderId() {
		return senderId;
	}


	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}


	public int getUsedStatus() {
		return usedStatus;
	}


	public void setUsedStatus(int usedStatus) {
		this.usedStatus = usedStatus;
	}


	public Purchase getIssuedProdPurchase() {
		return issuedProdPurchase;
	}


	public void setIssuedProdPurchase(Purchase issuedProdPurchase) {
		this.issuedProdPurchase = issuedProdPurchase;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public int getInvenPrice() {
		return invenPrice;
	}


	public void setInvenPrice(int invenPrice) {
		this.invenPrice = invenPrice;
	}


	@Override
	public String toString() {
		return "Inven [invenNo=" + invenNo + ", prodPinNo=" + prodPinNo + ", issuedProdUser=" + issuedProdUser
				+ ", ownerId=" + ownerId + ", prodStatus=" + prodStatus + ", issuedDate=" + issuedDate + ", usedDate="
				+ usedDate + ", senderId=" + senderId + ", usedStatus=" + usedStatus + ", issuedProdPurchase="
				+ issuedProdPurchase + ", product=" + product + ", invenPrice=" + invenPrice + "]";
	}


	

	
}
