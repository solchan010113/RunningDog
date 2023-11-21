package com.runningdog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/walkmeeting")
@Controller
public class WalkMeetingController {
	
	@RequestMapping(value = "/meetinglist")
	public String meetingList(){
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
	
	@RequestMapping(value = "")
	public String home(){
		return "walkMeeting/walkMeetingHome";
	}
	
	@RequestMapping(value = "/clublist")
	public String clubList(){
		return "walkMeeting/clubList";
	}

	
	@RequestMapping(value = "/clubauthority")
	public String clubAuthority(){
		return "walkMeeting/clubAuthority";
	}
	
	@RequestMapping(value = "/boardsetting")
	public String boardSetting(){
		return "walkMeeting/clubBoardSetting";
	}
	
	@RequestMapping(value = "/club")
	public String club(){
		return "walkMeeting/clubDetail";
	}
	
	@RequestMapping(value = "/clubinsert")
	public String clubInsert(){
		return "walkMeeting/clubInsert";
	}
	
	@RequestMapping(value = "/membersetting")
	public String memberSetting(){
		return "walkMeeting/clubMemberSetting";
	}
	
}
