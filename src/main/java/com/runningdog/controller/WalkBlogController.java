package com.runningdog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.runningdog.service.WalkBlogService;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.UserVo;

@RequestMapping(value="/walkBlog")
@Controller
public class WalkBlogController {
	
	
	@Autowired
	private WalkBlogService walkBlogService;
	
	
	
	
	@RequestMapping(value = "home")
	public String home(HttpSession session) {
		
		UserVo authuser = (UserVo) session.getAttribute("authUser");
		
		System.out.println(authuser);
		
		
		return"walkBlog/walkBlogHome";
		
	
		
	}
	
	@RequestMapping(value = "/{id}", method = { RequestMethod.GET,RequestMethod.POST }) 
	public String userBlog(@PathVariable (value="id") String id, Model model) {
		
		BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(id);
		
		System.out.println(blogInfoVo);
		
		  model.addAttribute("blogInfoVo", blogInfoVo);
		
		
		
		return"walkBlog/userBlog";
	}
	
	@RequestMapping(value = "detail")
	public String detail() {
		return"walkBlog/detail";
	}
	
}
