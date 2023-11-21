package com.runningdog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.MeetingDao;
import com.runningdog.vo.MeetingsVo;

@Service
public class MeetingService {

	@Autowired
	private MeetingDao meetingDao;
	
	//모임 리스트 (전체)
	public List<MeetingsVo> selectMeetingList(){
		System.out.println("MeetingService.selectMeetingList()");
		
		List<MeetingsVo> meetingList = meetingDao.selectMeetingList();
		
		return meetingList;
	}
	
	
	
	
	
	
	
	
}
