package com.runningdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.WalkBlogDao;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;
import com.runningdog.vo.WalkLogConImgVo;

@Service
public class WalkBlogService {
	
	@Autowired
	private WalkBlogDao walkBlogDao;

	public BlogInfoVo selectBlogInfo(String paramCode, int authUserNo) {
		
		System.out.println("selectBlogInfo");
		System.out.println(paramCode);
		System.out.println(authUserNo);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("paramCode",paramCode);
		map.put("authUserNo",authUserNo);
		
		BlogInfoVo blogInfoVo = new BlogInfoVo();
		
		Map<String, Object> ownerInfo = walkBlogDao.selectBlogOwner(map);
		
		System.out.println(ownerInfo);
		
		 blogInfoVo.setName((String)ownerInfo.get("NAME"));
		 System.out.println("name "+ blogInfoVo.getName());
		 
			/*
			 * blogInfoVo.setOwnerNo((Integer)(ownerInfo.get("USERNO")));
			 * System.out.println(blogInfoVo.getOwnerNo());
			 */
		 
		blogInfoVo.setOwnerNo(walkBlogDao.selectOwnerNo(paramCode));
		blogInfoVo.setAuthNo(authUserNo);
		System.out.println(blogInfoVo.getAuthNo());
		blogInfoVo.setParamCode(paramCode);
		System.out.println(blogInfoVo);
		
		blogInfoVo.setFollowerNum(walkBlogDao.selectfollowerNum(paramCode));
		
		blogInfoVo.setFollowingNum(walkBlogDao.selectfollowingNum(paramCode));
		
		
		blogInfoVo.setFollowNo(walkBlogDao.didIFollow2(map));
		
		blogInfoVo.setBannerSavename(walkBlogDao.selectBannerImg(paramCode));
		System.out.println(blogInfoVo.getBannerSavename());
		
		blogInfoVo.setMonthlyStatsThisMonth(walkBlogDao.getMonthlyStats(paramCode));
		blogInfoVo.setMonthlyStatsTotal(walkBlogDao.getTotalStats(paramCode));
		
		blogInfoVo.getMonthlyStatsThisMonth().setThisMonthStats(
		        blogInfoVo.getMonthlyStatsThisMonth().getWalkCountThisMonth(),
		        blogInfoVo.getMonthlyStatsThisMonth().getTotalDistanceThisMonth(),
		        blogInfoVo.getMonthlyStatsThisMonth().getTotalLogTimeThisMonth()
		    );
		    blogInfoVo.getMonthlyStatsTotal().setTotalStats(
		        blogInfoVo.getMonthlyStatsTotal().getWalkCountTotal(),
		        blogInfoVo.getMonthlyStatsTotal().getTotalDistanceTotal(),
		        blogInfoVo.getMonthlyStatsTotal().getTotalLogTimeTotal()
		    );

		
		
		return blogInfoVo; 
	}

	public List<ShowLogVo> walkLogList(String paramCode) {
		
		//기본정보가져오기
		List<ShowLogVo> walkLogList = walkBlogDao.walkLogList(paramCode);
		
		
		 // 각 walkLog에 대한 댓글 리스트 설정
        for (ShowLogVo walkLog : walkLogList) {
            List<ShowLogCmtVo> cmtList = walkBlogDao.getShowLogCmtList(walkLog.getWalkLogNo());
            walkLog.setShowLogCmtList(cmtList);
        }
        
        for (ShowLogVo walkLog : walkLogList) {
            List<WalkLogConImgVo> imageList = walkBlogDao.getShowLogImageList(walkLog.getWalkLogNo());
            walkLog.setImageList(imageList);
            System.out.println(imageList);
        }
		
		
       
		/*
		 * //1번글에는 1번댓글 리스트 가져오기
		 * 
		 * int walkLogNo= walkLogList.get(0).getWalkLogNo() 3
		 * 
		 * 3번글의 댓글리스트<-> getCmtList(3) walkLogNo.get(0).setShowLogCmtList(3번글의 댓글리스트);
		 * 
		 * 
		 * 
		 * no
		 */
		
		
		return walkLogList;
	}

	public void deleteWalkLog(int no) {
		
		walkBlogDao.deleteWalkLog(no);
		
	}

	public void addComment(ShowLogCmtVo comment) {
	    walkBlogDao.addComment(comment);
	}
	
	public void deleteComment(int walkLogCmtNo) {
	    walkBlogDao.deleteComment(walkLogCmtNo);
	}
	 
	public String toggleFollow(int followerNo, int followeeNo) {
	    Map<String, Integer> map = new HashMap<>();
	    map.put("followerNo", followerNo);
	    map.put("followeeNo", followeeNo);

	    int followStatus = walkBlogDao.didIFollow(map);

	    if (followStatus == 0) {
	        // Follow
	        walkBlogDao.insertFollow(map);
	    } else {
	        // Unfollow
	        walkBlogDao.deleteFollow(map);
	    }

	    return "success";
	}


}
