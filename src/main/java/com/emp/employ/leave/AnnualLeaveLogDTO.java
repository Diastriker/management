package com.emp.employ.leave;

import lombok.Data;

@Data
public class AnnualLeaveLogDTO {
	private int    seq;
	private String employee_id;
	private String leave_date;
	private int    status;
}
