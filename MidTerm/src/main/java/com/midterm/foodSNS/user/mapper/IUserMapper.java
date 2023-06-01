package com.midterm.foodSNS.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.util.MDBVO;
import com.midterm.foodSNS.util.MDBVOList;
import com.midterm.foodSNS.util.PageVO;

public interface IUserMapper {

	
	//회원가입을 진행할 때, 필요한 메서드를 적는 공간
	
	//회원가입
	void join(MusersVO vo);
	
	//아이디 중복 확인
	int idCheck(String id); //SQL문 -> SELECT count(*) FROM users WHERE user_id = ?
	
	//로그인
	String login(@Param("id") String id);
	
	//회원 정보 얻어오기
	MusersVO getInfo(MusersVO vo);
	
	
	
	
	//회원 정보 탈퇴
	void userDelete(MusersVO vo);
	
	//회원 정보 탈퇴를 위한 비밀번호 비교
	int passChk(String pwinput) throws Exception;
	
	
	
	
	//회원 정보 수정
	void updateMusers(MusersVO vo);
	
	//간단 프로필 수정
	void profilemodify(MusersVO vo);

	MusersVO userInfo(String id);

	void dbRegist(MDBVOList responseData);

	//게시글 작성
	void test(MfreeboardVO vo);
	
	//게시판 list 받아오기
	List<MfreeboardVO> getList(PageVO vo);
}
