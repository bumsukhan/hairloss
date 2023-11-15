package com.hair.loss.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hair.loss.commons.SecurityUtil;
import com.hair.loss.model.HairUserVO;
import com.hair.loss.service.HairUserService;

/**
 * ==================================================================================
 * 
 * @Class Name : HairUserController.java
 * @Discription : 사용자 관련 컨트롤러
 * 
 * @Modification Information
 * @
 * @ 수정일		           수정자                                            수정내용
 * @ ----------     ---------------		--------------------------------------------- 
 * @ 2019.08.27		Han Bum Suk			hairUserLogin (로그인)메소드 (GET, POST) 부분 완료 (유효성 검사 아직 안함) 문제 해결 x
 * @ 2019.08.27		Han Bum Suk			hairUserLogout (로그아웃)메소드 완료
 * @ 2019.08.28		Han Bum Suk			회원가입을 위해 DB의 내용과 vo의 내용 변경 후 매칭
 * @ 2019.08.28		Han Bum Suk			회원가입 Insert 쿼리 수정 완료
 * @ 2019.08.28		Han Bum Suk			회원가입 유효성 검사 체크 중 number 체크하는 함수 및  자바스크립트로 완료.
 * @ 2019.08.28		Han Bum Suk			회원가입 유효성 검사 체크 중 id 중복 체크 버튼을 누르지 않아도 가입이 되버림. 문제 해결 x
 * @ 2019.08.28		Han Bum Suk			회원가입 유효성 검사 중 아이디 작성란에 keyup 이벤트를 통해 특수문자 구별 스크립트 작성. 완료.
 * @ 2019.08.28		Han Bum Suk			회원탈퇴 시 alert 창이 두번 뜸. 문제 해결 x
 * @ 2019.08.28		Han Bum Suk			id 중복 체크 Ajax로 실행 시 제대로 가져오지 못 하는 문제 발생. 문제해결 x.
 * @ 2019.08.29		Han Bum Suk			id 중복 체크  Ajax 코드 수정 완료(이전 버그는 아직 해결 못함.)
 * @ 2019.08.29		Han Bum Suk			hairUserMyInfoForm (내 정보 보기)메소드 완료
 * @ 2019.08.29		Han Bum Suk			내 정보 수정 메소드 ajax 처리 시 에러로 인해 페이지 이동으로 변경(추 후 Ajax 처리 해야됌.)
 * @ 2019.08.30		Han Bum Suk			hairUserMembershipWithdraw (회원탈퇴) 메소드 완료
 * @ 2019.08.30		Han Bum Suk			회원가입 유효성 검사 및 id 중복체크 문제 해결.(주민등록번호 유효성 검사는 안함)
 * @ 2019.08.30		Han Bum Suk			로그인 f5키 막아버림.(회원가입에서 f5를 막고, alert창이 뜬 상태로 f5를 누르면 굳어버리므로, 회원가입은 미처리) 
 * @ 2019.08.30		Han Bum Suk			내 정보보기 f5, f12키 막아버림. 
 * @ 2019.08.31		Han Bum Suk			아이디 찾기, 비밀번호 찾기 ajax 처리 했으나, 무조건 data의 결과가 하나만 출력 됌. (if문만 실행) 미처리. 
 * @ 2019.09.01		Han Bum Suk			내 정보 보기 ajax 처리 성공
 * @ 2019.09.01		Han Bum Suk			아이디 찾기, 비밀번호 찾기 문제 trim 함수로 if else 정상작동. 완료.
 * 
 * @author 	Han Bum Suk
 * @since 	2019.08.27
 * @version	1.0v
 * 
 * Copyright (C) by company All right reserved.
 * 
 * ==================================================================================
 */

@Controller
public class HairUserController
{
	@Resource(name = "hairUserService")
	private HairUserService huService;

	/**
	 * @Discription 로그인 페이지 이동 메소드
	 * @return users/hair_users_login.jsp
	 */
	@RequestMapping(value="/hairUserLoginForm.do", method = RequestMethod.GET)
	public String hairUserLogin() throws Exception
	{
		return "users/hair_users_login";
	} // End hairUserLogin Method

