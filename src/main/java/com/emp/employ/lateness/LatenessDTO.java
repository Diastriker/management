package com.emp.employ.lateness;

public class LatenessDTO {
	/*
	지각/결석/조퇴사유서 DTO
	employee_id : 사번
	ness_date   : 사유서 작성 날짜
	content     : 사유서 내용
	status      : 승인/미승인 상태 플래그
	            : 0 = 미승인 , 1 = 승인
	 */
	
	private String employee_id;
	private String ness_date;
	private String content;
	private int status;
}
