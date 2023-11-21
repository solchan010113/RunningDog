package com.runningdog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.runningdog.service.MeetingService;
import com.runningdog.vo.MeetingsVo;

@RequestMapping(value = "/walkmeeting")
@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping(value="/meetinglist", method={RequestMethod.GET, RequestMethod.POST})
	public String meetingList(Model model){
		System.out.println("SettingController.selectAddressList()");
		
		List<MeetingsVo> meetingList = meetingService.selectMeetingList();
		model.addAttribute("meetingList", meetingList);
		
		return "walkMeeting/meetingList";
	}
	
	
	@RequestMapping(value = "/meetinginsert")
	public String meetingInsert(){
		return "walkMeeting/meetingInsert";
	}
	
	
	@RequestMapping(value = "/meeting")
	public String meetingDetail(){
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
