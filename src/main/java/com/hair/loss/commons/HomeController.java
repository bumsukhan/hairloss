package com.hair.loss.commons;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController 
{
	@RequestMapping(value = "/loss/test.do", method = RequestMethod.GET)
	public String ajaxTest(Model model, HttpSession session) {
		String users_id = (String)session.getAttribute("users_id"); // 세션에 있는 users_id 가져온다.
		
		model.addAttribute("users_id", users_id);
		System.out.println("Welcome home! Test()");
		return "test";
	}
}
