package com.hair.loss.controller;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hair.loss.commons.Criteria;
import com.hair.loss.commons.PageMaker;
import com.hair.loss.model.HairGridBoardVO;
import com.hair.loss.service.HairGridBoardService;

@Controller
public class HairGridBoardController {

	@Resource(name="hairGridBoardService")
	private HairGridBoardService hairGridservice;
	
	/**
	 * @Discription 페이지 목록 조회
	 * 
	 * @param criteria
	 * @param model
	 * @param hbVO
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gridboarList.do", method = RequestMethod.GET)
	public String hairGridBoardList(Criteria criteria
			, @RequestParam(required = false, defaultValue = "title") String searchType
			, @RequestParam(required = false) String keyword
			, Model model, HairGridBoardVO hbVO, HttpSession session) throws Exception
	{
		String users_id = (String)session.getAttribute("users_id"); // 세션에 있는 users_id 가져온다.
		hbVO.setUsers_id(users_id); // hbVO의 setUsers_id 메소드에 접근해서 users_id를 저장한다.

		
		criteria.setSearchType(searchType);
		criteria.setKeyword(keyword);
		
		// 게시글 총 갯수
		int listCnt = hairGridservice.hairGridBoardCount(criteria); // 18개
		
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(listCnt);
		
		// List 타입의 HairGridBoardVO 형식으로 hairService의 hairBoardist(hbVO) 메소드 결과를  hairBoardList 변수에 저장한다.
		List<HairGridBoardVO> gridboarList =  hairGridservice.hairGridBoardList(criteria);

		model.addAttribute("hairGridBoardLst", gridboarList); // model 객체의 addAttribute 메소드에 key와 value 형식 저장한 상태로,

		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pageMaker", pageMaker);
		
		return "gridBoard/gridBoardList"; // jsp 페이지로 리턴
	} // End hairBoardList Method
	
	/**
	 * 
	 * @Discription 상세페이지 이동
	 * @param model
	 * @param hbVO
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gridBoardDetail.do", method = RequestMethod.POST)
	public String hairGridBoardDetail(Model model, HairGridBoardVO hbVO, HttpSession session) throws Exception
	{
		BigInteger bnum = hbVO.getBnum();
	
		if ("pre".equals(hbVO.getFlag())) {
			HairGridBoardVO hairGridBoardDetail = hairGridservice.hairPre(hbVO);
			model.addAttribute("hairGridBoardDetail", hairGridBoardDetail); // 모델에 담고,
			System.out.println("이전");
		} else if ("next".equals(hbVO.getFlag())) {
			HairGridBoardVO hairGridBoardDetail = hairGridservice.hairNext(hbVO);
			model.addAttribute("hairGridBoardDetail", hairGridBoardDetail); // 모델에 담고,
			System.out.println("이후");
		} else {
		// 서비스의 정보를 HiarBoardVO의 형식으로 hairBoardDetail 변수에 담는다.
		}
		HairGridBoardVO hairGridBoardDetail = hairGridservice.hairGridBoardDetail(bnum);		
		model.addAttribute("hairGridBoardDetail", hairGridBoardDetail); // 모델에 담고,
		System.out.println("나머지");
		return "gridBoard/gridBoardDetail"; // jsp 페이지로 이동한다.
	} // End hairBoardDetail Method
	
	/**
	 * @Discription 게시글 상세페이지 이동(ajax 처리)
	 * @param model
	 * @param hbVO
	 * @param session
	 */
	/*@RequestMapping(value = "/gridAjaxBoardDetail.do", method = RequestMethod.POST)
	// @ResponseBody // ajax를 사용하기 위해서 json으로 변환 시키는 @ResponseBody를 지정한다.
	public String gridAjaxBoardDetail(HairGridBoardVO hbVO, Model model, HttpSession session) throws Exception
	{
		System.out.println("Controller 입성 : " + hbVO);
		// @RequestParam("bnum") BigInteger bnum
		if ("pre".equals(hbVO.getFlag())) {
			HairGridBoardVO hairGridBoardDetail = hairGridservice.hairPre(hbVO);
			model.addAttribute("hairGridBoardDetail", hairGridBoardDetail); // 모델에 담고,
			
		} else if ("next".equals(hbVO.getFlag())) {
			HairGridBoardVO hairGridBoardDetail = hairGridservice.hairNext(hbVO);
			model.addAttribute("hairGridBoardDetail", hairGridBoardDetail); // 모델에 담고,
		}
		
		return "gridBoard/gridBoardDetail"; // jsp 페이지로 이동한다.
	} // End hairBoardUpdate Method
*/	
	
	/**
	 * @Discription 게시글 작성 페이지 이동
	 * @param model
	 * @param hbVO
	 * @param session
	 * @return board/hair_board_insert.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairGridBoardInsertForm.do", method = RequestMethod.GET)
	public String hairGridBoardInsertForm(Model model, HttpSession session) throws Exception
	{
		String users_id = (String)session.getAttribute("users_id"); // 세션에서 users_id를 가져와 users_id 변수에 담는다.
		model.addAttribute("users_id", users_id); // 모델에 담은채로
		
		return "gridBoard/gridBoardInsert"; // jsp 페이지로 리턴한다.
	} // End hairBoardInsert Method
	
	/**
	 * @Discription 게시글 작성 처리 메소드
	 * @param model
	 * @param hbVO
	 * @param session
	 * @return redirect:/hairBoardList.do
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairGridBoardInsert.do", method = RequestMethod.POST)
	public String hairBoardInsert(Model model, Map<String, Object> map, HairGridBoardVO hbVO, HttpSession session, HttpServletRequest request) throws Exception
	{	
		String users_id = (String)session.getAttribute("users_id"); // 세션에서 users_id를 가져와 users_id 변수에 담는다.
		hbVO.setUsers_id(users_id); //vo에 담는다.
		hairGridservice.hairGridBoardInsert(hbVO, map, request); // 서비스에 담은 정보를 저장(전송)한 채 실행 한다.
		
		return "redirect:/gridboarList.do"; // gridboarList.do로 이동한다.
	} // End hairBoardInsert Method
	

	/**
	 * @Discription 게시글 수정 처리 메소드(ajax 처리)
	 * @param model
	 * @param hbVO
	 * @param session
	 */
	@RequestMapping(value = "/hairGridBoardUpdate.do", method = RequestMethod.POST)
	@ResponseBody // ajax를 사용하기 위해서 json으로 변환 시키는 @ResponseBody를 지정한다.
	public void hairGridBoardUpdate(HairGridBoardVO hbVO, HttpSession session) throws Exception
	{
		hairGridservice.hairGridBoardUpdate(hbVO); // jsp 페이지로 이동
	} // End hairBoardUpdate Method
	
	/**
	 * @Discription 게시글 삭제 처리 메소드
	 * @param bnum
	 * @param model
	 * @param session
	 * @return redirect:/hairBoardList.do
	 */
	@RequestMapping(value = "/hairGridBoardDelete.do", method = RequestMethod.POST)
	public String hairGridBoardDelete(@RequestParam("bnum") BigInteger bnum, // @RequestParam로 view 페이지에서 전송한 bnum와 작성한 변수를 바인딩 시켜 준다.
			HttpSession session) throws Exception
	{
		hairGridservice.hairGridBoardDelete(bnum); // 서비스에 처리를 하고,
		
		return "redirect:/gridboarList.do"; // redirect/gridboarList.do로 이동한다.
	} // End hairBoardDelete Method
	
}
