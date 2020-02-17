package com.mmm.service.domain;

import java.sql.Timestamp;
import java.util.List;


public class Purchase {
	
	private int purchaseNo;				// 구매관리번호
	private int purchaseUser;			// 구매 한사람 / 선물 보내는 사람
	private Product purchaseProd;		// 고른 상품
	private int purchaseStatus;			// 0:구매완료 , 1:구매취소,2:선물완료,4:선물취소
	private int purchasePrice;			// 구매 가격
	private String rcPhone;				// 받는사람 휴대전화번호
	private String rcName;				// 받는사람 이름
	private String message;				// 선물 메세지
	private int purchaseQuantity;		// 구매 갯수
	private Timestamp issuedDate;		// 생성일자
	private Timestamp usedDate;			// 사용일자
	private int ownerNo;				// 소유자 회원번호		-> 구매한 당사자 일수도 있고  / 선물 받는 사람일수도 있땅
	private int usedStatus;				// 0:미사용, 1:사용
	private String prodPinNo;			// 상품발행번호(PIN 번호)
	
//////////////////////////////////////////////////////////////////////////////////////////////////////	
//	private Timestamp purchaseDate;		// 구매 일시 -> 생성 일자떄문에 필요가 없어짐
//	private String senderId;			// 보낸사람 아이디 -> purchaseUser로 대체 가능해서 필요 없어짐
	 
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


	public int getOwnerNo() {
		return ownerNo;
	}


	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}


	public int getUsedStatus() {
		return usedStatus;
	}


	public void setUsedStatus(int usedStatus) {
		this.usedStatus = usedStatus;
	}


	public String getProdPinNo() {
		return prodPinNo;
	}


	public void setProdPinNo(String prodPinNo) {
		this.prodPinNo = prodPinNo;
	}


	@Override
	public String toString() {
		return "Purchase [purchaseNo=" + purchaseNo + ", purchaseUser=" + purchaseUser + ", purchaseProd="
				+ purchaseProd + ", purchaseStatus=" + purchaseStatus + ", purchasePrice=" + purchasePrice
				+ ", rcPhone=" + rcPhone + ", rcName=" + rcName + ", message=" + message + ", purchaseQuantity="
				+ purchaseQuantity + ", issuedDate=" + issuedDate + ", usedDate=" + usedDate + ", ownerNo=" + ownerNo
				+ ", usedStatus=" + usedStatus + ", prodPinNo=" + prodPinNo + "]";
	}

	
		
	
}
