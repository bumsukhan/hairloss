package com.hair.loss.controller;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hair.loss.commons.Pagination;
import com.hair.loss.model.HairBoardVO;
import com.hair.loss.service.HairBoardService;

/**
 * ==================================================================================
 * 
 * @Class Name : HairBoardController.java
 * @Discription : 게시물 관련 컨트롤러
 * 
 * @Modification Information
 * @
 * @ 수정일		           수정자                                            수정내용
 * @ ----------     ---------------		---------------------------------------------
 * @ 2019.08.26		Han Bum Suk			메인 컨트롤러 생성 -> (BaseController.java로 변경)
 * @ 2019.08.26		Han Bum Suk			게시글 목록 Session 부분에서 헤맴.
 * @ 2019.08.26		Han Bum Suk			hairBoardList(게시글 목록) 메소드 완료
 * @ 2019.08.27		Han Bum Suk			게시글 작성 페이지 자바스크립트 작성에서 헤맴.
 * @ 2019.08.27		Han Bum Suk			hairBoardInsertForm(게시글 작성 페이지 이동) 메소드 완료
 * @ 2019.08.27		Han Bum Suk			hairBoardInsert(게시글 작성) 메소드 완료 
 * @ 2019.08.28		Han Bum Suk			hairBoardDetail (Ajax 처리 시도 했으나 에러 떠서 실패)
 * @ 2019.08.28		Han Bum Suk			hairBoardDetail(게시글 상세 보기) 메소드 완료 
 * @ 2019.08.28		Han Bum Suk			hairBoardDetail(게시글 상세 보기) GET -> POST로 변경 완료 
 * @ 2019.08.29		Han Bum Suk			hairBoardUpdate (Ajax 처리 중 ReturnType 때문에 fail 에러가 발생)
 * @ 2019.08.29		Han Bum Suk			hairBoardDelete (게시글 삭제)메소드 완료
 * @ 2019.08.30		Han Bum Suk			게시판 순번을 controller에 넘기는 방법 때문에 5시간 넘게 뻘짓함. 고침.
 * @ 2019.08.30		Han Bum Suk			hairBoardUpdate 문제 해결. void로 변경.
 * @ 2019.08.30		Han Bum Suk			게시글 작성, 상세보기 중 title 글자수 제한 스크립트 처리 완료
 * @ 2019.08.30		Han Bum Suk			게시글 작성, 상세보기 중 contents 내용 페이지 글자수 제한 스크립트 처리 완료
 * @ 2019.08.30		Han Bum Suk			게시글 작성 중 title 특수문자 제한 스크립트 처리.
 * @ 2019.08.31		Han Bum Suk			게시글 상세보기 ctrl, shift 키 막아버림.
 * @ 2019.08.31		Han Bum Suk			게시글 목록 중 번호를 bnum -> rownum 변경
 * @ 2019.08.31		Han Bum Suk			게시글 목록 중 제목이 길게 나오는 것 ServiceImpl에서 해결 하려 했으나, 구조상 실패.
 * @ 2019.08.31		Han Bum Suk			게시글 목록 중 제목이 길게 나오는 것을 Controller에서 해결 하려 했으나 실패.
 * @ 2019.09.01		Han Bum Suk			게시글 목록 중 제목이 길게 나오는 것을 substr 함수를 써서 mapper 파일에서 해결.
 * @ 2019.09.01		Han Bum Suk			css 작업으로 게시글 작성과 수정 디자인을 보기 좋게 바꿈.
 * @ 2019.09.01		Han Bum Suk			인터넷에 있는 Oracle 프로시저를 따라 했으나, 실패.
 * @ 2019.09.02		Han Bum Suk			공백 입력 시 &nbsp;가 입력 되서 찾아보니, service에서 그렇게 replace 시킨거였음. 오전 3시간 뻘짓. 
 * 
 * @author 	Han Bum Suk
 * @since 	2019.08.26
 * @version	1.0v
 * 
 * Copyright (C) by company All right reserved.
 * 
 * ==================================================================================
 */

@Controller
public class HairBoardController
{
	private static final Logger logger = LoggerFactory.getLogger(HairBoardController.class);
	
	// Service 클래스에 작성한 Alias와 동일하게 작성해서 맵핑 시킨다.
	@Resource(name="hairBoardService")
	private HairBoardService hairService;

