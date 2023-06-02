package com.midterm.foodSNS.freeboard.mapper;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.util.PageVO;

public interface IFreeBoardMapper {
	
	//개인게시물등록
	void registArticle(MfreeboardArticleVO avo);
	
	//개인게시물에 들어가는 이미지 저장
	void registImg(MfreeboardImgVO ivo);


	MfreeboardArticleVO getArticle(int faNum);

	

	List<MfreeboardImgVO> getCarousel(int faNum);

	void delete(int faNum);

	void deleteimg(int iNum);

	//레시피 등록
	void uploadRecipe(MfreeboardVO vo);

	//레시피 가져오기
	List<MfreeboardVO> getArticleList(String userId);


}
