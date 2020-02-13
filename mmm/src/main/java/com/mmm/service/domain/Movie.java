package com.mmm.service.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Movie {
	
	
//	Field
//	관리번호들
	private int movieNo;
	private String kobisCd;
	private String naverCd;
	private String kmdbCd;
	private int userNo;
	
//	kobis에서 가져오는 Data
	private String movieTitle;
	private String movieRating;	// 관람물 등급... 
	private String releaseDate;
	
//	Kmdb에서 가져오는 Data
	private String genreString;
	private List<String> genreList;
	private int runningTime;
	private String movieTitleEng;
	private String director;
	private String actor;
	private String poster;
	private List<String> posters;
	private String summary;
	private String trailer;
	private List<String> still;
	private List<String> keywordList;
	
	//우리 DB에서 가져오는 Data
	private int rank;	// 순위.......
	private double bookingRate;	//예매율...
	private int audienceCnt;
	private int onBoxOfficeFlag; // null 이라면 예매 가능작, 1인 경우 내린 영화
	private int dDay;
	private double starRating;
	private int wishCnt;
	private int wishUserFlag;
	private int starByUser;
	private int starUserFlag;
	
	
	//Constructor
	public Movie() {

//		if(this.releaseDate != null ) {
//		
//			Calendar c = Calendar.getInstance();
//			c.setTime(this.releaseDate);
//			c.clear(Calendar.HOUR);
//			c.clear(Calendar.MINUTE);
//			c.clear(Calendar.SECOND);
//			c.clear(Calendar.MILLISECOND);
//			
//			long dayMilliSecond = Calendar.getInstance().getTimeInMillis() - c.getTimeInMillis() ;
//			int dday = (int)(Math.floor(TimeUnit.HOURS.convert(dayMilliSecond, TimeUnit.MILLISECONDS)/ 24f));
//			this.dDay = dday;
//		}
	}

//	Getter Setter
	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public String getKobisCd() {
		return kobisCd;
	}


	public void setKobisCd(String kobisCd) {
		this.kobisCd = kobisCd;
	}


	public String getNaverCd() {
		return naverCd;
	}


	public void setNaverCd(String naverCd) {
		this.naverCd = naverCd;
	}


	public String getKmdbCd() {
		return kmdbCd;
	}


	public void setKmdbCd(String kmdbCd) {
		this.kmdbCd = kmdbCd;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getMovieTitle() {
		return movieTitle;
	}


	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}


	public String getMovieRating() {
		return movieRating;
	}


	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}


	public int getRunningTime() {
		return runningTime;
	}


	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}


	public String getReleaseDate() {
		return releaseDate;
	}


	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}


	public String getGenreString() {
		return genreString;
	}


	public void setGenreString(String genreString) {
		this.genreString = genreString;
	}


	public String getMovieTitleEng() {
		return movieTitleEng;
	}


	public void setMovieTitleEng(String movieTitleEng) {
		this.movieTitleEng = movieTitleEng;
	}


	public String getDirector() {
		return director;
	}


	public void setDirector(String director) {
		this.director = director;
	}


	public String getActor() {
		return actor;
	}


	public void setActor(String actor) {
		this.actor = actor;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
	}


	public List<String> getPosters() {
		return posters;
	}


	public void setPosters(List<String> posters) {
		this.posters = posters;
	}


	public String getSummary() {
		return summary;
	}


	public void setSummary(String summary) {
		this.summary = summary;
	}


	public String getTrailer() {
		return trailer;
	}


	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}


	public List<String> getStill() {
		return still;
	}


	public void setStill(List<String> still) {
		this.still = still;
	}


	public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public double getBookingRate() {
		return bookingRate;
	}


	public void setBookingRate(double bookingRate) {
		this.bookingRate = bookingRate;
	}


	public int getAudienceCnt() {
		return audienceCnt;
	}


	public void setAudienceCnt(int audienceCnt) {
		this.audienceCnt = audienceCnt;
	}


	public int getOnBoxOfficeFlag() {
		return onBoxOfficeFlag;
	}


	public void setOnBoxOfficeFlag(int onBoxOfficeFlag) {
		this.onBoxOfficeFlag = onBoxOfficeFlag;
	}


	public int getdDay() {
		return dDay;
	}


	public void setdDay(int dDay) {
		this.dDay = dDay;
	}


	public double getStarRating() {
		return starRating;
	}


	public void setStarRating(double starRating) {
		this.starRating = starRating;
	}


	public int getWishCnt() {
		return wishCnt;
	}


	public void setWishCnt(int wishCnt) {
		this.wishCnt = wishCnt;
	}


	public int getWishUserFlag() {
		return wishUserFlag;
	}


	public void setWishUserFlag(int wishUserFlag) {
		this.wishUserFlag = wishUserFlag;
	}


	public int getStarByUser() {
		return starByUser;
	}


	public void setStarByUser(int starByUser) {
		this.starByUser = starByUser;
	}


	public int getStarUserFlag() {
		return starUserFlag;
	}


	public void setStarUserFlag(int starUserFlag) {
		this.starUserFlag = starUserFlag;
	}

	public List<String> getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List<String> keywordList) {
		this.keywordList = keywordList;
	}

	public List<String> getGenreList() {
		return genreList;
	}

	public void setGenreList(List<String> genreList) {
		this.genreList = genreList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Movie [movieNo=");
		builder.append(movieNo);
		builder.append(", kobisCd=");
		builder.append(kobisCd);
		builder.append(", naverCd=");
		builder.append(naverCd);
		builder.append(", kmdbCd=");
		builder.append(kmdbCd);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", movieTitle=");
		builder.append(movieTitle);
		builder.append(", movieRating=");
		builder.append(movieRating);
		builder.append(", releaseDate=");
		builder.append(releaseDate);
		builder.append(", genreString=");
		builder.append(genreString);
		builder.append(", genreList=");
		builder.append(genreList);
		builder.append(", runningTime=");
		builder.append(runningTime);
		builder.append(", movieTitleEng=");
		builder.append(movieTitleEng);
		builder.append(", director=");
		builder.append(director);
		builder.append(", actor=");
		builder.append(actor);
		builder.append(", poster=");
		builder.append(poster);
		builder.append(", posters=");
		builder.append(posters);
		builder.append(", summary=");
		builder.append(summary);
		builder.append(", trailer=");
		builder.append(trailer);
		builder.append(", still=");
		builder.append(still);
		builder.append(", keywordList=");
		builder.append(keywordList);
		builder.append(", rank=");
		builder.append(rank);
		builder.append(", bookingRate=");
		builder.append(bookingRate);
		builder.append(", audienceCnt=");
		builder.append(audienceCnt);
		builder.append(", onBoxOfficeFlag=");
		builder.append(onBoxOfficeFlag);
		builder.append(", dDay=");
		builder.append(dDay);
		builder.append(", starRating=");
		builder.append(starRating);
		builder.append(", wishCnt=");
		builder.append(wishCnt);
		builder.append(", wishUserFlag=");
		builder.append(wishUserFlag);
		builder.append(", starByUser=");
		builder.append(starByUser);
		builder.append(", starUserFlag=");
		builder.append(starUserFlag);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}