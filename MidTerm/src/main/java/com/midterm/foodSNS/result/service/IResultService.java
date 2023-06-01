package com.midterm.foodSNS.result.service;

import java.util.List;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;

public interface IResultService {
	
	//추천결과보여주기
	List<MRecipeVO> recommand(MSearchConditionVO vo);

	//레시피 상세보기
	MRecipeVO recipeDetail(int cooknum);

	//좋아요 수 가져오기
	int getLike(int cooknum);

	//좋아요 수 업데이트
	LikeVO updateLike(int cooknum, LikeVO vo);

}
