package com.joker.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.joker.bean.Employee;
import com.joker.bean.Msg;
import com.joker.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService empse;

	
	
	// 给这个方法进行既能批量删除又能单个删除的功能
	@RequestMapping(value = "/empsd/{ids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("ids")String ids) {
		
		if(ids.contains("-")) {
			List<Integer> delid = new ArrayList<>();
			String[] idshuzu=ids.split("-");
			//System.out.println(idshuzu[0]);
			for(String id:idshuzu) {
				delid.add(Integer.parseInt(id));
				
				//empse.deleteEmp(Integer.parseInt(id));
				/*上面那条代码虽然也能解决批量处理的问题，但我他妈的就是不想用
				this codes could solve out the problem,but I am fucking won't do that !!
				*/				
			}
			empse.deleteBatch(delid);
		}			
		else {
			Integer id = Integer.parseInt(ids);
			empse.deleteEmp(id);
		}
		return Msg.success();
	}

	
	
	
	// 思考下这里为啥子用empId
	@RequestMapping(value = "/empsd/{empId}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg saveEmpp(Employee empl) {
		empse.Updateemp(empl);
		return Msg.success();
	}

	@RequestMapping(value = "/empsd/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmpI(@PathVariable("id") Integer id) {
		Employee employee = empse.getEmp(id);
		return Msg.success().add("empI", employee);
	}
	// public Msg

	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("empName") String empName) {
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u4E00-\\u9FA5]{2,6}$)";
		if (!empName.matches(regx))
			return Msg.fail().add("vaMSG", "用户名可以是2-5位的中文或者是6-16的英文和数字的组合");
		boolean b = empse.checkuser(empName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("vaMSG", "用户名不可用");
		}

	}

	@RequestMapping(value = "/empsd", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError err : errors) {
				System.out.println("错误的字段是：" + err.getField());
				System.out.println("错误信息是：" + err.getDefaultMessage());
				map.put(err.getField(), err.getDefaultMessage());
			}
			return Msg.fail().add("err", map);
		} else {
			empse.saveEmp(employee);
			return Msg.success();
		}

	}

	/*
	 * @RequestMapping(value = "/empsd", method = RequestMethod.GET) public String
	 * list(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model mode)
	 * {
	 * 
	 * PageHelper.startPage(pn, 5); List<Employee> emps = empse.getAll();
	 * 
	 * PageInfo page = new PageInfo(emps, 5); mode.addAttribute("pageInfo", page);
	 * return "list"; }
	 */

	// =======这里是json处理页面返回的方法！
	@RequestMapping("/empsd")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = empse.getAll();

		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
}
