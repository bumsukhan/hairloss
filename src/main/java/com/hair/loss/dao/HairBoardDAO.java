package com.hair.loss.dao;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hair.loss.model.HairBoardVO;

// 데이터베이스에 접근하는 클래스
public interface HairBoardDAO
{
	// 게시글 목록 메소드
	List<HairBoardVO> hairBoardList(HairBoardVO hbVO) throws Exception;
	
	// 게시글 작성 메소드
	void hairBoardInsert(HairBoardVO hbVO) throws Exception;
	
	// 게시글 상세보기 메소드
	HairBoardVO hairBoardDetail(BigInteger bnum);
	
	// 게시글 수정 메소드
	void hairBoardUpdate(HairBoardVO hbVO);
	
	// 게시글 삭제 메소드
	void hairBoardDelete(BigInteger bnum);
	
	// 게시글 갯수
	int hairBoardCount(HairBoardVO hbVO) throws Exception;

	// 파일 업로드
	void hairInsertFile(Map<String, Object> map);
	
} // End hbDAO