package com.midterm.foodSNS.result.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;

public interface IResultMapper {

	List<MRecipeVO> recommand(MSearchConditionVO vo);
	
	//레시피 상세보기
	MRecipeVO recipeDetail(int cooknum);

	//좋아요 수 가져오기
	int getLike(int cooknum);

	//좋아요 이미 했는지 확인
	int chkLike(LikeVO vo);

	//좋아요 추가
	void insertLike(LikeVO vo);

	//좋아요 삭제
	void deleteLike(LikeVO vo);
}
