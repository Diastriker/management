package com.emp.employ.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private EmployeeMapper empMapper;
	
	/* 직원 메인 페이지 */
	@GetMapping("/empView")
	public ModelAndView empView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO target = (EmployeeDTO) session.getAttribute("employee");
		
		if(target == null) {
			session.invalidate();
			mav.setViewName("/");
			return mav;
		}
		
		mav.addObject("employee", target);
		mav.setViewName("emp/empDash");
		return mav;
	}
	
	/* 직원 정보 업데이트 페이지 */
	@GetMapping("/empUpdateView")
	public ModelAndView empUpdateView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO target = (EmployeeDTO) session.getAttribute("employee");
		if(target == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		mav.addObject("employee", target);
		mav.setViewName("emp/empUpdate");
		return mav;
	}
	
	/* 직원 정보 업데이트 실행 */
	@PostMapping("/empUpdate")
	public ModelAndView empUpdate(EmployeeDTO employee) {
		ModelAndView mav = new ModelAndView();
		
		empMapper.empUpdate(employee);
		
		mav.setViewName("redirect:/emp/empView");
		return mav;
	}
}
