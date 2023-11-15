package com.hair.loss.commons;

import com.hair.loss.model.HairBoardVO;

public class Criteria extends HairBoardVO{

	private int page; // 페이지 번호
	private int perPageNum; // 페이지당 갯수
	
	private String searchType;
	private String keyword;
	
	// 클래스 초기화
	public Criteria()
	{
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPageStart() 
	{
		return (this.page - 1) * perPageNum;
	}
	
	public int getPage()
	{
		return page;
	}
	
	public void setPage(int page)
	{
		if (page <= 0)
		{
			this.page = 1;
		}
		 else
		{
			 this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPAgeNum(int perPageNum)
	{
		if (perPageNum <=0 || perPageNum > 100)
		{
			this.perPageNum = 10;
		}
		 else
		{
			 this.perPageNum = perPageNum;
		}
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}

	
	
}
