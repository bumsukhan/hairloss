package com.hair.loss.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hair.loss.commons.Criteria;
import com.hair.loss.model.HairBoardVO;

// 사용할 메소드의 틀을 결정한다.
public interface HairBoardService
{
	// 게시글 목록
	List<HairBoardVO> hairBoardList(HairBoardVO hbVO) throws Exception;
	
	// 게시글 작성
	void hairBoardInsert(HairBoardVO hbVO, Map<String, Object> map ,HttpServletRequest request) throws Exception;
	
	// 게시글 상세 보기
	HairBoardVO hairBoardDetail(BigInteger bnum) throws Exception;
	
	// 게시글 수정
	void hairBoardUpdate(HairBoardVO hbVO) throws Exception;
	
	// 게시글 삭제
	void hairBoardDelete(BigInteger bnum) throws Exception;
	
	// 게시글 갯수
	int hairBoardCount(HairBoardVO hbVO) throws Exception;
	
} // End hbService