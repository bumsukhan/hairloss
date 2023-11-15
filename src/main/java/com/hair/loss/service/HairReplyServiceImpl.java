package com.hair.loss.service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.loss.dao.HairReplyDAO;
import com.hair.loss.model.HairReplyVO;

@Service("hairReplyService")
public class HairReplyServiceImpl implements HairReplyService
{

	@Autowired
	private HairReplyDAO hrDAO;
	
	@Override
	public List<HairReplyVO> hairReplyList(BigInteger bnum) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bnum", bnum);
		System.out.println(paramMap.get("bnum"));
		
		return hrDAO.hairReplyList(paramMap);
	}

	@Override
	public void hairReplyInsert(HairReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		hrDAO.hairReplyInsert(vo);
	}

	@Override
	public void hairReplyUpdate(HairReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		hrDAO.hairReplyUpdate(vo);
	}

	@Override
	public void hairReplyDelete(BigInteger rnum) throws Exception {
		// TODO Auto-generated method stub
		hrDAO.hairReplyDelete(rnum);
	}

	@Override
	public int hairReplyCount(BigInteger bnum) throws Exception {
		// TODO Auto-generated method stub
		return hrDAO.hairReplyCount(bnum);
	}
	
}
