package com.emp.employ.leave;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OtMapper {

	List<OtReqDTO> getOtReqList();

	OtReqDTO otDetail(OtReqDTO otReqDTO);

}
