package com.mmm.common;

import java.sql.Timestamp;
import java.util.List;

public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private String viewCondition;
	private String movieName; // 예매 전용
	private String franchise; // 예매 전용
	private String theaterName; // 예매 전용
	private List<String> franchises; //예매 전용
	private List<String> theaterNames; //예매 전용	
	private Timestamp screenDate; // 예매 전용
	private Timestamp screenTime; // 예매 전용
	private String ticketerPhone; // 예매 전용
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private int userNo;
	private int payObjectFlag; //0 : ticketing 1: purchase  2:ticketing + purchase
	private int onBoxOfficeFlag;	//0 : 상영예정작, 1: 상영작(박스오피스)
	private int articleType; //1: 일대일문의,  2: 공지사항,  3: 자주찾는질문,  4: 영화리뷰
	private int category; //0: 전체, 1: 예매&매표 , 2: 스토어,  3: 결제,  4: 할인혜택,  5: 홈페이지,  6: 이벤트
	private String userId; 
	private int previewFlag; //0: 진행중  1:마감
	private int cartUserNo; // 상품 & 구매 전용
	private Timestamp cartRegDate; // 상품 & 구매 전용
	private int inventoryUserNo; // 상품 & 구매 전용
	private int inventoryProdNo; // 상품 & 구매 전용
	private int inventoryPurchaseNo; // 상품 & 구매 전용
	private int inventoryStatus; // 상품 & 구매 전용
	private Timestamp inventoryUsedDate; // 상품 & 구매 전용
	private String receiverPhone; // 상품 & 구매 전용
	private int purchaseStatus;

	///Constructor
	public Search() {
	}

	public String getTicketerPhone() {
		return ticketerPhone;
	}
	
	
	public void setTicketerPhone(String ticketerPhone) {
		this.ticketerPhone = ticketerPhone;
	}
	
	///Method
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getViewCondition() {
		return viewCondition;
	}

	public void setViewCondition(String viewCondition) {
		this.viewCondition = viewCondition;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getFranchise() {
		return franchise;
	}

	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public Timestamp getScreenDate() {
		return screenDate;
	}

	public void setScreenDate(Timestamp screenDate) {
		this.screenDate = screenDate;
	}

	public Timestamp getScreenTime() {
		return screenTime;
	}

	public void setScreenTime(Timestamp screenTime) {
		this.screenTime = screenTime;
	}
	
	public List<String> getFranchises() {
		return franchises;
	}
	
	
	public List<String> getTheaterNames() {
		return theaterNames;
	}
	
	
	public void setFranchises(List<String> franchises) {
		this.franchises = franchises;
	}
	
	
	public void setTheaterNames(List<String> theaterNames) {
		this.theaterNames = theaterNames;
	}	

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getPayObjectFlag() {
		return payObjectFlag;
	}


	public void setPayObjectFlag(int payObjectFlag) {
		this.payObjectFlag = payObjectFlag;
	}


	public int getOnBoxOfficeFlag() {
		return onBoxOfficeFlag;
	}


	public void setOnBoxOfficeFlag(int onBoxOfficeFlag) {
		this.onBoxOfficeFlag = onBoxOfficeFlag;
	}


	
	public int getArticleType() {
		return articleType;
	}

	public void setArticleType(int articleType) {
		this.articleType = articleType;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	public int getPreviewFlag() {
		return previewFlag;
	}

	public void setPreviewFlag(int previewFlag) {
		this.previewFlag = previewFlag;
	}
	
	public int getCartUserNo() {
		return cartUserNo;
	}

	public Timestamp getCartRegDate() {
		return cartRegDate;
	}

	public void setCartUserNo(int cartUserNo) {
		this.cartUserNo = cartUserNo;
	}

	public void setCartRegDate(Timestamp cartRegDate) {
		this.cartRegDate = cartRegDate;
	}	
	public int getInventoryUserNo() {
		return inventoryUserNo;
	}
	
	public int getInventoryProdNo() {
		return inventoryProdNo;
	}
	
	public int getInventoryPurchaseNo() {
		return inventoryPurchaseNo;
	}
	
	public void setInventoryUserNo(int inventoryUserNo) {
		this.inventoryUserNo = inventoryUserNo;
	}
	
	public void setInventoryProdNo(int inventoryProdNo) {
		this.inventoryProdNo = inventoryProdNo;
	}
	
	public void setInventoryPurchaseNo(int inventoryPurchaseNo) {
		this.inventoryPurchaseNo = inventoryPurchaseNo;
	}

	public int getInventoryStatus() {
		return inventoryStatus;
	}

	public Timestamp getInventoryUsedDate() {
		return inventoryUsedDate;
	}

	public void setInventoryStatus(int inventoryStatus) {
		this.inventoryStatus = inventoryStatus;
	}

	public void setInventoryUsedDate(Timestamp inventoryUsedDate) {
		this.inventoryUsedDate = inventoryUsedDate;
	}
	
	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	
	public int getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(int purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}
	

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", viewCondition=" + viewCondition + ", movieName=" + movieName + ", franchise="
				+ franchise + ", theaterName=" + theaterName + ", franchises=" + franchises + ", theaterNames="
				+ theaterNames + ", screenDate=" + screenDate + ", screenTime=" + screenTime + ", ticketerPhone="
				+ ticketerPhone + ", pageSize=" + pageSize + ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum
				+ ", userNo=" + userNo + ", payObjectFlag=" + payObjectFlag + ", onBoxOfficeFlag=" + onBoxOfficeFlag
				+ ", articleType=" + articleType + ", category=" + category + ", userId=" + userId + ", previewFlag="
				+ previewFlag + ", cartUserNo=" + cartUserNo + ", cartRegDate=" + cartRegDate + ", inventoryUserNo="
				+ inventoryUserNo + ", inventoryProdNo=" + inventoryProdNo + ", inventoryPurchaseNo="
				+ inventoryPurchaseNo + ", inventoryStatus=" + inventoryStatus + ", inventoryUsedDate="
				+ inventoryUsedDate + ", receiverPhone=" + receiverPhone + ", purchaseStatus=" + purchaseStatus
				+ ", getTicketerPhone()=" + getTicketerPhone() + ", getCurrentPage()=" + getCurrentPage()
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getViewCondition()=" + getViewCondition() + ", getMovieName()=" + getMovieName()
				+ ", getFranchise()=" + getFranchise() + ", getTheaterName()=" + getTheaterName() + ", getScreenDate()="
				+ getScreenDate() + ", getScreenTime()=" + getScreenTime() + ", getFranchises()=" + getFranchises()
				+ ", getTheaterNames()=" + getTheaterNames() + ", getPageSize()=" + getPageSize() + ", getEndRowNum()="
				+ getEndRowNum() + ", getStartRowNum()=" + getStartRowNum() + ", getUserNo()=" + getUserNo()
				+ ", getPayObjectFlag()=" + getPayObjectFlag() + ", getOnBoxOfficeFlag()=" + getOnBoxOfficeFlag()
				+ ", getArticleType()=" + getArticleType() + ", getCategory()=" + getCategory() + ", getUserId()="
				+ getUserId() + ", getPreviewFlag()=" + getPreviewFlag() + ", getCartUserNo()=" + getCartUserNo()
				+ ", getCartRegDate()=" + getCartRegDate() + ", getInventoryUserNo()=" + getInventoryUserNo()
				+ ", getInventoryProdNo()=" + getInventoryProdNo() + ", getInventoryPurchaseNo()="
				+ getInventoryPurchaseNo() + ", getInventoryStatus()=" + getInventoryStatus()
				+ ", getInventoryUsedDate()=" + getInventoryUsedDate() + ", getReceiverPhone()=" + getReceiverPhone()
				+ ", getPurchaseStatus()=" + getPurchaseStatus() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}	






}
	
	