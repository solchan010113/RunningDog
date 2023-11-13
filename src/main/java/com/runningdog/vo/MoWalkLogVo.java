package com.runningdog.vo;

public class MoWalkLogVo {
	
	// 손성진 사용
	
	private int walkLogNo; // 산책기록 번호 (사용처번호)
	private int userNo;
	private String regDate;
	private String startTime;
	private String endTime;
	private String logTime;
	private int distance;
	private String content;
	private String security;
	private char status;
	
	// 산책한 강아지 (walkedDog 테이블에 저장)
	private int dogNo;	
	
	public MoWalkLogVo() {}

	public MoWalkLogVo(int walkLogNo, int userNo, String regDate, String startTime, String endTime, String logTime,
			int distance, String content, String security, char status, int dogNo) {
		super();
		this.walkLogNo = walkLogNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.logTime = logTime;
		this.distance = distance;
		this.content = content;
		this.security = security;
		this.status = status;
		this.dogNo = dogNo;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getLogTime() {
		return logTime;
	}

	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSecurity() {
		return security;
	}

	public void setSecurity(String security) {
		this.security = security;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	@Override
	public String toString() {
		return "MoWalkLogVo [walkLogNo=" + walkLogNo + ", userNo=" + userNo + ", regDate=" + regDate + ", startTime="
				+ startTime + ", endTime=" + endTime + ", logTime=" + logTime + ", distance=" + distance + ", content="
				+ content + ", security=" + security + ", status=" + status + ", dogNo=" + dogNo + "]";
	}

	

}
