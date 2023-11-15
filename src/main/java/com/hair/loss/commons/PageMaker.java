package com.hair.loss.commons;

public class PageMaker {

	private int totalCount = 0; // 전체 게시글 갯수 
	private int displayPageNum = 10; // 페이지 번호의 갯수
	private int startPage = 0; // 시작 페이지 수
	private int endPage = 0; // 끝 페이지 수
	private boolean prev = false; // 이전
	private boolean next = false; // 다음

	private Criteria criteria;
	
	public void setCriteria(Criteria criteria)
	{
		this.criteria = criteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
	// 끝 페이지 번호 = Math.cell(현재 페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수
	endPage = (int)(Math.ceil(criteria.getPage()/ (double)displayPageNum) * displayPageNum);

	// 시작 페이지 번호 = (끝 페이지 번호 - 페이지 번호의 갯수)
	startPage = endPage - displayPageNum + 1;
	
	// 끝 페이지 번호 보정 계산식
	// 끝 페이지 번호 = Math.cell(전체 게시글 갯수 / 페이지 당 출력할 게시글의 갯수)
	int tempEndPage = (int) (Math.ceil(totalCount / (double)criteria.getPerPageNum()));

	if(endPage > tempEndPage) {
		endPage = tempEndPage;
	}
	
	// 이전 = 시작페이지가 1이 맞으면 false처리, 아니면 true 처리
	prev = startPage == 1 ? false : true;
	// 다음 = 마지막 페이지 * 
	next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
	
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", displayPageNum=" + displayPageNum + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", criteria=" + criteria + "]";
	}
}