	/**
	 * @Discription 로그인 처리 메소드
	 * @param model
	 * @param huVO
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/hairUserLogin.do", method = RequestMethod.POST)
	public String hairUserLogin(Model model, HairUserVO huVO, HttpSession session, HttpServletResponse response) throws Exception // 메소드 오버로딩
	{	
		// users_id와 users_pw만 지정해서 보낼 수도 있지만,
		// 코드가 길어지므로 huVO를 바인딩 시켜준다.
		// HairUserVO 타입인 huLoginUsers에 service 결과를 담는다.
		HairUserVO huLoginUsers = huService.hairUserLogin(huVO);
		
		if (huLoginUsers.getFlag() == true) // huLoginUsers의 결과가 존재한다면,
		{
			session.setAttribute("users_id", (String)huLoginUsers.getUsers_id()); // users_id와
			session.setAttribute("users_role", huLoginUsers.getUsers_role()); // users_role을 세션에 담아둔다.
		}
		 else
		{
			model.addAttribute("msg", "아이디나 비밀번호를 확인 하세요."); // msg라는 key에 값을 담아서,
			return "users/hair_users_login"; // view 페이지로 이동한다.
		}
		return "return"; // return.jsp로 이동
	} // End hairUserLogin Method

	/**
	 * @Discription 로그아웃 처리 메소드
	 * @param session
	 * @return return.jsp
	 */
	@RequestMapping(value = "/hairUserLogout.do", method = RequestMethod.GET)
	public String hairUserLogout(HttpSession session) throws Exception
	{
		session.invalidate(); // 세션을 끊어버린다.
		return "redirect:/main.do"; // return.jsp로 이동
	} // End hairUserLogout Method

	/**
	 * @Discription 회원가입 페이지 이동 메소드
	 * @param huVO
	 * @return users/hair_users_join.jsp
	 */
	@RequestMapping(value = "/hairUserJoinForm.do", method = RequestMethod.GET)
	public String hairUserJoinForm(HairUserVO huVO) throws Exception
	{
		return "users/hair_users_join";
	} // End hairUserJoinForm Method

	/**
	 * @Discription 회원가입 처리 메소드
	 * @param huVO
	 * @return return.jsp
	 */
	@RequestMapping(value = "/hairUserJoin.do", method = RequestMethod.POST)
	public String hairUserJoin(HairUserVO huVO, HttpSession session, Model model) throws Exception
	{
		
		String users_id = huVO.getUsers_id();
		if (users_id.indexOf("admin") != -1) {
			huVO.setUsers_role(0);
		} else {
			huVO.setUsers_role(1);
		}

		String salt = SecurityUtil.getSalt();
		huVO.setSalt(salt);
		huVO.setUsers_pw(SecurityUtil.encrytSHA256(huVO.getUsers_pw(), salt));
		huVO.setUsers_jumin(SecurityUtil.encrytSHA256(huVO.getUsers_jumin()));
		
		huService.hairUserJoin(huVO);
		model.addAttribute("users_id", users_id);
		
		session.setAttribute("users_id", users_id); // users_id와
		session.setAttribute("users_role", huVO.getUsers_role()); // users_role을 세션에 담아둔다.
		
		return "redirect:/main.do";
	} // End hairUserJoin Method

