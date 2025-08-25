package com.emp.employ.leave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/leave")
public class LeaveController {
	
	@Autowired
	private LeaveMapper leaveMapper;
	
	@Autowired
	private OtMapper otMapper;	
	
	/* 
	 * 백승목
	 * 휴가 / 휴가 신청 View 보여주기
	 * 메서드 이름 : leaveView 
	 */
	// 신청버튼 누를때 hidden 으로 employee_id 를 넘겨줘야함
	@RequestMapping("/leaveView")
	public ModelAndView leaveView(String employee_id) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(employee_id);
		
		mav.addObject("employee_id",employee_id);
		mav.setViewName("emp/leavereq");
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 로직(insertLeave) 및 연가신청 기록으로 추가(insertLeaveHistory)
	 * 메서드 이름 : leaveCreate
	 */
	@RequestMapping("/leaveReqFinish")
	public ModelAndView leaveCreate(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		System.out.println(leaveReqDTO);
			
		// 신청 누르면 leave_history 테이블에 값추가(status=0) 
		leaveMapper.insertLeave(leaveReqDTO);
		
		mav.setViewName("redirect:/emp/empView");
		return mav;
	}
	
	/*
	 * 백승목
	 * 본인 휴가 신청기록 리스트 페이지
	 */	
	@RequestMapping("/leaveReqHistoryList") //employee_id - hidden 으로 employee_id 를 넘겨줘야함 혹 session
	public ModelAndView leaveReqHistoryList(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		// 직원이 신청한 휴가기록들 갖고오기 seq, employee_id, leave_date, status
		List<LeaveReqDTO> leaveHistoryList = leaveMapper.getLeaveHistoryList(leaveReqDTO);
		System.out.println("본인 휴가신청 리스트" + leaveHistoryList);
		
		mav.addObject("leaveHistoryList", leaveHistoryList);
		mav.setViewName("emp/leaveHistoryList");
		return mav;
	}
	
	/*
	 * 백승목
	 * 본인 해당 휴가신청서 상세정보 
	 */ 
	@RequestMapping("/leaveReqHistory")  // seq
	public ModelAndView leaveHistory(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		// 신청서 작성한거 상세정보 가져오기
		leaveReqDTO = leaveMapper.leaveDetail(leaveReqDTO);
		
		mav.addObject("leaveReqDTO",leaveReqDTO);
		mav.setViewName("emp/");
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 내역 수정
	 * 메서드 이름 : leaveUpdate
	 */
	// 직원이 수정
	@RequestMapping("/leaveUpdate")
	public ModelAndView leaveUpdate(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/");
		return mav;
	}
	
	/* 
	 * 백승목
	 * 관리자 : 직원 휴가 신청리스트 */
	@RequestMapping("/showLeaveReqList")
	public ModelAndView showLRL() {
		ModelAndView mav = new ModelAndView();
		List<LeaveReqDTO> leaveReqList = leaveMapper.getLeaveReqList();
		
		mav.addObject("leaveReqList", leaveReqList);
		mav.setViewName("manager/leaveReqList");
		return mav;
	}
	
	/* 
	 * 백승목
	 * 관리자 : 직원 휴가신청서 상세정보 */
	@RequestMapping("/showLeaveDetail")     //seq
	public ModelAndView leaveDetail(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		leaveReqDTO = leaveMapper.leaveDetail(leaveReqDTO);
		/*
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		if(employee == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		mav.addObject("employee", employee);
		*/
		mav.addObject("leaveDetail", leaveReqDTO);
		mav.setViewName("manager/leaveRead");
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 내역 삭제
	 * 메서드 이름 : leaveDelete
	 */
	// 관리자 권한
	/*
	@RequestMapping("/Delete")
	public ModelAndView leaveDelete(int seq) {
		ModelAndView mav = new ModelAndView();
		
		leaveMapper.deleteLeave(seq);
		
		return mav;
	}
	*/

	
	/*
	 * 백승목
	 * 초과근무 신청 View 보여주기
	 * */
	@RequestMapping("/otView")
	public ModelAndView otView() {
	    ModelAndView mav = new ModelAndView();
	    
	    mav.setViewName("emp/otReq");
	    return mav;
	}
	/*
	 * 백승목
	 * 초과 근무 신청
	 * 메서드 이름 : overCreate
	 */
	@RequestMapping("/otReqFinish")
	public ModelAndView overCreate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	/* 
	 * 백승목
	 * 관리자 : 직원 초과근무 신청리스트 */
	@RequestMapping("/showOtReqList")
	public ModelAndView showORL() {
		ModelAndView mav = new ModelAndView();
		List<OtReqDTO> otReqList = otMapper.getOtReqList();
		
		mav.addObject("otReqList", otReqList);
		mav.setViewName("manager/otReqList");
		return mav;
	}
	
	/* 
	 * 백승목
	 * 관리자 : 직원 초과근무 신청서 상세정보 */

	@RequestMapping("/showOtDetail")     //seq
	public ModelAndView detail(OtReqDTO otReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		otReqDTO = otMapper.otDetail(otReqDTO);
		
		mav.addObject("otDetail", otReqDTO);
		mav.setViewName("manager/otRead");
		return mav;
	}
	
	
	/*
	 * 백승목
	 * 초과 근무 신청 내역 수정
	 * 메서드 이름 : overUpdate
	 */
	public ModelAndView overUpdate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 초과 근무 신청 내역 삭제
	 * 메서드 이름 : overDelete
	 */
	public ModelAndView overDelete() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 직원이 작성한 초과 근무 내역 수정 View
	 * 메서드 이름 : overUpdateView
	 */
	@GetMapping("/overUpdateView")
	public ModelAndView overUpdateView() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
