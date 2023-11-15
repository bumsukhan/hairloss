package com.hair.loss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hair.loss.model.HairUserVO;
/**
 * ==================================================================================
 * 
 * @Class Name : BaseController.java
 * @Discription : 기본 컨트롤러
 * 
 * @Modification Information
 * @
 * @ 수정일		           수정자                                            수정내용
 * @ ----------     ---------------		---------------------------------------------
 * @ 2019.08.26		Han Bum Suk			메인 컨트롤러 생성
 * @ 2019.09.01		Han Bum Suk			header파일과 footer 파일로 나눔.
 * @ 2019.09.01		Han Bum Suk			main에 있던 기능들 header.jsp로 이관.
 * @ 2019.09.01		Han Bum Suk			main에 carousel(슬라이드 이미지) 생성.
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
public class BaseController {
	/**
	 * @Discription 메인화면 페이지 이동
	 * @return main.jsp
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main()
	{
		return "main";
	} // End main
	
	@RequestMapping(value = "/_popup.do", method = RequestMethod.GET)
	public String popup(HairUserVO hvo, Model model, HttpSession session)
	{
		return "users/hair_users_login";
	}

} // mainController