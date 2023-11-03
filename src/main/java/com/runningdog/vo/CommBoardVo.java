package com.runningdog.vo;

public class CommBoardVo {
	
	private int commBoardNo; 	
	private String commCategory;
	private String title; 
	private String content;		
	private String regDate; 	
	private int count; 	
	private char status; 

	private UserVo userVo;

	public CommBoardVo() {};
	
	public CommBoardVo(int commBoardNo, String commCategory, String title, String content, String regDate, int count,
			char status, UserVo userVo) {
		super();
		this.commBoardNo = commBoardNo;
		this.commCategory = commCategory;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.count = count;
		this.status = status;
		this.userVo = userVo;
	}

	public int getCommBoardNo() {
		return commBoardNo;
	}

	public void setCommBoardNo(int commBoardNo) {
		this.commBoardNo = commBoardNo;
	}

	public String getCommCategory() {
		return commCategory;
	}

	public void setCommCategory(String commCategory) {
		this.commCategory = commCategory;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}

	@Override
	public String toString() {
		return "CommBoardVo [commBoardNo=" + commBoardNo + ", commCategory=" + commCategory + ", title=" + title
				+ ", content=" + content + ", regDate=" + regDate + ", count=" + count + ", status=" + status + "]";
	}
	
	
	
}
