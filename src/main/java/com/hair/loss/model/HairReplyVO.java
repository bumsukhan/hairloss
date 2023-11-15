package com.hair.loss.model;

import java.math.BigInteger;
import java.sql.Date;

public class HairReplyVO
{
	private BigInteger renum;
	private BigInteger bnum;
	private String rcontents;
	private String users_id;
	private Date regdate;
	private Date UDATE;

	
	
	
	public BigInteger getRenum() {
		return renum;
	}
	public void setRenum(BigInteger renum) {
		this.renum = renum;
	}
	public BigInteger getBnum() {
		return bnum;
	}
	public void setBnum(BigInteger bnum) {
		this.bnum = bnum;
	}
	public String getRcontents() {
		return rcontents;
	}
	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}
	public String getUsers_id() {
		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUDATE() {
		return UDATE;
	}
	public void setUDATE(Date uDATE) {
		UDATE = uDATE;
	}
	@Override
	public String toString() {
		return "HairReplyVO [renum=" + renum + ", bnum=" + bnum + ", rcontents=" + rcontents + ", users_id=" + users_id
				+ ", regdate=" + regdate + ", UDATE=" + UDATE + "]";
	}
	
}
