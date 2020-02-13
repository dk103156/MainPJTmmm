package com.mmm.service.domain;

import java.sql.Timestamp;

public class User {
	
	///Field
	private int userNo;
	private String userId;
	private String userName;
	private String password;
	private String role;
	private String profile;
	private String birth;
	private String gender;
	private String phone;
	private String email;
	private String addr;
	private String likeGenre1;
	private String likeGenre2;
	private String likeGenre3;
	private String likeTheater1;
	private String likeTheater2;
	private String likeTheater3;
	private Timestamp userDate;
	private Timestamp userByeDate;
	private Timestamp lastLoginDate;	// 마지막 로그인 날짜
	private Timestamp updateUserDate;	// 마지막 회원정보수정 날짜
	private Timestamp updatePwDate;		// 마지막 비밀번호수정 날짜
	private int identity;
	private int userStatus;
	private int userGrade;
	private int totalPoint;
	private int accPoint;
	
	public int getUserNo() {
		return userNo;
		
	//Method	
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getLikeGenre1() {
		return likeGenre1;
	}
	public void setLikeGenre1(String likeGenre1) {
		this.likeGenre1 = likeGenre1;
	}
	public String getLikeGenre2() {
		return likeGenre2;
	}
	public void setLikeGenre2(String likeGenre2) {
		this.likeGenre2 = likeGenre2;
	}
	public String getLikeGenre3() {
		return likeGenre3;
	}
	public void setLikeGenre3(String likeGenre3) {
		this.likeGenre3 = likeGenre3;
	}
	public String getLikeTheater1() {
		return likeTheater1;
	}
	public void setLikeTheater1(String likeTheater1) {
		this.likeTheater1 = likeTheater1;
	}
	public String getLikeTheater2() {
		return likeTheater2;
	}
	public void setLikeTheater2(String likeTheater2) {
		this.likeTheater2 = likeTheater2;
	}
	public String getLikeTheater3() {
		return likeTheater3;
	}
	public void setLikeTheater3(String likeTheater3) {
		this.likeTheater3 = likeTheater3;
	}
	public Timestamp getUserDate() {
		return userDate;
	}
	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}
	public Timestamp getUserByeDate() {
		return userByeDate;
	}
	public void setUserByeDate(Timestamp userByeDate) {
		this.userByeDate = userByeDate;
	}
	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public Timestamp getUpdateUserDate() {
		return updateUserDate;
	}
	public void setUpdateUserDate(Timestamp updateUserDate) {
		this.updateUserDate = updateUserDate;
	}
	public Timestamp getUpdatePwDate() {
		return updatePwDate;
	}
	public void setUpdatePwDate(Timestamp updatePwDate) {
		this.updatePwDate = updatePwDate;
	}
	public int getIdentity() {
		return identity;
	}
	public void setIdentity(int identity) {
		this.identity = identity;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public int getAccPoint() {
		return accPoint;
	}
	public void setAccPoint(int accPoint) {
		this.accPoint = accPoint;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", password=" + password
				+ ", role=" + role + ", profile=" + profile + ", birth=" + birth + ", gender=" + gender + ", phone="
				+ phone + ", email=" + email + ", addr=" + addr + ", likeGenre1=" + likeGenre1 + ", likeGenre2="
				+ likeGenre2 + ", likeGenre3=" + likeGenre3 + ", likeTheater1=" + likeTheater1 + ", likeTheater2="
				+ likeTheater2 + ", likeTheater3=" + likeTheater3 + ", userDate=" + userDate + ", userByeDate="
				+ userByeDate + ", lastLoginDate=" + lastLoginDate + ", updateUserDate=" + updateUserDate
				+ ", updatePwDate=" + updatePwDate + ", identity=" + identity + ", userStatus=" + userStatus
				+ ", userGrade=" + userGrade + ", totalPoint=" + totalPoint + ", accPoint=" + accPoint + "]";
	}
	
	
}
