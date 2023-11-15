package com.hair.loss.dao;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import com.hair.loss.model.HairBoardVO;
import com.hair.loss.model.HairReplyVO;

// 데이터베이스에 접근하는 클래스
public interface HairReplyDAO
{
	List<HairReplyVO> hairReplyList(Map<String, Object> paramMap) throws Exception;
	
	void hairReplyInsert(HairReplyVO vo) throws Exception;

	void hairReplyUpdate(HairReplyVO vo) throws Exception;
	
	void hairReplyDelete(BigInteger rnum) throws Exception;
	
	int hairReplyCount(BigInteger bnum) throws Exception;
	
} // End hbDAO