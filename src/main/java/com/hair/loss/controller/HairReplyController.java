package com.hair.loss.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hair.loss.model.HairReplyVO;
import com.hair.loss.service.HairReplyService;

@RestController
@RequestMapping("/hairReply")
public class HairReplyController
{
	@Resource(name="hairReplyService")
	private HairReplyService hiarService;
	
	// 댓글 목록
	@RequestMapping(value="/all/{bnum}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> HairReplyList(@PathVariable("bnum") BigInteger bnum)
	{
		try
		{
			Map<String, Object> map = new HashMap<String, Object>();

			List<HairReplyVO> hairReplyList = hiarService.hairReplyList(bnum);

			map.put("hairReplyList", hairReplyList);
			System.out.println(hairReplyList);
			
			return new ResponseEntity<>(map, HttpStatus.OK);
		}
		 catch(Exception e)
		{
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	
	// 댓글 작성
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> HairReplyInsert(@RequestBody HairReplyVO vo)
	{
		try
		{
			hiarService.hairReplyInsert(vo);
			return new ResponseEntity<>("ReplyRegisterOK", HttpStatus.OK);
		}
		 catch(Exception e)
		{
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	// 댓글 수정
	@RequestMapping(value="/{rnum}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> HairReplyUpdate(@PathVariable("renum") BigInteger renum,
												  @RequestBody HairReplyVO vo)
	{
		try
		{
			vo.setRenum(renum);
			hiarService.hairReplyUpdate(vo);
			return new ResponseEntity<>("ReplyUpdateOK", HttpStatus.OK);
		}
		 catch(Exception e)
		{
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	// 댓글 삭제
	@RequestMapping(value="/{rnum}", method = RequestMethod.DELETE)
	public ResponseEntity<String> HairReplyDelete(@PathVariable("renum") BigInteger renum)
	{
		try
		{
			hiarService.hairReplyDelete(renum);;
			return new ResponseEntity<>("ReplyDeleteOK", HttpStatus.OK);
		}
		 catch(Exception e)
		{
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
}
