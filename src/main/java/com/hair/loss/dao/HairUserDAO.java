package com.hair.loss.dao;

import com.hair.loss.model.HairUserVO;

public interface HairUserDAO
{

	// Salt 체크
	String hairUserSalt(String users_id) throws Exception;
	
	// 로그인
	HairUserVO hairUserLogin(HairUserVO huVO) throws Exception;
	
	// 회원가입
	void hairUserJoin(HairUserVO huVO) throws Exception;
	
	// 아이디 중복 체크
	int hairUserIdCheck(String users_id) throws Exception;
	
	// 내 정보 보기 
	HairUserVO hairUserGetMyIfo(String users_id) throws Exception;
	
	// 내 정보 수정
	void hairUserMyInfo(HairUserVO huVO) throws Exception;
	
	// 회원 탈퇴
	void hairUserMembershipWithdraw(String users_id) throws Exception;
	
	// 아이디 찾기
	String hairUserFindId(HairUserVO huVO) throws Exception;
	
	// 비밀번호 찾기
	String hairUserFindPw(HairUserVO huVO) throws Exception;
} // End huDAO