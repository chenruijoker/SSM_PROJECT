package com.joker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joker.bean.Department;
import com.joker.dao.DepartmentMapper;

@Service
public class DeptS {
	@Autowired
	private DepartmentMapper depts;

	public List<Department> getDepts() {
		// TODO Auto-generated method stub
	List<Department>list=depts.selectByExample(null);
		return list;
	}

}
