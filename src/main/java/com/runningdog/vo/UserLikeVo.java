package com.runningdog.vo;

public class UserLikeVo {
	
	private int likeNo;
	private UsersVo userNo;
	private String type;
	private String useNo;
	
	public UserLikeVo() {

	}
	
	
	public UserLikeVo(int likeNo, UsersVo userNo, String type, String useNo) {
		super();
		this.likeNo = likeNo;
		this.userNo = userNo;
		this.type = type;
		this.useNo = useNo;
	}


	public int getLikeNo() {
		return likeNo;
	}


	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}


	public UsersVo getUserNo() {
		return userNo;
	}


	public void setUserNo(UsersVo userNo) {
		this.userNo = userNo;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getUseNo() {
		return useNo;
	}


	public void setUseNo(String useNo) {
		this.useNo = useNo;
	}


	@Override
	public String toString() {
		return "UserLike [likeNo=" + likeNo + ", type=" + type + ", useNo=" + useNo + "]";
	}
	
	
	
	
	

}
