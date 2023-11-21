package com.runningdog.vo;

public class UseTrailVo {
	
	// 손성진사용	
	
	private int coordNo;
	private int trailNo;
	private String name;	
	private int coordOrder;
	private double lat;
	private double lng;
	
	private int locationVo;
	
	public UseTrailVo() {}

	public UseTrailVo(int coordNo, int trailNo, String name, int coordOrder, double lat, double lng, int locationVo) {
		super();
		this.coordNo = coordNo;
		this.trailNo = trailNo;
		this.name = name;
		this.coordOrder = coordOrder;
		this.lat = lat;
		this.lng = lng;
		this.locationVo = locationVo;
	}

	public int getCoordNo() {
		return coordNo;
	}

	public void setCoordNo(int coordNo) {
		this.coordNo = coordNo;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCoordOrder() {
		return coordOrder;
	}

	public void setCoordOrder(int coordOrder) {
		this.coordOrder = coordOrder;
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

	public int getLocationVo() {
		return locationVo;
	}

	public void setLocationVo(int locationVo) {
		this.locationVo = locationVo;
	}

	@Override
	public String toString() {
		return "UseTrailVo [coordNo=" + coordNo + ", trailNo=" + trailNo + ", name=" + name + ", coordOrder="
				+ coordOrder + ", lat=" + lat + ", lng=" + lng + ", locationVo=" + locationVo + "]";
	};
	
	

}
