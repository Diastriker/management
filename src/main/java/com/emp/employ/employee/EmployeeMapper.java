package com.emp.employ.employee;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper {

	/* 로그인 */
	EmployeeDTO login(EmployeeDTO employee);
	
	/* 부서 담당자인지 확인 */
	int managerEquals(EmployeeDTO employee);
	
	/* 직원 정보 업데이트 */
	void empUpdate(EmployeeDTO employee);
	
}
