package com.hair.loss.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hair.loss.commons.Criteria;
import com.hair.loss.model.HairGridBoardVO;

public interface HairGridBoardService {

	// 게시글 목록
	List<HairGridBoardVO> hairGridBoardList(Criteria criteria) throws Exception;
	
	// 게시글 갯수
	int hairGridBoardCount(Criteria creteria) throws Exception;
	
	// 게시글 갯수
	int countArticles(Criteria creteria) throws Exception;
	
	// 게시글 작성
	void hairGridBoardInsert(HairGridBoardVO hbVO, Map<String, Object> map ,HttpServletRequest request) throws Exception;
	
	// 게시글 상세 보기
	HairGridBoardVO hairGridBoardDetail(BigInteger bnum) throws Exception;
	
	// 게시글 이전
	HairGridBoardVO hairPre(HairGridBoardVO hbVO) throws Exception;

	// 게시글 다음
	HairGridBoardVO hairNext(HairGridBoardVO hbVO) throws Exception;
	
	// 게시글 수정
	void hairGridBoardUpdate(HairGridBoardVO hbVO) throws Exception;
	
	// 게시글 삭제
	void hairGridBoardDelete(BigInteger bnum) throws Exception;
	
	
}
