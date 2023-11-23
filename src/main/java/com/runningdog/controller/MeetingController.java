package com.runningdog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runningdog.service.MeetingService;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.MeetingsVo;
import com.runningdog.vo.TrailsVo;
import com.runningdog.vo.UserVo;

@RequestMapping(value = "/walkmeeting")
@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService meetingService;
	
	//모임 리스트
	@RequestMapping(value="/meetinglist", method={RequestMethod.GET, RequestMethod.POST})
	public String meetingList(@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
							  @RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
							  Model model){
		System.out.println("MeetingController.meetingList()");
		
		Map<String, Object> meetingMap = meetingService.selectMeetingList(keyword, crtPage);
		model.addAttribute("meetingMap", meetingMap);
		
		return "walkMeeting/meetingList";
	}
	
	//모임 등록 페이지
	@RequestMapping(value = "/meetinginsert")
	public String meetingInsert(HttpSession session, Model model){
		System.out.println("MeetingController.meetingInsert()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		List<DogsVo> dogList = meetingService.selectDogList(userNo);
		
		model.addAttribute("dogList", dogList);
		
		return "walkMeeting/meetingInsert";
	}
	
	//산책로 검색 AJAX
	@ResponseBody
	@RequestMapping(value="/searchTrail", method={RequestMethod.GET, RequestMethod.POST})
	public List<TrailsVo> searchTrail(@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
									  @RequestParam(value="what", required=false, defaultValue="") String what){
		System.out.println("MeetingController.searchTrail()");
		
		List<TrailsVo> trailList = meetingService.searchTrail(what, keyword);
		
		return trailList;
	}
	
	//모임 등록 기능
	@RequestMapping(value = "/insertMeeting")
	public String insertMeeting(@ModelAttribute MeetingsVo mVo, HttpSession session){
		System.out.println("MeetingController.insertMeeting()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		mVo.setUserNo(userNo);
		
		//System.out.println(mVo);
		meetingService.insertMeeting(mVo);
		
		return "redirect:/walkmeeting/meetinglist";
	}
	
	
	@RequestMapping(value = "/meeting")
	public String meetingDetail(@RequestParam(value="no") int no){
		System.out.println("MeetingController.meetingDetail()");
		
		
		return "walkMeeting/meetingDetail";
	}
	
	
//////////////////////////////////////////////////////
	/*
	 * @RequestMapping(value = "") public String home(){ return
	 * "walkMeeting/walkMeetingHome"; }
	 * 
	 * @RequestMapping(value = "/clublist") public String clubList(){ return
	 * "walkMeeting/clubList"; }
	 * 
	 * 
	 * @RequestMapping(value = "/clubauthority") public String clubAuthority(){
	 * return "walkMeeting/clubAuthority"; }
	 * 
	 * @RequestMapping(value = "/boardsetting") public String boardSetting(){ return
	 * "walkMeeting/clubBoardSetting"; }
	 * 
	 * @RequestMapping(value = "/club") public String club(){ return
	 * "walkMeeting/clubDetail"; }
	 * 
	 * @RequestMapping(value = "/clubinsert") public String clubInsert(){ return
	 * "walkMeeting/clubInsert"; }
	 * 
	 * @RequestMapping(value = "/membersetting") public String memberSetting(){
	 * return "walkMeeting/clubMemberSetting"; }
	 */
}
