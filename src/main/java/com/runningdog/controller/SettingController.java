package com.runningdog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.runningdog.service.SettingService;
import com.runningdog.vo.UserVo;

@Controller
@RequestMapping(value="/setting")
public class SettingController {

	@Autowired
	private SettingService settingService;
	
	//내 정보
	@RequestMapping(value="/myProfile", method={RequestMethod.GET, RequestMethod.POST})
	public String myProfile(HttpSession session,
						    Model model){
		System.out.println("SettingController.myProfile()");
		
		//세션에서 id 가져옴
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		String id = authUser.getId();
		
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(id);
		System.out.println(selectUser);
		
		model.addAttribute("selectUser", selectUser);
		
		return "setting/myProfile";
	}
	
	//내 정보 수정 "폼"
	@RequestMapping(value="/myProfileModify", method={RequestMethod.GET, RequestMethod.POST})
	public String myProfileModifyForm(HttpSession session,
		    					  Model model){
		System.out.println("SettingController.myProfileModify()");
		
		//세션에서 id 가져옴
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		String id = authUser.getId();
		
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(id);
		System.out.println(selectUser);
		
		model.addAttribute("selectUser", selectUser);
		
		return "setting/myProfileModify";
	}
	
	//내 정보 수정 "기능"
	@RequestMapping(value="/modifyMyProfile", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyMyProfile(){
		System.out.println("SettingController.modifyMyProfile()");
		
		
		
		return "redirect:/myProfileModify";
	}
	

	
	
	//강아지 카드
	@RequestMapping("/dogList")
	public String dogList(){
		
		return "setting/dogList";
	}
	
	//강아지 추가
	@RequestMapping("/dogInsert")
	public String dogInsert(){
		
		return "setting/dogInsert";
	}

	
	//강아지 수정
	@RequestMapping("/dogModify")
	public String dogModify(){
		
		return "setting/dogModify";
	}
	

	
	//친구 목록
	@RequestMapping("/friendList")
	public String friendList(){
		
		return "setting/friendList";
	}

	//내가 받은 신청
	@RequestMapping("/friendApplied")
	public String friendApplied(){
		
		return "setting/friendApplied";
	}
	
	//내가 한 신청
	@RequestMapping("/friendApply")
	public String friendApply(){
		
		return "setting/friendApply";
	}
	
	//회원 검색
	@RequestMapping("/friendSearch")
	public String friendSearch(){
		
		return "setting/friendSearch";
	}
	

	
	//회원 탈퇴
	@RequestMapping("/resign")
	public String resign(){
		
		return "setting/resign";
	}
	
}



