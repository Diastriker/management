package com.emp.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AddressController {
	
	@Autowired
	private AddressMapper addressMapper;
	
	@GetMapping("/address")
	public List<AddressDTO> search(@RequestParam String keyword) {
		
		List<AddressDTO> list = addressMapper.getAddressList(keyword);
		
		return list;
	}
	
}
