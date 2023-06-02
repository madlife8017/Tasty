package com.midterm.foodSNS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.midterm.foodSNS.command.ReplyVO;
import com.midterm.foodSNS.reply.service.IReplySerivce;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private IReplySerivce service;

	//댓글 작성
	@PostMapping("/regist/recipe")
	public String regist(@RequestBody ReplyVO vo) {
		service.replyRegist(vo);
		return "ok";
	}

	//목록 요청
	@GetMapping("/getList/recipe/{cooknum}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int cooknum, @PathVariable int pageNum) {
		log.info("cooknum" + cooknum);
		List<ReplyVO> list = service.getList(cooknum, pageNum);
		int total = service.getTotal(cooknum);
		log.info("list" + list);
		log.info("total: " + total);

		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //댓글 목록
		map.put("total", total); //댓글의 총 개수
		return map;
	}

	//댓글 수정 요청
	@PutMapping("/recipe/{rno}")
	public void update(@PathVariable int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);
		service.update(vo);
	}

	//댓글 삭제 요청
	@DeleteMapping("/recipe/{rno}")
	public void delete(@PathVariable int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);
		log.info("vo" + vo);
		service.delete(rno);
	}
}
