package com.runningdog.vo;

public class MeetingInfosVo {
	
	private int meetingInfoNo;
	private int meetingNo;
	private int usersNo;
	private int dogNo;
	
	public MeetingInfosVo() {
		
	}
	
	public MeetingInfosVo(int meetingInfoNo, int meetingNo, int usersNo, int dogNo) {
		super();
		this.meetingInfoNo = meetingInfoNo;
		this.meetingNo = meetingNo;
		this.usersNo = usersNo;
		this.dogNo = dogNo;
	}

	public int getMeetingInfoNo() {
		return meetingInfoNo;
	}

	public void setMeetingInfoNo(int meetingInfoNo) {
		this.meetingInfoNo = meetingInfoNo;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	@Override
	public String toString() {
		return "MeetingInfoVo [meetingInfoNo=" + meetingInfoNo + ", meetingNo=" + meetingNo + ", usersNo=" + usersNo
				+ ", dogNo=" + dogNo + "]";
	}
	
}
