package com.emp.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.annotation.Configuration;

@Configuration
public class EmployeeID {
	/*
	처음 4 자리 : 부서코드
	다음 7 자리 : 생년월일의 앞에서 두 자리 + (입사일 + 10000부터 90000까지의 랜덤 난수)
	*/
	
	public static String createEmpID(Date birthdate, Date emplyment_date) {
		SimpleDateFormat birth = new SimpleDateFormat("yyyy");
		SimpleDateFormat empDate = new SimpleDateFormat("dd");
		
		String date = birth.format(birthdate);
		
		int emp = Integer.parseInt(empDate.format(emplyment_date));
		
		String start = date.substring(2,4);
		String last = date.substring(0,2);
		
		int endFormat = Integer.parseInt(last);
		int random = endFormat + (int) (Math.random() * 89001) + 10000;
		
		String id =  start + (random + emp);
		
		return id;
	}
	
	/*
	public static void main(String[] args) throws ParseException {
		for (int i = 0; i < 10; i++) {
			String id = EmployeeID.createEmpID(new SimpleDateFormat("yyyy-mm-dd").parse("1970-01-06"), new SimpleDateFormat("yyyy-mm-dd").parse("2025-05-16"));
			System.out.println(i + "번째: " + id);
		}
	}
	*/
	
}
