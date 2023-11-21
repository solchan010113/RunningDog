package com.runningdog.vo;

public class MeetingsVo {

	private int meetingNo;
	private String name;
	private String description;
	private String meetingDate;
	private int maxMember;
	private int currentMember;
	private String small;
	private String medium;
	private String large;
	private String status;
	private int userNo;
	private int trailNo;
	private String spot;
	
	public MeetingsVo() {
		
	}
	
	public MeetingsVo(int meetingNo, String name, String description, String meetingDate, int maxMember,
			int currentMember, String small, String medium, String large, String status, int userNo, int trailNo,
			String spot) {
		super();
		this.meetingNo = meetingNo;
		this.name = name;
		this.description = description;
		this.meetingDate = meetingDate;
		this.maxMember = maxMember;
		this.currentMember = currentMember;
		this.small = small;
		this.medium = medium;
		this.large = large;
		this.status = status;
		this.userNo = userNo;
		this.trailNo = trailNo;
		this.spot = spot;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}

	public int getMaxMember() {
		return maxMember;
	}

	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}

	public int getCurrentMember() {
		return currentMember;
	}

	public void setCurrentMember(int currentMember) {
		this.currentMember = currentMember;
	}

	public String getSmall() {
		return small;
	}

	public void setSmall(String small) {
		this.small = small;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	public String getLarge() {
		return large;
	}

	public void setLarge(String large) {
		this.large = large;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	@Override
	public String toString() {
		return "MeetingsVo [meetingNo=" + meetingNo + ", name=" + name + ", description=" + description
				+ ", meetingDate=" + meetingDate + ", maxMember=" + maxMember + ", currentMember=" + currentMember
				+ ", small=" + small + ", medium=" + medium + ", large=" + large + ", status=" + status + ", userNo="
				+ userNo + ", trailNo=" + trailNo + ", spot=" + spot + "]";
	}

}


