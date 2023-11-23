package com.runningdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.MeetingDao;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.MeetingInfosVo;
import com.runningdog.vo.MeetingsVo;
import com.runningdog.vo.TrailsVo;

@Service
public class MeetingService {

	@Autowired
	private MeetingDao meetingDao;
	
	//모임 리스트 (전체)
	public Map<String, Object> selectMeetingList(String keyword, int crtPage){
		System.out.println("MeetingService.selectMeetingList()");
		
		///////////////// 리스트 가져오기 ///////////////////////
				
		//페이지당 글 갯수
		int listCnt = 10;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;

		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("keyword", keyword);
		pageMap.put("startRNum", startRNum);
		pageMap.put("endRNum", endRNum);
		
		List<MeetingsVo> meetingList = meetingDao.selectMeetingList(pageMap);
		
		///////////////// 페이징 계산 ///////////////////////
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = meetingDao.selectMeetingCnt(keyword);
		
		//마지막 버튼 번호
		int endPageBtnNo = (int) Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
								//올림 함수 //(현재 페이지 / 페이지당 버튼 갯수) * 페이지당 버튼 갯수
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount)+1;
		
		//System.out.println(crtPage+", "+startPageBtnNo +", "+endPageBtnNo);
		
		//다음 화살표 유무
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCnt) {
			next = true;
			
		}else {	//다음 버튼이 없을(false) 때 endPageBtnNo를 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCnt/(double)listCnt);
										/* 157/10.0 => 15.7 => 16 */
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		Map<String, Object> meetingMap = new HashMap<String, Object>();
		meetingMap.put("startPageBtnNo", startPageBtnNo);
		meetingMap.put("endPageBtnNo", endPageBtnNo);
		meetingMap.put("prev", prev);
		meetingMap.put("next", next);
		meetingMap.put("keyword", keyword);
		meetingMap.put("meetingList", meetingList);
		
		return meetingMap;
	}
	
	
	//모임 리스트 (전체)
	public List<TrailsVo> searchTrail(String what, String keyword){
		System.out.println("MeetingService.searchTrail()");

		Map<String, String> tMap = new HashMap<String, String>();
		tMap.put("keyword", keyword);
		tMap.put("what", what);
		
		List<TrailsVo> trailList = meetingDao.searchTrail(tMap);
		
		return trailList;
	}
	
	//강아지 리스트
	public List<DogsVo> selectDogList(int userNo) {
		System.out.println("MeetingService.selectDogList()");

		List<DogsVo> dList = meetingDao.selectDogList(userNo);
		
		return dList;
	}
	
	//모임 등록
	public void insertMeeting(MeetingsVo mVo) {
		System.out.println("MeetingService.insertMeeting()");

		meetingDao.insertMeeting(mVo);
		
		List<Integer> dList = mVo.getDogNo();
		
		MeetingInfosVo miVo = new MeetingInfosVo();
		miVo.setMeetingNo(mVo.getMeetingNo());
		miVo.setUsersNo(mVo.getUserNo());
		
		for(int i = 0; i< dList.size(); i++) {
			
			miVo.setDogNo(dList.get(i));
			
			meetingDao.insertMeetingInfo(miVo);
		}
		

	}
	
	
	
}










