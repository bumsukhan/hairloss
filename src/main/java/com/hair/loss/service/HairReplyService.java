package com.hair.loss.service;

import java.math.BigInteger;
import java.util.List;

import com.hair.loss.model.HairReplyVO;

public interface HairReplyService
{
	List<HairReplyVO> hairReplyList(BigInteger bnum) throws Exception;
	
	void hairReplyInsert(HairReplyVO vo) throws Exception;

	void hairReplyUpdate(HairReplyVO vo) throws Exception;
	
	void hairReplyDelete(BigInteger renum) throws Exception;
	
	int hairReplyCount(BigInteger bnum) throws Exception;
	
}
