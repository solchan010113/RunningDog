package com.runningdog.vo;

public class ShowLogVo {
	
	private int walkLogNo;
	private int userNo;
	private int locationNo;
	private String regDate;
	private String startTime;
	private String endTime;
	private String logTime;
	private int distance;
	private String content;
	private String security;
	private char status;
	
	public ShowLogVo() {}
	
	
	
	
	public ShowLogVo(int walkLogNo, int userNo, int locationNo, String regDate, String startTime, String endTime,
			String logTime, int distance, String content, String security, char status) {
		super();
		this.walkLogNo = walkLogNo;
		this.userNo = userNo;
		this.locationNo = locationNo;
		this.regDate = regDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.logTime = logTime;
		this.distance = distance;
		this.content = content;
		this.security = security;
		this.status = status;
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
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
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




	@Override
	public String toString() {
		return "ShowLogVo [walkLogNo=" + walkLogNo + ", userNo=" + userNo + ", locationNo=" + locationNo + ", regDate="
				+ regDate + ", startTime=" + startTime + ", endTime=" + endTime + ", logTime=" + logTime + ", distance="
				+ distance + ", content=" + content + ", security=" + security + ", status=" + status + "]";
	}
	
	/*
	 * private List<walkLogComentVo>;
	 * 
	 * 
	 * private List<walkLogReplyVo>;
	 */
	
	
	

}
