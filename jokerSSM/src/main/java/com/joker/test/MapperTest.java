package com.joker.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joker.bean.Department;
import com.joker.bean.Employee;
import com.joker.dao.DepartmentMapper;
import com.joker.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper dep;

	@Autowired
	EmployeeMapper emp;

	@Autowired
	SqlSession sqlse;

	@Test
	public void testCRUD() {
		/*
		 * ApplicationContext ioc = new
		 * ClassPathXmlApplicationContext("applicationContext.xml");
		 * ioc.getBean(DepartmentMapper.class);
		 */
		System.out.println(dep);
		/*
		 * dep.insertSelective(new Department(1, "开发部")); dep.insertSelective(new
		 * Department(2, "测试部"));
		 */

		dep.insertSelective(new Department(3, "运营部"));
		/*
		 * emp.insertSelective(new Employee(null, "Joker", "M", "2732914121@qq.com",
		 * 1));
		 */
		/*
		 * EmployeeMapper mapper = sqlse.getMapper(EmployeeMapper.class); for (int i =
		 * 0; i < 1000; i++) { String uid = UUID.randomUUID().toString().substring(0, 5)
		 * + i; emp.insertSelective(new Employee(null, uid, "M", uid + "@qq.com", 2)); }
		 * System.out.println("批量完成");
		 */

	}
}
