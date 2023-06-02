package com.midterm.foodSNS.mypage.service;

import java.util.List;
import java.util.Map;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MusersVO;

public interface IMyPageService {
	
	List<MfreeboardArticleVO> getArticleList(String userId);

	List<MfreeboardImgVO> getImgList(String userId);

	void addFollowing(Map<String, String> map);	

	int checkFollowing(Map<String, String> map);

	void deleteFollowing(Map<String, String> map);

	

	List<MusersVO> countFollower(String userId);

	void addFollower(Map<String, String> map);

}
