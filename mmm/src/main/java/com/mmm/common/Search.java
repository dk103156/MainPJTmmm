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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Search [currentPage=");
		builder.append(currentPage);
		builder.append(", searchCondition=");
		builder.append(searchCondition);
		builder.append(", searchKeyword=");
		builder.append(searchKeyword);
		builder.append(", viewCondition=");
		builder.append(viewCondition);
		builder.append(", movieName=");
		builder.append(movieName);
		builder.append(", franchise=");
		builder.append(franchise);
		builder.append(", theaterName=");
		builder.append(theaterName);
		builder.append(", franchises=");
		builder.append(franchises);
		builder.append(", theaterNames=");
		builder.append(theaterNames);
		builder.append(", screenDate=");
		builder.append(screenDate);
		builder.append(", screenTime=");
		builder.append(screenTime);
		builder.append(", ticketerPhone=");
		builder.append(ticketerPhone);
		builder.append(", pageSize=");
		builder.append(pageSize);
		builder.append(", endRowNum=");
		builder.append(endRowNum);
		builder.append(", startRowNum=");
		builder.append(startRowNum);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", payObjectFlag=");
		builder.append(payObjectFlag);
		builder.append(", onBoxOfficeFlag=");
		builder.append(onBoxOfficeFlag);
		builder.append(", articleType=");
		builder.append(articleType);
		builder.append(", category=");
		builder.append(category);
		builder.append("]");
		return builder.toString();
	}



}
	
	