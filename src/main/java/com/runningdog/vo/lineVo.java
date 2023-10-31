package com.runningdog.vo;

public class lineVo {
	
	private long latitude;
	private long longitude;
	
	public lineVo() {}
	
	public lineVo(long latitude, long longitude) {
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public long getLatitude() {
		return latitude;
	}

	public void setLatitude(long latitude) {
		this.latitude = latitude;
	}

	public long getLongitude() {
		return longitude;
	}

	public void setLongitude(long longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "lineVo [latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	
	
	

}
