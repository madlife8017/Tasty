package com.midterm.foodSNS.freeboard.mapper;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;

public interface IFreeBoardMapper {
	
	//개인게시물등록
	void registArticle(MfreeboardArticleVO avo);
	
	//개인게시물에 들어가는 이미지 저장
	void registImg(MfreeboardImgVO ivo);


	MfreeboardArticleVO getArticle(int faNum);

	

	List<MfreeboardImgVO> getCarousel(int faNum);

	void delete(int faNum);

	void deleteimg(int iNum);


}
