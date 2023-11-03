package com.runningdog.vo;

public class BlogVo {
	
	private int blogNo;
	private UserVo userNo;
	
	public BlogVo() {}
	
	
	public BlogVo(int blogNo, UserVo userNo) {
		super();
		this.blogNo = blogNo;
		this.userNo = userNo;
	}


	

	public int getBlogNo() {
		return blogNo;
	}


	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}


	public UserVo getUserNo() {
		return userNo;
	}


	public void setUserNo(UserVo userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "BlogVo [blogNo=" + blogNo + "]";
	}
	
	
	
	
	

}