	/**
	 * @Discription 아이디 중복 체크 처리 메소드
	 * @param users_id
	 * @return result
	 */
	@RequestMapping(value = "/hairUserIdCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int hairUserIdCheck(@RequestParam("users_id") String users_id) throws Exception
	{
		int result = huService.hairUserIdCheck(users_id);
		
		return result;
	} // End hairUserIdCheck Method

	/**
	 * @Discription 내 정보 보기 페이지 이동 메소드
	 * @param huVO
	 * @return users/hair_users_my_info.jsp
	 */
	@RequestMapping(value = "/hairUserMyInfoForm.do", method = RequestMethod.GET)
	public String hairUserMyInfoForm(HttpSession session, Model model) throws Exception
	{
		String users_id = (String) session.getAttribute("users_id");
		HairUserVO hairUserGetMyInfo = huService.hairUserGetMyIfo(users_id);
		
		model.addAttribute("hairUserGetMyInfo", hairUserGetMyInfo);
		return "users/hair_users_my_info";
	} // End hairUserMyInfoForm Method

	/**
	 * @Discription 내 정보 수정 처리 메소드
	 * @param huVO
	 * @param model
	 * @param session
	 * @return users/hair_users_my_info.jsp
	 */
	@RequestMapping(value = "/hairUserMyInfo.do", method = RequestMethod.POST)
	public String hairUserMyInfo(HairUserVO huVO, Model model, HttpSession session) throws Exception
	{
		String users_id = (String)session.getAttribute("users_id");
		huVO.setUsers_id(users_id);

		huService.hairUserMyInfo(huVO);

		HairUserVO hairUserGetMyInfo = huService.hairUserGetMyIfo(users_id);
		model.addAttribute("hairUserGetMyInfo", hairUserGetMyInfo);
		model.addAttribute("msg", "수정 성공!"); // 에러메시지 자바로 처리

		return "users/hair_users_my_info";
	} // End hairUserMyInfo Method

	/**
	 * @Discription 회원탈퇴 메소드
	 * @param huVO
	 * @param session
	 * @return return.jsp
	 */
	@RequestMapping(value = "/hairUserMembershipWithdraw.do", method = RequestMethod.GET)
	public String hairUserMembershipWithdraw(HairUserVO huVO, HttpSession session) throws Exception
	{
		String users_id = (String)session.getAttribute("users_id"); // 세션에 저장된 users_id를 가져와 담는다.
		huService.hairUserMembershipWithdraw(users_id);
		
		session.invalidate(); // 세션의 정보를 강제적으로 제거 한다.
		
		return "return"; // return 페이지로 이동
	} // End hairUserMembershipWithdraw Method
	
	/**
	 * @Discription 아이디 찾기 페이지 이동 메소드
	 * @return users/hair_users_find_id
	 */
	@RequestMapping(value = "/hairUserFindIdForm.do", method = RequestMethod.GET)
	public String hairUserFindId()
	{
		return "users/hair_users_find_id";
	}
	
	/**
	 * @Discription 아이디 찾기 메소드
	 * @param model
	 * @param huVO
	 * @param session
	 * @return users/hair_users_find_id.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairUserFindId.do", method = RequestMethod.GET)
	@ResponseBody
	public String hairUserFindId(Model model, HairUserVO huVO, HttpSession session) throws Exception
	{	
		String users_id = huService.hairUserFindId(huVO);
		
		if (users_id != null)
		{
			model.addAttribute("msg", users_id);
			return users_id;
		}
		 else
		{
			model.addAttribute("msg", users_id);
			return users_id;
		}
	} // End hairUserFindId Method

	/**
	 * @Discription 비밀번호 찾기 페이지 이동 메소드
	 * @return users/hair_users_find_id
	 */
	@RequestMapping(value = "/hairUserFindPwForm.do", method = RequestMethod.GET)
	public String hairUserFindPw(HairUserVO hvo, Model model)
	{
		String users_id = hvo.getUsers_id();
		if (users_id != null)
		{
			model.addAttribute("users_id", users_id);
		}
		return "users/hair_users_find_pw";
	}
	
	/**
	 * @Discription 비밀번호 찾기 메소드
	 * @param model
	 * @param huVO
	 * @param session
	 * @return users/hair_users_find_pw.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "/hairUserFindPw.do", method = RequestMethod.GET)
	@ResponseBody
	public String hairUserFindPw(Model model, HairUserVO huVO, HttpSession session) throws Exception
	{
		String users_pw = huService.hairUserFindPw(huVO);
		
		if (users_pw != null)
		{
			model.addAttribute("msg", users_pw);
			return users_pw;
		}
		 else
		{
			model.addAttribute("msg", "동일한 정보의 아이디가 없습니다.");
			return users_pw;
		}

	} // End hairUserFindPw Method
} // End huController