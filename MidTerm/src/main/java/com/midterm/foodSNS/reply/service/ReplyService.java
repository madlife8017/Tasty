package com.midterm.foodSNS.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.ReplyVO;
import com.midterm.foodSNS.reply.mapper.IReplyMapper;
import com.midterm.foodSNS.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReplyService implements IReplySerivce {

	@Autowired
	private IReplyMapper mapper;
	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCpp(5);
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("cooknum", bno);
		log.info("data "+data);
		log.info("getList data: " + mapper.getList(data));
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}


	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);

	}

}
