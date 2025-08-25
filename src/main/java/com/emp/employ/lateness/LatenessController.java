package com.emp.employ.lateness;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lateness")
public class LatenessController {
	
	/*
	 * 권재균
	 * 지.결.조 신청서 View
	 * 메서드 이름 : eatView
	 */
	@GetMapping("/eatView")
	public ModelAndView eatView() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 권재균
	 * 지.결.조 신청 로직
	 * 메서드 이름 : eatCreate
	 */
	public ModelAndView eatCreate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 권재균
	 * 지.결.조 신청 내역 조회
	 * 메서드 이름 : eatRead
	 */
	public ModelAndView eatRead() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	/*
	 * 권재균
	 * 지.결.조 신청 내역 수정
	 * 메서드 이름 : eatUpdate
	 */
	public ModelAndView eatUpdate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	/*
	 * 권재균
	 * 지.결.조 신청 내역 삭제
	 * 메서드 이름 : eatDelete
	 */
	public ModelAndView eatDelete() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	/*
	 * 권재균
	 * 자신의 지.결.조 신청내역 수정 View
	 * 메서드 이름 : eatUpdateView
	 */
	@GetMapping("/eatUpdateView")
	public ModelAndView eatUpdateView() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
