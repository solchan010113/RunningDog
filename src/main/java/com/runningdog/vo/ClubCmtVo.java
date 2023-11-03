package com.runningdog.vo;

public class ClubCmtVo {
	
	private int clubCommentNo;
	private ClubBoardVo clubBoardVo;
	private UserVo userVo;
	private String contents;
	private String regDate;
	private int groupNo;
	private char status;
	
	public ClubCmtVo() {}
	public ClubCmtVo(int clubCommentNo, ClubBoardVo clubBoardVo, UserVo userVo, String contents, String regDate,
			int groupNo, char status) {
		this.clubCommentNo = clubCommentNo;
		this.clubBoardVo = clubBoardVo;
		this.userVo = userVo;
		this.contents = contents;
		this.regDate = regDate;
		this.groupNo = groupNo;
		this.status = status;
	}
	public int getClubCommentNo() {
		return clubCommentNo;
	}
	public void setClubCommentNo(int clubCommentNo) {
		this.clubCommentNo = clubCommentNo;
	}
	public ClubBoardVo getClubBoardVo() {
		return clubBoardVo;
	}
	public void setClubBoardVo(ClubBoardVo clubBoardVo) {
		this.clubBoardVo = clubBoardVo;
	}
	public UserVo getUserVo() {
		return userVo;
	}
	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ClubCmtVo [clubCommentNo=" + clubCommentNo + ", clubBoardVo=" + clubBoardVo + ", contents=" + contents
				+ ", regDate=" + regDate + ", groupNo=" + groupNo + ", status=" + status + "]";
	}
	
}
