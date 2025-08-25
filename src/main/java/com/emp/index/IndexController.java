package com.emp.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.employee.EmployeeMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class IndexController {
	
	@Autowired
	private EmployeeMapper empMapper;
	
	@GetMapping("/")
	public ModelAndView indexView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("index/login");
		return mav;
	}
	
	@PostMapping("/login")
	public ModelAndView login(EmployeeDTO employee, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO target = empMapper.login(employee);
		int manager = empMapper.managerEquals(employee);
		
		/* 존재하지 않는 직원일시 다시 로그인 페이지로 보내기 */
		if(target == null) {
			session.invalidate();
			mav.addObject("notEmp", "존재하지 않는 직원입니다.");
			mav.setViewName("index/login");
			return mav;
		}
		
		/* 로그인한 유저가 담당자인 경우 보여주는 페이지 */
		/* 담당자도 직원 기능을 사용할 수 있으니 "employee" session을 넣는다. */
		if(manager != 0) {
			session.setAttribute("valueManager", true);
			session.setAttribute("valueEmployee", true);
			session.setAttribute("manager", target);
			session.setAttribute("employee", target);
			mav.addObject("manager", target);
			mav.setViewName("manager/manager");
			return mav;
		}
		
		
		/* 로그인한 유저가 직원인 경우 보여주는 페이지 */
		session.setAttribute("valueEmployee", true);
		session.setAttribute("employee", target);
		mav.addObject("employee", target);
		mav.setViewName("emp/empDash");
		return mav;
	}
}
