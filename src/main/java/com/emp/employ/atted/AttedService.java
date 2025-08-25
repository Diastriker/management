package com.emp.employ.atted;

import java.time.Duration;
import java.time.LocalTime;

import org.springframework.stereotype.Service;

@Service
public class AttedService {

	/*
	0 = 정상출근 / 1 = 정상퇴근 / 2 = 조퇴 / 3 = 지각 / 4 = 결석 / 5 = 초과근무
	 */
	
	
	/* 출석 체크할 때 필요한 로직 */
	public void atteStartFlag(AttedDTO atted) {
		/* 정상 출근 기준 시간 */
		LocalTime now = LocalTime.of(8, 0);
		
		/* 8시 전 이면 정상 퇴근 처리 */
		if(atted.getAtte_start().isBefore(now)) {
			atted.setAtte_flag(0);
		}
		
		/* 8시 이후면 지각 처리 */
		if(atted.getAtte_start().isAfter(now)) {
			atted.setAtte_flag(3);
		}
	}
	
	/* 퇴근 체크할 때 필요한 로직 */
	public void atteEndFlag(AttedDTO atted) {
		/* 정상 퇴근 기준 시간 */
		LocalTime now = LocalTime.of(17, 0);
		
		/* 17시 전 이면 조퇴 처리 */
		if(atted.getAtte_end().isBefore(now)) {
			atted.setAtte_flag(2);
		}
		
		/* 17시 이후이면서 정상 출근이면 정상 퇴근 처리 */
		if(atted.getAtte_end().isAfter(now) && atted.getAtte_flag() == 0) {
			atted.setAtte_flag(1);
		}
		
		/* 17시 이후이면서 지각이면 그대로 지각 처리 */
		if(atted.getAtte_end().isAfter(now) && atted.getAtte_flag() == 3) {
			atted.setAtte_flag(3);
		}
		
		/* work_time 계산 : Duration */
		Duration worktime = Duration.between(atted.getAtte_start(), atted.getAtte_end());
		
		int hour = (int) worktime.toHours();
		int minute = (int) worktime.toMinutes();
		
		
		atted.setWork_time(LocalTime.of(hour, minute));
		
	}
}
