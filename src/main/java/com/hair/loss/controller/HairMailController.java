package com.hair.loss.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hair.loss.model.HairMailVO;

@Controller
@RequestMapping("/test")
public class HairMailController {

	@RequestMapping(value="/doE")
	public ModelAndView hello() {
		ModelAndView view = new ModelAndView();
		view.setViewName("mailTest");
		view.addObject("name", "yeeun");

		System.out.println("test1");

		return view;
	}

	@RequestMapping(value="/doB")
	public String doC(@ModelAttribute("msg") String msg) {
		
		System.out.println("doC 메시지 :  " + msg);
		return "mailTest";
	}
	
	@RequestMapping(value="/doC")
	public String doD(Model model, HairMailVO vo) {
		vo.setName("mary");
		vo.setUserId("hahahaha");
		
		model.addAttribute("user", vo);
		
		return "mailTest";
	}
	
	@RequestMapping(value="/doD")
	public String doE(Model model) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("name", "friend");
		map.put("userId", "7979");
		
		model.addAttribute("map", map);
		return "mailTest";
	}
	
	@RequestMapping(value="/voidTest")
	public void doF() {
		System.out.println("url명과 매칭되는 jsp 실행");
	}
	
	@RequestMapping(value="/doF")
	@ResponseBody
	public String doG() {
		return "<html><body><h1>doF!! not jsp file!!</h1></body></html>";
	}
	
	/* 파라미터를 가져오는 방법*/
	@RequestMapping("/request")
	public String temp1(HttpServletRequest request)
	{
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		
		return "mailTest";
	}
	
	
}
