package com.joker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joker.bean.Department;
import com.joker.bean.Msg;
import com.joker.service.DeptS;

@Controller
public class DeptController {
	@Autowired
	private DeptS depser;
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		List<Department> list=depser.getDepts();
		return Msg.success().add("depts",list);
		
	}
}
