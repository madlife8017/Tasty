package com.midterm.foodSNS.user.service;

import org.apache.ibatis.annotations.Param;

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
				
		//회원 정보 수정
		void updateMusers(MusersVO vo);
		
	
}
