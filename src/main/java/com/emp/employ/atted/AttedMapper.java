package com.emp.employ.atted;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttedMapper {
	
	/* 출석 체크 로직 */
	void atteStart(AttedDTO atted);
	
	/* 퇴근 체크하기 전에 출석 체크 했는지 확인 */
	/* 1 = 출석 체크했음 , 0 = 출석 체크 안했음 */
	AttedDTO atteEndContains(AttedDTO atted);
	
	/* 퇴근 체크 로직 : UPDATE */
	void atteEndUpdate(AttedDTO atted);
	
}
