package com.midterm.foodSNS.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MusersVO;


public interface IUserService {

		//회원가입
		void join(MusersVO vo);
		
		//아이디 중복 확인
		int idCheck(String id); //SQL문 -> SELECT count(*) FROM users WHERE user_id = ?
		
		//로그인
		String login(@Param("id") String id, @Param("pw") String pw);
		
		//회원 정보 얻어오기
		MusersVO getInfo(MusersVO vo);
				
		
		
		
		
		
		//회원 정보 탈퇴
		void userDelete(MusersVO vo);
		
		//회원 정보 탈퇴를 위한 비밀번호 비교
		public int passChk(String pwinput,MusersVO vo) throws Exception;
		
		
		
		
		
		//회원 정보 수정
		void updateMusers(MusersVO vo);
		
		void profilemodify(MusersVO vo, MultipartFile file);
		
		MusersVO userInfo(@Param("id")String id);
		
		//회원 탈퇴
		void deleteMusers(MusersVO vo);


		MfreeboardImgVO registImg(MfreeboardImgVO ivo, MultipartFile file);

		MfreeboardImgVO load(int fiNum);
		
	
}
