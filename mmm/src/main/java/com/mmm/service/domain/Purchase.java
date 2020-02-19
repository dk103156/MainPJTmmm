package com.mmm.service.domain;

import java.sql.Timestamp;
import java.util.List;


public class Purchase {
	
	private int purchaseNo;						// 구매관리번호
	private int purchaseUserNo;					// 회원관리번호
	private String purchaseProductNo;				// 상품번호
	private String purchaseProductQuantity;		// 구매 갯수
	private int purchaseStatus;					// 0:구매, 1:선물
	private int purchasePrice;					// 구매 총 가격
	private Timestamp purchaseDate;				// 구매 일시
	private String receiverPhone;				// 받는사람 휴대전화번호
	private String receiverName;				// 받는사람 이름
	private String senderMessage;				// 선물 메세지
	
	public int getPurchaseNo() {
		return purchaseNo;
	}
	public int getPurchaseUserNo() {
		return purchaseUserNo;
	}
	public String getPurchaseProductNo() {
		return purchaseProductNo;
	}
	public String getPurchaseProductQuantity() {
		return purchaseProductQuantity;
	}
	public int getPurchaseStatus() {
		return purchaseStatus;
	}
	public int getPurchasePrice() {
		return purchasePrice;
	}
	public Timestamp getPurchaseDate() {
		return purchaseDate;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public String getSenderMessage() {
		return senderMessage;
	}
	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public void setPurchaseUserNo(int purchaseUserNo) {
		this.purchaseUserNo = purchaseUserNo;
	}
	public void setPurchaseProductNo(String purchaseProductNo) {
		this.purchaseProductNo = purchaseProductNo;
	}
	public void setPurchaseProductQuantity(String purchaseProductQuantity) {
		this.purchaseProductQuantity = purchaseProductQuantity;
	}
	public void setPurchaseStatus(int purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}
	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public void setPurchaseDate(Timestamp purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public void setSenderMessage(String senderMessage) {
		this.senderMessage = senderMessage;
	}
	
	@Override
	public String toString() {
		return "Purchase [purchaseNo=" + purchaseNo + ", purchaseUserNo=" + purchaseUserNo + ", purchaseProductNo="
				+ purchaseProductNo + ", purchaseProductQuantity=" + purchaseProductQuantity + ", purchaseStatus="
				+ purchaseStatus + ", purchasePrice=" + purchasePrice + ", purchaseDate=" + purchaseDate
				+ ", receiverPhone=" + receiverPhone + ", receiverName=" + receiverName + ", senderMessage="
				+ senderMessage + "]";
	}
	

	

	

	

	

	
	
	

		
	
}
