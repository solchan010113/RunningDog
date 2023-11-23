package com.runningdog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.DogsVo;
import com.runningdog.vo.MeetingInfosVo;
import com.runningdog.vo.MeetingsVo;
import com.runningdog.vo.TrailsVo;

@Repository
public class MeetingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//모임 리스트 (전체)
	public List<MeetingsVo> selectMeetingList(Map<String, Object> pageMap) {
		System.out.println("MeetingDao.selectMeetingList()");

		List<MeetingsVo> meetingList = sqlSession.selectList("meeting.selectMeetingList", pageMap);
		
		return meetingList;
	}
	
	//모임 리스트 갯수
	public int selectMeetingCnt(String keyword) {
		System.out.println("MeetingDao.selectMeetingCnt()");
		
		int count = sqlSession.selectOne("meeting.selectMeetingCnt", keyword);
		
		return count;
	}
	
	//산책로 리스트(검색)
	public List<TrailsVo> searchTrail(Map<String, String> map) {
		System.out.println("MeetingDao.searchTrail()");

		List<TrailsVo> trailList = sqlSession.selectList("meeting.searchTrail", map);

		return trailList;
	}
	
	//강아지 리스트
	public List<DogsVo> selectDogList(int userNo) {
		System.out.println("MeetingDao.selectDogList()");
		
		List<DogsVo> dList = sqlSession.selectList("meeting.selectDogList", userNo);
		
		return dList;
	}
	
	//모임 등록
	public int insertMeeting(MeetingsVo meetingsVo) {
		System.out.println("MeetingDao.insertMeeting()");
		
		int count = sqlSession.insert("meeting.insertMeeting", meetingsVo);
		
		return count;
	}
	
	//모임 상세 등록
	public int insertMeetingInfo(MeetingInfosVo meetingInfosVo) {
		System.out.println("MeetingDao.insertMeetingInfo()");
		
		int count = sqlSession.insert("meeting.insertMeetingInfo", meetingInfosVo);
		
		return count;
	}
	
	//모임 1개
	public MeetingsVo selectOneMeeting(int meetingNo) {
		System.out.println("MeetingDao.selectOneMeeting()");
		
		MeetingsVo mvo = sqlSession.selectOne("meeting.selectOneMeeting", meetingNo);
		
		return mvo;
	}
	
	//모임 강아지
	public List<DogsVo> selectMeetingDogList(int meetingNo) {
		System.out.println("MeetingDao.selectMeetingDogList()");
		
		List<DogsVo> mdList = sqlSession.selectList("meeting.selectMeetingDogList", meetingNo);
		
		return mdList;
	}
	
	
}


