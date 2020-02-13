package com.mmm.service.domain;

public class Theater {
	
	private String theaterNo;
	private String movieName;
	private String dateTimeNo;
	private String franchise;
	private String theaterName;
	private String screenName;
	private int totalSeat;
	
	public String getTheaterNo() {
		return theaterNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public String getDateTimeNo() {
		return dateTimeNo;
	}
	public String getFranchise() {
		return franchise;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public String getScreenName() {
		return screenName;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTheaterNo(String theaterNo) {
		this.theaterNo = theaterNo;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setDateTimeNo(String dateTimeNo) {
		this.dateTimeNo = dateTimeNo;
	}
	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
	@Override
	public String toString() {
		return "Theater [theaterNo=" + theaterNo + ", movieName=" + movieName + ", dateTimeNo=" + dateTimeNo
				+ ", franchise=" + franchise + ", theaterName=" + theaterName + ", screenName=" + screenName
				+ ", totalSeat=" + totalSeat + "]";
	}
	

	
}
