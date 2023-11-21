package com.runningdog.vo;

import java.util.List;

public class AdminXYVo {

	private List<XYVo> xyList;
	private int walkLogNo;

	public AdminXYVo() {
		super();
	}

	public AdminXYVo(List<XYVo> xyList, int walkLogNo, int userNo) {
		super();
		this.xyList = xyList;
		this.walkLogNo = walkLogNo;
	}

	public List<XYVo> getXyList() {
		return xyList;
	}

	public void setXyList(List<XYVo> xyList) {
		this.xyList = xyList;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}

	

	@Override
	public String toString() {
		return "AdminXYVo [xyList=" + xyList + ", walkLogNo=" + walkLogNo + "]";
	}

}
