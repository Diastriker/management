package com.emp.address;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressMapper {

	/* 주소리스트 가져오기 (SELECT) */
	List<AddressDTO> getAddressList(String keyword);
}
