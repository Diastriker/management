package com.emp.employ.atted;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/atted")
public class AttedController {
	
	@Autowired
	private AttedService attedService;
	
	@Autowired
	private AttedMapper attedMapper;
	
	/*
	 * 전재율
	 * 자신(직원)의 연차 정보 조회
	 * 메서드 이름 : annualRead
	 */
	public ModelAndView annualRead() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

	/*
	 * 전재율
	 * 자신(직원)의 출근 체크 로직 실행
	 * 메서드 이름 atteStart
	 */
	@PostMapping("/atteStart")
	public ModelAndView atteStart(AttedDTO atted, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		if(employee == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		AttedDTO target = atted;
		attedService.atteStartFlag(target);
		attedMapper.atteStart(target);
		
		mav.addObject("attedStartSuccess", target);
		mav.addObject("employee", employee);
		mav.setViewName("emp/empDash");
		return mav;
	}


	/*
	 * 전재율
	 * 자신(직원)의 퇴근 체크 로직 실행
	 * 메서드 이름 atteEnd
	 */
	@PostMapping("/atteEnd")
	public ModelAndView atteEnd(AttedDTO atted, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		if(employee == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		AttedDTO target = atted;
		AttedDTO atte_start = attedMapper.atteEndContains(atted);

		if(atte_start == null) {
			mav.addObject("startNot", true);
			mav.setViewName("emp/empDash");
			return mav;
		}
		
		target.setAtte_start(atte_start.getAtte_start());
		
		attedService.atteEndFlag(target);
		
		
		System.out.println(target.getCurrentDate());
		System.out.println(target.getEmployee_id());
		System.out.println(target.getAtte_flag());
		
		/* 당일 출석 체크를 하지 않았으면 이 if문이 실행 */
		
		
		/* 출석 체크를 했었다면 Update 실행 */
		attedMapper.atteEndUpdate(target);
		
		mav.addObject("endSuccess", target);
		mav.addObject("employee", employee);
		mav.setViewName("emp/empDash");
		return mav;
	}
	
}
