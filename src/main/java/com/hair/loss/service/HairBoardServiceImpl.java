package com.hair.loss.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hair.loss.commons.FileUtils;
import com.hair.loss.dao.HairBoardDAO;
import com.hair.loss.model.HairBoardVO;

// Service에서 작성 한 메소드를 구체적으로 구현 하기 위한 클래스.

// 여기서 서비스 할거에요! 라는 의미의 @Service 어노테이션 작성하고,
// 이 클래스를 식별하기 위한 별칭 작성.
@Service("hairBoardService")
public class HairBoardServiceImpl implements HairBoardService
{
	
	private static final Logger logger = LoggerFactory.getLogger(HairBoardServiceImpl.class);
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private HairBoardDAO hbDAO;

	/**
	 * 게시글 목록 메소드
	 */
	@Override
	public List<HairBoardVO> hairBoardList(HairBoardVO hbVO) throws Exception
	{
		return hbDAO.hairBoardList(hbVO);
	} // End hairBoardList Method
	
	/**
	 * 게시글 작성 메소드
	 */
	@Transactional
	@Override
	public void hairBoardInsert(HairBoardVO hbVO, Map<String, Object> map, HttpServletRequest request) throws Exception
	{
		
		String title = hbVO.getTitle()
				.replaceAll("<", "&lt;")
				.replaceAll(">", "&gt;")
				.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		hbVO.setTitle(title);

		String contents = hbVO.getContents()
						.replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;")
						.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		hbVO.setContents(contents);
		
		hbDAO.hairBoardInsert(hbVO);
		
/*		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i < size; i++)
		{
			hbDAO.hairInsertFile(list.get(i));
		}*/
	
	} // End hairBoardInsert Method

	/**
	 * 게시글 상세보기 메소드
	 */
	@Override
	public HairBoardVO hairBoardDetail(BigInteger bnum) throws Exception
	{
		return hbDAO.hairBoardDetail(bnum);
	} // End hairBoardDetail Method

	/**
	 * 게시글 수정 메소드
	 */
	@Transactional
	@Override
	public void hairBoardUpdate(HairBoardVO hbVO) throws Exception
	{
		String title = hbVO.getTitle()
				.replaceAll("<", "&lt;")
				.replaceAll(">", "&gt;")
				.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		hbVO.setTitle(title);

		String contents = hbVO.getContents()
						.replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;")
						.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		hbVO.setContents(contents);
		
		hbDAO.hairBoardUpdate(hbVO);
	} // End hairBoardUpdate Method

	/**
	 * 게시글 삭제 메소드
	 */
	@Transactional
	@Override
	public void hairBoardDelete(BigInteger bnum) throws Exception
	{
		hbDAO.hairBoardDelete(bnum);
	} // End hairBoardDelete Method

	/**
	 * 게시글 갯수 메소드
	 */
	@Override
	public int hairBoardCount(HairBoardVO hbVO) throws Exception
	{
		return hbDAO.hairBoardCount(hbVO);
	} // End hairBoardCount Method
	
	
	
} // End hbServiceImpl