package com.midterm.foodSNS.reply.service;

import java.util.List;

import com.midterm.foodSNS.command.ReplyVO;

public interface IReplySerivce {

	void replyRegist(ReplyVO vo);//댓글 등록
	
	List<ReplyVO> getList(int bno, int pageNum); //목록 요청
	
	int getTotal(int bno);//댓글 개수(페이징, PageCreator는 사용하지 않습니다.)
	
	void update(ReplyVO vo);//댓글 수정
	
	void delete(int rno);//댓글 삭제
}
