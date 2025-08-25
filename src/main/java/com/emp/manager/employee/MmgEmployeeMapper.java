package com.emp.manager.employee;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;

@Mapper
public interface MmgEmployeeMapper {
	
	/* 직원 등록 */
	public void employeeInsert(EmployeeDTO employee);
	
	
	/* 이미 등록된 직원인지 검증 */
	public int employeeEquals(EmployeeDTO employee);
	
}
