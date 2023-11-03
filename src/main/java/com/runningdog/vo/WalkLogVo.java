package com.runningdog.vo;

public class WalkLogVo {
	
	private int walkLogNo;
	private String regDate;
	private String startTime;
	private String endTime;
	private String logTime;
	private int distance;
	private String content;
	private String security;
	private char status;
	
	private UsersVo usersVo;
	private MeetingVo meetingVo;
	private LocationVo locationVo;
	
	public WalkLogVo() {}

	public WalkLogVo(int walkLogNo, String regDate, String startTime, String endTime, String logTime, int distance,
			String content, String security, char status, UsersVo usersVo, MeetingVo meetingVo, LocationVo locationVo) {
		super();
		this.walkLogNo = walkLogNo;
		this.regDate = regDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.logTime = logTime;
		this.distance = distance;
		this.content = content;
		this.security = security;
		this.status = status;
		this.usersVo = usersVo;
		this.meetingVo = meetingVo;
		this.locationVo = locationVo;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
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

	public UsersVo getUsersVo() {
		return usersVo;
	}

	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}

	public MeetingVo getMeetingVo() {
		return meetingVo;
	}

	public void setMeetingVo(MeetingVo meetingVo) {
		this.meetingVo = meetingVo;
	}

	public LocationVo getLocationVo() {
		return locationVo;
	}

	public void setLocationVo(LocationVo locationVo) {
		this.locationVo = locationVo;
	}

	@Override
	public String toString() {
		return "WalkLogVo [walkLogNo=" + walkLogNo + ", regDate=" + regDate + ", startTime=" + startTime + ", endTime="
				+ endTime + ", logTime=" + logTime + ", distance=" + distance + ", content=" + content + ", security="
				+ security + ", status=" + status + ", meetingVo=" + meetingVo + ", locationVo=" + locationVo + "]";
	};
	
	
	
	
}