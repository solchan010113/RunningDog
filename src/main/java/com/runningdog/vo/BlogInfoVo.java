package com.runningdog.vo;

public class BlogInfoVo {
	
	private int no;
	private String name; 
	
	private String userSavename;
	private String  bannerSavename;
	
	
	private int followerNum;
	private int followingNum;
	
	public BlogInfoVo() {}
	
	public BlogInfoVo(String name, String userSavename, String bannerSavename, int followerNum, int followingNum) {
		super();
		this.name = name;
		this.userSavename = userSavename;
		this.bannerSavename = bannerSavename;
		this.followerNum = followerNum;
		this.followingNum = followingNum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserSavename() {
		return userSavename;
	}

	public void setUserSavename(String userSavename) {
		this.userSavename = userSavename;
	}

	public String getBannerSavename() {
		return bannerSavename;
	}

	public void setBannerSavename(String bannerSavename) {
		this.bannerSavename = bannerSavename;
	}

	public int getFollowerNum() {
		return followerNum;
	}

	public void setFollowerNum(int followerNum) {
		this.followerNum = followerNum;
	}

	public int getFollowingNum() {
		return followingNum;
	}

	public void setFollowingNum(int followingNum) {
		this.followingNum = followingNum;
	}

	@Override
	public String toString() {
		return "BlogInfoVo [no=" + no + ", name=" + name + ", userSavename=" + userSavename + ", bannerSavename="
				+ bannerSavename + ", followerNum=" + followerNum + ", followingNum=" + followingNum + "]";
	}


	
	
	
	
	
	
	
	
	

}
