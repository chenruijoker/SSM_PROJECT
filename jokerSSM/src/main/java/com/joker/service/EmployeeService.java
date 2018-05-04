package com.joker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joker.bean.Employee;
import com.joker.bean.EmployeeExample;
import com.joker.bean.EmployeeExample.Criteria;
import com.joker.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper empM;

	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		// EmployeeExampl
		return empM.selectByExampleWithDept(null);
		// empM.selectByExampleWithDept("asc");
	}

	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		empM.insertSelective(employee);
	}

	public boolean checkuser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria cri = example.createCriteria();
		cri.andEmpNameEqualTo(empName);

		long count = empM.countByExample(example);
		return count == 0;
	}

	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub

		Employee employee = empM.selectByPrimaryKey(id);
		return employee;
	}

	public void Updateemp(Employee empl) {
		// TODO Auto-generated method stub
		// empM.updateByPrimaryKey(record)
		empM.updateByPrimaryKeySelective(empl);
	}

	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		empM.deleteByPrimaryKey(id);

	}

	/*
	 * 这段代码他妈的没错但是老是不能批量删除！我他妈很绝望…… EmployeeExample example=new EmployeeExample();
	 * 
	 * Criteria crit= example.createCriteria();
	 * 
	 * crit.andEmpIdIn(ids);
	 * 
	 * empM.deleteByExample(example);
	 * 
	 * 
	 * 好吧，这个问题我解决了，因为我的数据库原来不是emp_id，而是emp-id,但是我只是修改了MAPPER.XML文件却忘了修改Eample文件……
	 */
	public void deleteBatch(List<Integer> ids) {

		EmployeeExample example = new EmployeeExample();

		Criteria criteria = example.createCriteria();
		// delete from xxx where emp_id in(1,2,3)
		criteria.andEmpIdIn(ids);
		empM.deleteByExample(example);

	}

	/*
	 * public boolean checkuser(String empName) { // TODO Auto-generated method stub
	 * EmployeeExample EMPE=new EmployeeExample(); Criteria cri=
	 * EMPE.createCriteria(); //cri.andEmpIdBetween(value1, value2)
	 * cri.andEmailEqualTo(empName); long count =empM.countByExample(EMPE); return
	 * count==0; }
	 */

}
