package com.ynq.business.entity;

import java.util.Date;


public class User {
	
	//id (mandatory)
	private Long id;
	//name (mandatory) 
	private String name;
	//loginName (mandatory)
	private String loginName;
	//loginPass (mandatory)
	private String loginPass;	
	//user address (mandatory)
	private String address;
	//phone number (mandatory)
	private String number;  
	//user type （1：personal   0：not verified company  3：verified company） （mandatory）
	private int type;  
	private String sex;
	//optional
	private Date birthday;

	/**
	 * company type (mandatory
	 * 0：police
	 * 1：transport
	 * 2: finance
	 * 3：IT
	 * 4：manufacture
	 * 5：other
	 */
	private String companyType;  
	//（0：very large（>1000） 1：large（500-1000） 2：middle（100-500:3： small（<100））
	private int companySize;  

	private String companyOwner; 
	private String companyNumber;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPass() {
		return loginPass;
	}
	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getCompanyType() {
		return companyType;
	}
	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	public int getCompanySize() {
		return companySize;
	}
	public void setCompanySize(int companySize) {
		this.companySize = companySize;
	}
	public String getCompanyOwner() {
		return companyOwner;
	}
	public void setCompanyOwner(String companyOwner) {
		this.companyOwner = companyOwner;
	}
	public String getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	} 

}
