package com.runningdog.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.MoWebDao;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoWalkLogVo;
import com.runningdog.vo.UseTrailVo;

@Service	
public class MoWebService {
	
	@Autowired
	private MoWebDao moWebDao;
	
	// (1) 산책로 불러오기
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Service");				
		return moWebDao.trailSelect();
	}
	
	// (2) 강아지정보 가져오기
	public List<MoDogVo> dogSelect(int userNo){
		System.out.println("서비스 강아지가져오기");				
		return moWebDao.dogSelect(userNo);
	}
	
	// (3) 산책기록하기
	public void walkLogInsert(MoWalkLogVo moWalkLogVo){
		System.out.println("서비스 산책기록하기");		
		moWebDao.walkLogInsert(moWalkLogVo);		
	}
	

}
