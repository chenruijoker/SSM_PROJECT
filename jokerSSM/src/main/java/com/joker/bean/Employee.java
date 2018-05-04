package com.joker.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class Employee {
	private Integer empId;
	
	@Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\\\u4E00-\\\\u9FA5]{2,6}$)",message="用户名可以是2-5位的中文或者是6-16的英文和数字的组合")
	private String empName;

	private String sex;

	//@Email()
	@Pattern(regexp="^[a-z0-9]+([._\\\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$",message="邮箱格式不正确！")
	private String email;

	private Integer dId;

	private Department department;

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(Integer empId, String empName, String sex, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.sex = sex;
		this.email = email;
		this.dId = dId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName == null ? null : empName.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Integer getdId() {
		return dId;
	}

	public void setdId(Integer dId) {
		this.dId = dId;
	}
}