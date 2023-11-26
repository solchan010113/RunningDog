package com.runningdog.vo;

public class FollowListVo {
	
	private String name;
	private String userSavename;
	private int followNo;
	private int followeeNo;
	private int followerNo;
	private int userNo;
	private String code;
	
	public FollowListVo() {}
	
	


	










	public FollowListVo(String name, String userSavename, int followNo, int followeeNo, int followerNo, int userNo,
			String code) {
		super();
		this.name = name;
		this.userSavename = userSavename;
		this.followNo = followNo;
		this.followeeNo = followeeNo;
		this.followerNo = followerNo;
		this.userNo = userNo;
		this.code = code;
	}















	public String getCode() {
		return code;
	}















	public void setCode(String code) {
		this.code = code;
	}















	public int getUserNo() {
		return userNo;
	}








	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}








	public int getFollowNo() {
		return followNo;
	}




	public void setFollowNo(int followNo) {
		this.followNo = followNo;
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



	public int getFolloweeNo() {
		return followeeNo;
	}



	public void setFolloweeNo(int followeeNo) {
		this.followeeNo = followeeNo;
	}



	public int getFollowerNo() {
		return followerNo;
	}



	public void setFollowerNo(int followerNo) {
		this.followerNo = followerNo;
	}




	@Override
	public String toString() {
		return "FollowListVo [name=" + name + ", userSavename=" + userSavename + ", followNo=" + followNo
				+ ", followeeNo=" + followeeNo + ", followerNo=" + followerNo + "]";
	}




	

}
