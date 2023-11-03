package com.runningdog.vo;

public class MeetingInfoVo {
	
	private int meetingInfoNo;
	private MeetingVo meetingVo;
	private UserVo userVo;
	private DogVo dogVo;
	
	public MeetingInfoVo() {}
	public MeetingInfoVo(int meetingInfoNo, MeetingVo meetingVo, UserVo userVo, DogVo dogVo) {
		this.meetingInfoNo = meetingInfoNo;
		this.meetingVo = meetingVo;
		this.userVo = userVo;
		this.dogVo = dogVo;
	}
	public int getMeetingInfoNo() {
		return meetingInfoNo;
	}
	public void setMeetingInfoNo(int meetingInfoNo) {
		this.meetingInfoNo = meetingInfoNo;
	}
	public MeetingVo getMeetingVo() {
		return meetingVo;
	}
	public void setMeetingVo(MeetingVo meetingVo) {
		this.meetingVo = meetingVo;
	}
	public UserVo getUserVo() {
		return userVo;
	}
	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}
	public DogVo getDogVo() {
		return dogVo;
	}
	public void setDogVo(DogVo dogVo) {
		this.dogVo = dogVo;
	}
	@Override
	public String toString() {
		return "MeetingInfoVo [meetingInfoNo=" + meetingInfoNo + ", meetingVo=" + meetingVo + "]";
	}
	
}
