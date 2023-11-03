package com.runningdog.vo;

public class FriendVo {
	private int friendNo;
	private int applyUserNo;
	private int appliedUserNo;
	private char status;
	
	public FriendVo() {
		
	}
	
	public FriendVo(int friendNo, int applyUserNo, int appliedUserNo, char status) {
		super();
		this.friendNo = friendNo;
		this.applyUserNo = applyUserNo;
		this.appliedUserNo = appliedUserNo;
		this.status = status;
	}

	public int getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}

	public int getApplyUserNo() {
		return applyUserNo;
	}

	public void setApplyUserNo(int applyUserNo) {
		this.applyUserNo = applyUserNo;
	}

	public int getAppliedUserNo() {
		return appliedUserNo;
	}

	public void setAppliedUserNo(int appliedUserNo) {
		this.appliedUserNo = appliedUserNo;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "FriendVo [friendNo=" + friendNo + ", applyUserNo=" + applyUserNo + ", appliedUserNo=" + appliedUserNo
				+ ", status=" + status + "]";
	}
	
}