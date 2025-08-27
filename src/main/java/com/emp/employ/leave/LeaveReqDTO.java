package com.emp.employ.leave;

import lombok.Data;

@Data
public class LeaveReqDTO {
	
	private int    seq;
	private String employee_id;
	private String name;
	private String reg_date;
	private String annual_days;
	private String leave_start_date;
	private String leave_end_date;
	private String content;
	private String manager_name;		
	private String department_name;		
	private String phone_num;
	private int    status;
}
