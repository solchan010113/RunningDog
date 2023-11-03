package com.runningdog.vo;

public class ClubJoinVo {
	
	private int joinNo;
	private String regDate;
	private UserVo userVo;
	private ClubVo clubVo;
	
	public ClubJoinVo() {}
	public ClubJoinVo(int joinNo, String regDate, UserVo userVo, ClubVo clubVo) {
		super();
		this.joinNo = joinNo;
		this.regDate = regDate;
		this.userVo = userVo;
		this.clubVo = clubVo;
	}
	public int getJoinNo() {
		return joinNo;
	}
	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public UserVo getUserVo() {
		return userVo;
	}
	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}
	public ClubVo getClubVo() {
		return clubVo;
	}
	public void setClubVo(ClubVo clubVo) {
		this.clubVo = clubVo;
	}
	@Override
	public String toString() {
		return "ClubJoinVo [joinNo=" + joinNo + ", clubVo=" + clubVo + "]";
	}
	
}
