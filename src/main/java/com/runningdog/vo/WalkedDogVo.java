package com.runningdog.vo;

public class WalkedDogVo {
	
	private int walkedDogNo;
	private walkLogVo walkLogVo;
	private dogVo dogVo;
	
	public WalkedDogVo() {}:
	
	public WalkedDogVo(int walkedDogNo, com.runningdog.vo.walkLogVo walkLogVo, com.runningdog.vo.dogVo dogVo) {
		super();
		this.walkedDogNo = walkedDogNo;
		this.walkLogVo = walkLogVo;
		this.dogVo = dogVo;
	}

	public int getWalkedDogNo() {
		return walkedDogNo;
	}

	public void setWalkedDogNo(int walkedDogNo) {
		this.walkedDogNo = walkedDogNo;
	}

	public walkLogVo getWalkLogVo() {
		return walkLogVo;
	}

	public void setWalkLogVo(walkLogVo walkLogVo) {
		this.walkLogVo = walkLogVo;
	}

	public dogVo getDogVo() {
		return dogVo;
	}

	public void setDogVo(dogVo dogVo) {
		this.dogVo = dogVo;
	}

	@Override
	public String toString() {
		return "WalkedDogVo [walkedDogNo=" + walkedDogNo + ", walkLogVo=" + walkLogVo + "]";
	}
	
	
	
	

}
