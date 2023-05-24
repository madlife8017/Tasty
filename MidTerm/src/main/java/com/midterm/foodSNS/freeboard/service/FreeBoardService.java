package com.midterm.foodSNS.freeboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.util.PageVO;

@Service
public class FreeBoardService implements IFreeBoardService {

	@Override
	public void regist(MfreeboardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MfreeboardVO> getList(PageVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(PageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MfreeboardVO getContent(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(MfreeboardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		
	}

}
