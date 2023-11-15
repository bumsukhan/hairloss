package com.hair.loss.model;

import java.math.BigInteger;
import java.sql.Date;

import com.hair.loss.commons.Pagination;

public class HairBoardVO
{

	private BigInteger rnum; // rownum
	private BigInteger bnum; // 게시글 번호
	private BigInteger fnum; // 파일 번호
	private BigInteger cnt;  // 조회수
	private String title; 	 // 게시글 제목
	private String contents; // 게시글 내용
	private Date regdate; 	 // 게시글 작성일
	private String users_id; // 아이디
	private char del_yn; 	 // 삭제 여부
	private String flag;     // flag
	private BigInteger bMinNum;
	private BigInteger bMaxNum;
	
	private int startIndex;
    private int cntPerPage;
	
	public BigInteger getRnum() {
		return rnum;
	}

	public void setRnum(BigInteger rnum) {
		this.rnum = rnum;
	}

	public BigInteger getBnum() {
		return bnum;
	}

	public void setBnum(BigInteger bnum) {
		this.bnum = bnum;
	}

	public BigInteger getFnum() {
		return fnum;
	}

	public void setFnum(BigInteger fnum) {
		this.fnum = fnum;
	}
	
	public BigInteger getCnt() {
		return cnt;
	}

	public void setCnt(BigInteger cnt) {
		this.cnt = cnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public char getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
	public BigInteger getbMinNum() {
		return bMinNum;
	}

	public void setbMinNum(BigInteger bMinNum) {
		this.bMinNum = bMinNum;
	}

	public BigInteger getbMaxNum() {
		return bMaxNum;
	}

	public void setbMaxNum(BigInteger bMaxNum) {
		this.bMaxNum = bMaxNum;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	
	

	private int curPage;
	
	public int getCurPage() {
		return curPage;
	}

	
	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	@Override
	public String toString() {
		return "HairBoardVO [rnum=" + rnum + ", bnum=" + bnum + ", fnum=" + fnum + ", cnt=" + cnt + ", title=" + title
				+ ", contents=" + contents + ", regdate=" + regdate + ", users_id=" + users_id + ", del_yn=" + del_yn
				+ ", flag=" + flag + ", bMinNum=" + bMinNum + ", bMaxNum=" + bMaxNum + ", startIndex=" + startIndex
				+ ", cntPerPage=" + cntPerPage + ", curPage=" + curPage + "]";
	}

	
} // End hbVO