package com.runningdog.vo;

public class WalkLogCmtVo {
	
	private int walkLogCmtNo;
	private WalkLogVo walkLogNo;
	private UsersVo userNo;
	private String content;
	private int regDate;
	private char status;
	
	
	public WalkLogCmtVo() {}
	
	
	public WalkLogCmtVo(int walkLogCmtNo, WalkLogVo walkLogNo, UserVo userNo, String content, int regDate, char status) {
		super();
		this.walkLogCmtNo = walkLogCmtNo;
		this.walkLogNo = walkLogNo;
		this.userNo = userNo;
		this.content = content;
		this.regDate = regDate;
		this.status = status;
	}


	public int getWalkLogCmtNo() {
		return walkLogCmtNo;
	}


	public void setWalkLogCmtNo(int walkLogCmtNo) {
		this.walkLogCmtNo = walkLogCmtNo;
	}


	public WalkLogVo getWalkLogNo() {
		return walkLogNo;
	}


	public void setWalkLogNo(WalkLogVo walkLogNo) {
		this.walkLogNo = walkLogNo;
	}


	public UserVo getUserNo() {
		return userNo;
	}


	public void setUserNo(UserVo userNo) {
		this.userNo = userNo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getRegDate() {
		return regDate;
	}


	public void setRegDate(int regDate) {
		this.regDate = regDate;
	}


	public char getStatus() {
		return status;
	}


	public void setStatus(char status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "walkLogCmt [walkLogCmtNo=" + walkLogCmtNo + ", content=" + content + ", regDate=" + regDate
				+ ", status=" + status + "]";
	}
	
	
	
	
	

}
