package com.runningdog.vo;

public class linePathVo {
	
	private double lat; // y값 (위도)
	private double lng; // x값 (경도)
	
	public linePathVo() {}
	
	public linePathVo(double lat, double lng) {
		this.lat = lat;
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "linePathVo [lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	

}
