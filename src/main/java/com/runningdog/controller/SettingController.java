package com.runningdog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		System.out.println(userNo);
		
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(userNo);
		//System.out.println(selectUser);
		
		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "m");
		
		return "setting/myProfile";
	}
	
	//내 정보 수정 "폼"
	@RequestMapping(value="/myProfileModifyForm", method={RequestMethod.GET, RequestMethod.POST})
	public String myProfileModify(HttpSession session,
		    					  Model model){
		System.out.println("SettingController.myProfileModifyForm()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();	
				
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(userNo);
		
		//System.out.println(selectUser);

		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "m");
		
		return "setting/myProfileModifyForm";
	}
	
	//내 정보 수정 "기능"
	@RequestMapping(value="/modifyMyProfile", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyMyProfile(@ModelAttribute UserVo userVo, 
								  @RequestParam(value="file") MultipartFile file,
								  HttpSession session){
		System.out.println("SettingController.modifyMyProfile()");
		
		int userNo = ((UserVo) session.getAttribute("authUser")).getUserNo();
		
		settingService.modifyMyProfile(userVo, userNo, file);
		
		return "redirect:/setting/myProfile";
	}
	
	
//	//유저 프로필 이미지 저장 (ajax)
//	@ResponseBody
//	@RequestMapping(value="/uploadMyProfileImg", method={RequestMethod.GET, RequestMethod.POST})
//	public String insertMyProfileImg(@RequestParam(value="file") MultipartFile file,
//			 						 HttpSession session){
//		System.out.println("SettingController.uploadMyProfileImg()");
//		
//		String id = ((UserVo) session.getAttribute("authUser")).getId();
//		
//		String saveName = settingService.uploadMyProfileImg(id, file);
//		
//		return saveName;
//	}
	
	
	//동네 검색 AJAX
	@ResponseBody
	@RequestMapping(value="/selectAddressList", method={RequestMethod.GET, RequestMethod.POST})
	public List<UserVo> selectAddressList(@RequestParam(value="keyword", required=false, defaultValue="") String keyword){
		System.out.println("SettingController.selectAddressList()");
		
		List<UserVo> addressList = settingService.selectAddressList(keyword);
		
		//System.out.println(addressList);
		
		return addressList;
	}
	
	
	
	//강아지 카드
	@RequestMapping("/dogList")
	public String dogList(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "dl");
		
		return "setting/dogList";
	}
	
	//강아지 추가
	@RequestMapping("/dogInsertForm")
	public String dogInsert(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "di");
		
		return "setting/dogInsertForm";
	}

	
	//강아지 수정
	@RequestMapping("/dogModifyForm")
	public String dogModify(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "dm");
		
		return "setting/dogModifyForm";
	}
	

	
	//친구 목록
	@RequestMapping("/friendList")
	public String friendList(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fl");
		
		return "setting/friendList";
	}

	//내가 받은 신청
	@RequestMapping("/friendAppliedForm")
	public String friendApplied(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fad");
		
		return "setting/friendAppliedForm";
	}
	
	//내가 한 신청
	@RequestMapping("/friendApplyForm")
	public String friendApply(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fa");
		
		return "setting/friendApplyForm";
	}
	
	//회원 검색
	@RequestMapping("/friendSearchForm")
	public String friendSearch(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fs");
		
		return "setting/friendSearchForm";
	}
	

	
	//회원 탈퇴
	@RequestMapping("/resignForm")
	public String resign(Model model){
		
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "r");
		
		return "setting/resignForm";
	}
	
}



