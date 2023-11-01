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
	
	@RequestMapping( "/setting/familyAdd")
	public String familyAdd(){
		return "setting/familyAdd";
	}
	
	@RequestMapping( "/setting/familyList")
	public String familyList(){
		return "setting/familyList";
	}
	
	@RequestMapping( "/setting/familyRequest")
	public String familyRequest(){
		return "setting/familyRequest";
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
