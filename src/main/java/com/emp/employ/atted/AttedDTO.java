package com.emp.employ.atted;

import java.sql.Date;
import java.time.LocalTime;

import org.springframework.format.annotation.DateTimeFormat;

public class AttedDTO {
	
	/*
	employee_id 직원 아이디
	atte_start : 출근 시간		: JS에서 값 넣었음
	atte_end   : 퇴근 시간		: JS에서 값 넣었음
	work_time  : 총 근무 시간	: 퇴근이 찍히면 UPDATE
	 */
	
	private Date currentDate;
	
	private String employee_id;
	
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime atte_start;
	
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime atte_end;
	
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime work_time;
	
	private int atte_flag;
	
	public AttedDTO () {}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public LocalTime getAtte_start() {
		return atte_start;
	}

	public void setAtte_start(LocalTime atte_start) {
		this.atte_start = atte_start;
	}

	public LocalTime getAtte_end() {
		return atte_end;
	}

	public void setAtte_end(LocalTime atte_end) {
		this.atte_end = atte_end;
	}

	public LocalTime getWork_time() {
		return work_time;
	}

	public void setWork_time(LocalTime work_time) {
		this.work_time = work_time;
	}

	public int getAtte_flag() {
		return atte_flag;
	}

	public void setAtte_flag(int atte_flag) {
		this.atte_flag = atte_flag;
	}

	public Date getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}
	
}