	/**
	 * @Discription 게시판 목록 페이지 이동
	 * @param model
	 * @param vo
	 * @return hair_board_list.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairBoardList.do", method = RequestMethod.GET)
	public String hairBoardList(@RequestParam(defaultValue="1") int curPage, Model model, HairBoardVO hbVO, HttpSession session) throws Exception
	{
		String users_id = (String)session.getAttribute("users_id"); // 세션에 있는 users_id 가져온다.
		hbVO.setUsers_id(users_id); // hbVO의 setUsers_id 메소드에 접근해서 users_id를 저장한다.
		
		// 게시글 총 갯수
		int listCnt = hairService.hairBoardCount(hbVO); // 18개
		
		System.out.println(listCnt);
		
		// List 타입의 HairBoardVO 형식으로 hairService의 hairBoardist(hbVO) 메소드 결과를  hairBoardList 변수에 저장한다.
		List<HairBoardVO> hairBoardList =  hairService.hairBoardList(hbVO);
		
		model.addAttribute("hairBoardList", hairBoardList); // model 객체의 addAttribute 메소드에 key와 value 형식 저장한 상태로,
		model.addAttribute("listCnt", listCnt);
		
		return "board/hair_board_list"; // jsp 페이지로 리턴
	} // End hairBoardList Method
	
	/**
	 * @Discription 게시글 작성 페이지 이동
	 * @param model
	 * @param hbVO
	 * @param session
	 * @return board/hair_board_insert.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairBoardInsertForm.do", method = RequestMethod.GET)
	public String hairBoardInsertForm(Model model, HttpSession session) throws Exception
	{
		String users_id = (String)session.getAttribute("users_id"); // 세션에서 users_id를 가져와 users_id 변수에 담는다.
		model.addAttribute("users_id", users_id); // 모델에 담은채로
		
		return "board/hair_board_insert"; // jsp 페이지로 리턴한다.
	} // End hairBoardInsert Method
	
	/**
	 * @Discription 게시글 작성 처리 메소드
	 * @param model
	 * @param hbVO
	 * @param session
	 * @return redirect:/hairBoardList.do
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairBoardInsert.do", method = RequestMethod.POST)
	public String hairBoardInsert(Model model, Map<String, Object> map, HairBoardVO hbVO, HttpSession session, HttpServletRequest request) throws Exception
	{	
		String users_id = (String)session.getAttribute("users_id"); // 세션에서 users_id를 가져와 users_id 변수에 담는다.
		hbVO.setUsers_id(users_id); //vo에 담는다.
		hairService.hairBoardInsert(hbVO, map, request); // 서비스에 담은 정보를 저장(전송)한 채 실행 한다.
		
		return "redirect:/hairBoardList.do"; // hairBoardList.do로 이동한다.
	} // End hairBoardInsert Method
	
	/**
	 * @Discription 게시글 상세보기 페이지 이동
	 * @param session
	 * @return board/hair_board_detail.jsp
	 */
	@RequestMapping(value = "/hairBoardDetail.do", method = RequestMethod.POST)
	public String hairBoardDetail(Model model, HairBoardVO hbVO, HttpSession session) throws Exception
	{
		BigInteger bnum = hbVO.getBnum();
	
		// 서비스의 정보를 HiarBoardVO의 형식으로 hairBoardDetail 변수에 담는다.
		HairBoardVO hairBoardDetail = hairService.hairBoardDetail(bnum);
		
		model.addAttribute("hairBoardDetail", hairBoardDetail); // 모델에 담고,
		
		return "board/hair_board_detail"; // jsp 페이지로 이동한다.
	} // End hairBoardDetail Method

	/**
	 * @Discription 게시글 수정 처리 메소드(ajax 처리)
	 * @param model
	 * @param hbVO
	 * @param session
	 */
	@RequestMapping(value = "/hairBoardUpdate.do", method = RequestMethod.POST)
	@ResponseBody // ajax를 사용하기 위해서 json으로 변환 시키는 @ResponseBody를 지정한다.
	public void hairBoardUpdate(HairBoardVO hbVO, HttpSession session) throws Exception
	{
		 hairService.hairBoardUpdate(hbVO); // jsp 페이지로 이동
	} // End hairBoardUpdate Method
	
	/**
	 * @Discription 게시글 삭제 처리 메소드
	 * @param bnum
	 * @param model
	 * @param session
	 * @return redirect:/hairBoardList.do
	 */
	@RequestMapping(value = "/hairBoardDelete.do", method = RequestMethod.POST)
	public String hairBoardDelete(@RequestParam("bnum") BigInteger bnum, // @RequestParam로 view 페이지에서 전송한 bnum와 작성한 변수를 바인딩 시켜 준다.
			HttpSession session) throws Exception
	{
		hairService.hairBoardDelete(bnum); // 서비스에 처리를 하고,
		
		return "redirect:/hairBoardList.do"; // redirect/hairBoardList.do로 이동한다.
	} // End hairBoardDelete Method
	
} // End hbController