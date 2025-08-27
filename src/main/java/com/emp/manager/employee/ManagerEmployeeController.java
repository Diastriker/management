package com.emp.manager.employee;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.util.EmployeeID;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerEmployeeController {

	@Autowired
	private MmgEmployeeMapper mngEmpMapper;
	
	/* 관리자 메인 페이지 보여주기 - 서주성 - */
	@GetMapping("/mngindex")
	public ModelAndView manageForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO target = (EmployeeDTO) session.getAttribute("employee");
		
		if(target == null) {
			session.invalidate();
			mav.setViewName("manager/manager");
			return mav;
		}
		
		
		mav.setViewName("manager/manager");
		return mav;
	}
	
	/* 직원 등록 페이지 보여주기 - 서주성 - */
	@GetMapping("/empView")
	public ModelAndView empForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("manager/empCreate");
		return mav;
	}
	
	/* 직원 등록 실행 - 서주성 - */
	@PostMapping("/empCreate")
	public ModelAndView empC(EmployeeDTO employee) {
		ModelAndView mav = new ModelAndView();
		
		int equals = mngEmpMapper.employeeEquals(employee);
		if(equals != 0) {
			mav.addObject("equals", "이미 등록된 직원입니다.");
			mav.setViewName("redirect:/manage/empView");
			return mav;
		}
		
		String id = "";
		String password = "";
		try {
			id = employee.getDepartment_id() + EmployeeID.createEmpID(
					new SimpleDateFormat("yyyy-mm-dd").parse(employee.getBirthdate()),
					new SimpleDateFormat("yyyy-mm-dd").parse(employee.getEmployment_date()));
			password = employee.getBirthdate().replaceAll("-", "");
			
			System.out.println(password);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new IllegalStateException("Parsing Error : " + e.getMessage());
		}
		employee.setEmployee_id(id);
		employee.setPassword(password);
		
		mngEmpMapper.employeeInsert(employee);
		
		/* 보여줄 페이지 */
		mav.setViewName("redirect:/manage/mngindex");
		return mav;
	}
	
}
