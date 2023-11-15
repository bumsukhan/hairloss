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

import com.hair.loss.commons.Criteria;
import com.hair.loss.commons.FileUtils;
import com.hair.loss.dao.HairGridBoardDAO;
import com.hair.loss.model.HairGridBoardVO;

@Service("hairGridBoardService")
public class HairGridBoardServiceImpl implements HairGridBoardService{

	private static final Logger logger = LoggerFactory.getLogger(HairGridBoardServiceImpl.class);
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private HairGridBoardDAO hbGridDAO;
	
	// 게시글 목록
	public List<HairGridBoardVO> hairGridBoardList(Criteria criteria) throws Exception {
		return hbGridDAO.hairGridBoardList(criteria);
	}
	
	// 게시글 갯수
	@Override
	public int hairGridBoardCount(Criteria creteria) throws Exception {
		// TODO Auto-generated method stub
		return hbGridDAO.hairGridBoardCount(creteria);
	}

	// 게시글 갯수
	@Override
	public int countArticles(Criteria creteria) throws Exception {
		// TODO Auto-generated method stub
		return hbGridDAO.countArticles(creteria);
	}
	
	/**
	 * 게시글 작성 메소드
	 */
	@Transactional
	@Override
	public void hairGridBoardInsert(HairGridBoardVO hbVO, Map<String, Object> map, HttpServletRequest request) throws Exception
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
		
		hbGridDAO.hairGridBoardInsert(hbVO);
		
/*		List<Map<String, Object>> list =
				fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i < size; i++)
		{
			hbGridDAO.hairGridInsertFile(list.get(i));
		}*/
	
	} // End hairBoardInsert Method

	/**
	 * 게시글 상세보기 메소드
	 */
	@Override
	public HairGridBoardVO hairGridBoardDetail(BigInteger bnum) throws Exception
	{
		return hbGridDAO.hairGridBoardDetail(bnum);
	} // End hairBoardDetail Method


	@Override
	public HairGridBoardVO hairPre(HairGridBoardVO hbVO) throws Exception
	{
		return hbGridDAO.hairPre(hbVO);
	}

	@Override
	public HairGridBoardVO hairNext(HairGridBoardVO hbVO) throws Exception
	{
		return hbGridDAO.hairNext(hbVO);
	}

	/**
	 * 게시글 수정 메소드
	 */
	@Transactional
	@Override
	public void hairGridBoardUpdate(HairGridBoardVO hbVO) throws Exception
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
		
		hbGridDAO.hairGridBoardUpdate(hbVO);
	} // End hairBoardUpdate Method

	/**
	 * 게시글 삭제 메소드
	 */
	@Transactional
	@Override
	public void hairGridBoardDelete(BigInteger bnum) throws Exception
	{
		hbGridDAO.hairGridBoardDelete(bnum);
	} // End hairBoardDelete Method
	
}
