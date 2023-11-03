package com.runningdog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {


	@RequestMapping( "/loginForm")
	public String loginForm(){
		return "login/loginForm";
	}
	
	@RequestMapping( "/joinForm")
	public String joinForm(){
		return "login/joinForm";
	}	
	
	@RequestMapping( "/")
	public String main(){
		return "main/main";
	}	
	
	@RequestMapping( "/setting/dogInsert")
	public String dogInsert(){
		return "setting/dogInsert";
	}
	
	@RequestMapping( "/setting/dogList")
	public String dogList(){
		return "setting/dogList";
	}
	
	@RequestMapping( "/setting/dogModify")
	public String dogModify(){
		return "setting/dogModify";
	}
	
	
	@RequestMapping( "/setting/friendSearch")
	public String friendSearch(){
		return "setting/friendSearch";
	}
	
	@RequestMapping( "/setting/friendList")
	public String friendList(){
		return "setting/friendList";
	}
	
	@RequestMapping( "/setting/friendApply")
	public String friendApply(){
		return "setting/friendApply";
	}
	
	@RequestMapping( "/setting/friendApplied")
	public String friendApplied(){
		return "setting/friendApplied";
	}
	
	
	@RequestMapping( "/setting/myProfile")
	public String myProfile(){
		return "setting/myProfile";
	}
	
	@RequestMapping( "/setting/myProfileModify")
	public String myProfileModify(){
		return "setting/myProfileModify";
	}
	
	@RequestMapping( "/setting/resign")
	public String resign(){
		return "setting/resign";
	}
	
	
}
