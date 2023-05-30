package com.midterm.foodSNS.mypage.mapper;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardArticleVO;

public interface IMyPageMapper {
	
	List<MfreeboardArticleVO> getArticleList(String userId);
}
