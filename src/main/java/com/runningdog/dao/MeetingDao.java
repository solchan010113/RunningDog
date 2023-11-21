package com.runningdog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.MeetingsVo;

@Repository
public class MeetingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//모임 리스트 (전체)
	public List<MeetingsVo> selectMeetingList() {
		System.out.println("MeetingDao.selectMeetingList()");
		
		List<MeetingsVo> meetingList = sqlSession.selectList("meeting.selectMeetingList");
		
		return meetingList;
	}
	
	
	
	
	
	
	
	
}


