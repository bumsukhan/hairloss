package com.hair.loss.dao;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import com.hair.loss.commons.Criteria;
import com.hair.loss.model.HairGridBoardVO;

public interface HairGridBoardDAO {

	// 게시글 목록
	List<HairGridBoardVO> hairGridBoardList(Criteria criteria) throws Exception;
	
	// 게시글 갯수
	int hairGridBoardCount(Criteria creteria) throws Exception;
	
	int countArticles(Criteria creteria) throws Exception;
	
	// 게시글 작성 메소드
	void hairGridBoardInsert(HairGridBoardVO hbVO) throws Exception;
	
	// 게시글 상세보기 메소드
	HairGridBoardVO hairGridBoardDetail(BigInteger bnum);
	
	// 게시글 상세 보기 ajax
	// HairGridBoardVO hairGridBoardAjaxDetail(HairGridBoardVO hbVO) throws Exception;
	
	HairGridBoardVO hairPre(HairGridBoardVO hbVO);
	
	HairGridBoardVO hairNext(HairGridBoardVO hbVO);

	// 게시글 수정 메소드
	void hairGridBoardUpdate(HairGridBoardVO hbVO);
	
	// 게시글 삭제 메소드
	void hairGridBoardDelete(BigInteger bnum);
	
	// 파일 업로드
	void hairGridInsertFile(Map<String, Object> map);
	
	
	
}
