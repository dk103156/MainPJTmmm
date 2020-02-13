package com.mmm.service.domain;


public class Comment {
	
	private int commentNo;
	private int commentType;
	private String userId;
	private int supCommentNo;
	private int movieNo;
	private int articleNo;
	private String commentContent;
	private String commentDate;
	private int likeCount;
	private int commentCount;
	private int blindStatus;
	
	public int getCommentType() {
		return commentType;
	}
	public void setCommentType(int commentType) {
		this.commentType = commentType;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getSupCommentNo() {
		return supCommentNo;
	}
	public void setSupCommentNo(int supCommentNo) {
		this.supCommentNo = supCommentNo;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getBlindStatus() {
		return blindStatus;
	}
	public void setBlindStatus(int blindStatus) {
		this.blindStatus = blindStatus;
	}
	
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", supCommentNo=" + supCommentNo + ", articleNo=" + articleNo
				+ ", userId=" + userId + ", commentContent=" + commentContent + ", commentDate=" + commentDate
				+ ", likeCount=" + likeCount + ", commentCount=" + commentCount + ", blindStatus=" + blindStatus + "]";
	} 
	
	
}
