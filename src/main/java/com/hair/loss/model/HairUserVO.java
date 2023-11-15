package com.hair.loss.model;

public class HairUserVO
{
	private String users_id; // 아이디
	private String users_pw; // 비밀번호
	private int users_role; // 권한
	private String users_name; // 이름
	private String users_jumin; // 주민등록번호
	private String users_email; // 이메일
	private String users_phone_number; // 핸드폰번호
	private String salt; // salt
	private Boolean flag;
	
	public String getUsers_id()
	{
		return users_id;
	}

	public void setUsers_id(String users_id)
	{
		this.users_id = users_id;
	}

	public String getUsers_pw()
	{
		return users_pw;
	}

	public void setUsers_pw(String users_pw)
	{
		this.users_pw = users_pw;
	}

	public int getUsers_role()
	{
		return users_role;
	}

	public void setUsers_role(int users_role)
	{
		this.users_role = users_role;
	}

	public String getUsers_name()
	{
		return users_name;
	}

	public void setUsers_name(String users_name)
	{
		this.users_name = users_name;
	}

	public String getUsers_jumin()
	{
		return users_jumin;
	}

	public void setUsers_jumin(String users_jumin)
	{
		this.users_jumin = users_jumin;
	}

	public String getUsers_email()
	{
		return users_email;
	}

	public void setUsers_email(String users_email)
	{
		this.users_email = users_email;
	}

	public String getUsers_phone_number()
	{
		return users_phone_number;
	}

	public void setUsers_phone_number(String users_phone_number)
	{
		this.users_phone_number = users_phone_number;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	
	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public HairUserVO() { super(); }

	public HairUserVO(String users_id, String users_pw, int users_role, String users_name, String users_jumin,
			String users_email, String users_phone_number, String salt, Boolean flag) {
		super();
		this.users_id = users_id;
		this.users_pw = users_pw;
		this.users_role = users_role;
		this.users_name = users_name;
		this.users_jumin = users_jumin;
		this.users_email = users_email;
		this.users_phone_number = users_phone_number;
		this.salt = salt;
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "HairUserVO [users_id=" + users_id + ", users_pw=" + users_pw + ", users_role=" + users_role
				+ ", users_name=" + users_name + ", users_jumin=" + users_jumin + ", users_email=" + users_email
				+ ", users_phone_number=" + users_phone_number + ", salt=" + salt + ", flag=" + flag + "]";
	}
	
} // End huVO
