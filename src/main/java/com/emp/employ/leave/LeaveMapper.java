package com.emp.employ.leave;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LeaveMapper {
	void insertLeave(LeaveReqDTO leaveReqDTO);

	List<LeaveReqDTO> getLeaveReqList();

	LeaveReqDTO leaveDetail(LeaveReqDTO leaveReqDTO);

	void deleteLeave(int seq);

	LeaveReqDTO insertLeaveHistory(LeaveReqDTO leaveReqDTO);

	List<LeaveReqDTO> getLeaveHistoryList(LeaveReqDTO leaveReqDTO);

	void empLeaveUpdate(LeaveReqDTO leaveReqDTO);

	void leaveAgree(LeaveReqDTO leaveReqDTO);

	void leaveRefuse(LeaveReqDTO leaveReqDTO);
}
