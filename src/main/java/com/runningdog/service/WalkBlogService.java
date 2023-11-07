package com.runningdog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.WalkBlogDao;
import com.runningdog.vo.BlogInfoVo;

@Service
public class WalkBlogService {
	
	@Autowired
	private WalkBlogDao walkBlogDao;

	public BlogInfoVo selectBlogInfo(String id) {
		
		BlogInfoVo blogInfoVo = new BlogInfoVo();
		
		blogInfoVo.setName(walkBlogDao.selectBlogOwner(id));
		
		
		blogInfoVo.setFollowerNum(walkBlogDao.selectfollowerNum(id));
		
		blogInfoVo.setFollowingNum(walkBlogDao.selectfollowingNum(id));
		
		
		return blogInfoVo; 
	}



}
