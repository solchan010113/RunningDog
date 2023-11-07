package com.runningdog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.BlogInfoVo;

@Repository
public class WalkBlogDao {

	@Autowired
	private SqlSession sqlSession;

	public String selectBlogOwner(String id) {

		return sqlSession.selectOne("walkBlog.selectBlogOwner", id);
	}
	
	public int  selectfollowerNum(String id) {
		
		return sqlSession.selectOne("walkBlog.selectFollowerNum", id);
		
	}
	
	
	public int  selectfollowingNum(String id) {
		
		return sqlSession.selectOne("walkBlog.selectFollowingNum", id);
		
	}
	
	

}
