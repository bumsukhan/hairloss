package com.hair.loss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hair.loss.commons.SecurityUtil;
import com.hair.loss.dao.HairUserDAO;
import com.hair.loss.model.HairUserVO;

@Service(value = "hairUserService")
public class HairUserServiceImpl implements HairUserService
{
	@Autowired
	private HairUserDAO huDAO;
	
	/**
	 * 로그인 처리 메소드
	 */
	// @Transactional은 내가 고객 입장이라고 생각하고, 잘못되면 빡칠만한 것에 작성한다.
	// interface에 작성해도 되긴 하지만, 트랜잭션이 정상 종료되지 않는 버그가 있으므로, 비즈니스 로직을 작성하는 메소드에 작성한다.
	@Transactional 
	@Override
	public HairUserVO hairUserLogin(HairUserVO huVO) throws Exception
	{
		// salt를 가져온다.
		String salt = huDAO.hairUserSalt(huVO.getUsers_id());
		
		// 입력한 값에 salt를 concat 한다.
		String rePw = SecurityUtil.encrytSHA256(huVO.getUsers_pw());
		huVO.setFlag(false);
		
		if (salt != null) {
			// 입력한 값에 Salt 값을 가져온다.
			String rstPw = rePw.concat(salt);
			huVO.setUsers_pw(rstPw);
			
			// DB에서 가져온 패스워드
			HairUserVO rstVO = huDAO.hairUserLogin(huVO);
			if (rstVO != null) {
				String rstRePw = rstVO.getUsers_pw();
				System.out.println("service의 rstVO = " + rstVO);
				

				if (rstPw.equals(rstRePw)) {
					huVO.setFlag(true);
				}
			}
		}
		return huVO;
	}
		
	/**
	 * 회원가입 처리 메소드
	 */
	@Transactional
	@Override
	public void hairUserJoin(HairUserVO huVO) throws Exception
	{
		huDAO.hairUserJoin(huVO);
	}
	
	/**
	 * 아이디 중복 체크 메소드
	 */
	@Override
	public int hairUserIdCheck(String users_id) throws Exception
	{
		return huDAO.hairUserIdCheck(users_id);
	}
	
	
	/**
	 * 내 정보 보기 메소드
	 */
	@Override
	public HairUserVO hairUserGetMyIfo(String users_id) throws Exception
	{
		return huDAO.hairUserGetMyIfo(users_id);
	}
	
	/**
	 * 내 정보 수정 처리 메소드
	 */
	@Transactional
	@Override
	public void hairUserMyInfo(HairUserVO huVO) throws Exception
	{
		huDAO.hairUserMyInfo(huVO);
	}

	/**
	 * 회원 탈퇴 메소드
	 */
	@Transactional
	@Override
	public void hairUserMembershipWithdraw(String users_id) throws Exception
	{
		huDAO.hairUserMembershipWithdraw(users_id);
	}

	/**
	 * 아이디 찾기
	 */
	@Override
	public String hairUserFindId(HairUserVO huVO) throws Exception
	{
		return huDAO.hairUserFindId(huVO);
	} // End hairUserFindId

	/**
	 * 비밀번호 찾기
	 */
	@Override
	public String hairUserFindPw(HairUserVO huVO) throws Exception
	{
		return huDAO.hairUserFindPw(huVO);
	} // End hairUserFindPw
} // End huServiceImpl