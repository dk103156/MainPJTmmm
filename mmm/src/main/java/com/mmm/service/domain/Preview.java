package com.mmm.service.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Preview {

	private int previewNo; //시사회 이벤트 관리번호
	private String previewName; //시사회 이름
	private String previewPlace; //시사회 장소
	private Timestamp previewDate; //시사회 일자
	private String preDate;
	private String previewTime; //시사회 상영시간
	
	private String previewImage; //시사회 이미지 URI
	private List<MultipartFile> file; //시사회 이미지 파일   
	private Timestamp winnerDate; // 당첨자 발표 일자
	private String winDate;
	private int winnerCount; //당첨자 수
	private Timestamp previewStartDate; //시사회 이벤트 시작 일자
	private String preStDate;
	private Timestamp previewEndDate; //시사회 이벤트 종료 일자
	private String preEdDate;
	private Timestamp previewRegDate; //시사회 이벤트 등록 일시
	private String preRegDate;
	private int applyCount; //응모자 수
	private String previewFlag; //시사회 이벤트 상태(0:진행중 1:마감)
	
	
	public String getPreRegDate() {
		return preRegDate;
	}
	public void setPreRegDate(String preRegDate) {
		this.preRegDate = preRegDate;
	}
	public int getPreviewNo() {
		return previewNo;
	}
	public void setPreviewNo(int previewNo) {
		this.previewNo = previewNo;
	}
	public String getPreviewName() {
		return previewName;
	}
	public void setPreviewName(String previewName) {
		this.previewName = previewName;
	}
	public String getPreviewPlace() {
		return previewPlace;
	}
	public void setPreviewPlace(String previewPlace) {
		this.previewPlace = previewPlace;
	}
	public Timestamp getPreviewDate() {
		return previewDate;
	}
	
	public void setPreviewDate(Timestamp previewDate) {
		this.previewDate = previewDate;
		if(previewDate!=null) {
			preDate = previewDate.toString().substring(0,10);
			previewTime = previewDate.toString().substring(11, 16);
		}
	}
	
	public String getPreDate() {
		return preDate;
	}
	
	public String getPreviewTime() {
		return previewTime;
	}
	public void setPreviewTime(String previewTime) {
		this.previewTime = previewTime;
		
	}
	public String getPreviewImage() {
		return previewImage;
	}
	public void setPreviewImage(String previewImage) {
		this.previewImage = previewImage;
	}
	public Timestamp getWinnerDate() {
		return winnerDate;
	}
	public void setWinnerDate(Timestamp winnerDate) {
		this.winnerDate = winnerDate;
		if(winnerDate!=null) {
			winDate = winnerDate.toString().substring(0,10);
		}
	}
	public int getWinnerCount() {
		return winnerCount;
	}
	public void setWinnerCount(int winnerCount) {
		this.winnerCount = winnerCount;
	}
	public Timestamp getPreviewStartDate() {
		return previewStartDate;
	}
	public void setPreviewStartDate(Timestamp previewStartDate) {
		this.previewStartDate = previewStartDate;
		if(previewStartDate!=null) {
			preStDate = previewStartDate.toString().substring(0,10);
		}
	}
	public Timestamp getPreviewEndDate() {
		return previewEndDate;
	}
	public void setPreviewEndDate(Timestamp previewEndDate) {
		this.previewEndDate = previewEndDate;
		if(previewEndDate!=null) {
			preEdDate = previewEndDate.toString().substring(0,10);
		}
	}
	public Timestamp getPreviewRegDate() {
		return previewRegDate;
	}
	public void setPreviewRegDate(Timestamp previewRegDate) {
		this.previewRegDate = previewRegDate;
		if(previewRegDate!=null) {
			preRegDate = previewRegDate.toString().substring(0,10);
		}
		
	}
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public String getPreviewFlag() {
		return previewFlag;
	}
	public void setPreviewFlag(String previewFlag) {
		this.previewFlag = previewFlag;
	}
	
	
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	
	
	public String getWinDate() {
		return winDate;
	}
	public void setWinDate(String winDate) {
		this.winDate = winDate;
	}
	public String getPreStDate() {
		return preStDate;
	}
	public void setPreStDate(String preStDate) {
		this.preStDate = preStDate;
	}
	public String getPreEdDate() {
		return preEdDate;
	}
	public void setPreEdDate(String preEdDate) {
		this.preEdDate = preEdDate;
	}
	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}
	
	
	@Override
	public String toString() {
		return "Preview [previewNo=" + previewNo + ", previewName=" + previewName + ", previewPlace=" + previewPlace
				+ ", previewDate=" + previewDate + ", preDate=" + preDate + ", previewTime=" + previewTime
				+ ", previewImage=" + previewImage + ", file=" + file + ", winnerDate=" + winnerDate + ", winDate="
				+ winDate + ", winnerCount=" + winnerCount + ", previewStartDate=" + previewStartDate + ", preStDate="
				+ preStDate + ", previewEndDate=" + previewEndDate + ", preEdDate=" + preEdDate + ", previewRegDate="
				+ previewRegDate + ", applyCount=" + applyCount + ", previewFlag=" + previewFlag + "]";
	}

	

	
}
