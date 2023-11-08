package com.runningdog.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.runningdog.vo.ShowLogVo;

@Repository
public class WalkBlogDao {

	@Autowired
	private SqlSession sqlSession;

	public String selectBlogOwner(String paramId) {

		return sqlSession.selectOne("walkBlog.selectBlogOwner", paramId);
	}
	
	public int  selectfollowerNum(String paramId) {
		
		return sqlSession.selectOne("walkBlog.selectFollowerNum", paramId);
		
	}
	
	
	public int  selectfollowingNum(String paramId) {
		
		return sqlSession.selectOne("walkBlog.selectFollowingNum", paramId);
		
	}
	
	public int  didIFollow(Map<String, String> map) {
		
		System.out.println("didIFollow");
		
		int fno = sqlSession.selectOne("walkBlog.didIFollow", map);
		
		
		if(fno == 0) {
			return 0;
		}
		else {
			return 1;
		}
		
	
		
		
	}

	public List<ShowLogVo> walkLogList(String paramId) {
		List<ShowLogVo> walkLogList = sqlSession.selectList("guestbook.walkLogList", paramId);
		
		return walkLogList;
	}
	
	

}
