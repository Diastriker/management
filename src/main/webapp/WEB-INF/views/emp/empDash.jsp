<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Company</title>
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/empHeader.css">
	<link rel="stylesheet" href="/css/empMain.css">
</head>
<body>
<!-- empHeader 영역 -->
<!-- 나중에 값 넘겨야할 경우 inclue action 으로 변경 -->
<%@ include file="empHeader.jsp" %>

<!-- 본문 영역 -->
<main class="emp_dashboard">
	<c:if test="${not empty attedStartSuccess}">
		<input type="hidden" id="attedStartSuccess" value="${attedStartSuccess.atte_start}"/>
	</c:if>
	<c:if test="${not empty startNot}">
		<input type="hidden" id="startNot"/>
	</c:if>
	<c:if test="${not empty endSuccess}">
		<input type="hidden" id="endSuccess" value="${endSuccess.atte_end}"/>
	</c:if>
	<div class="emp_top_box">
		<form action="/atted/atteStart" method="post">
			<div class="emp_main_box">
				<label class="em_label">출석 체크</label>
				<input type="hidden" name="currentDate"/>
				<input type="hidden" name="atte_start"/>
				<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
				<input class="em_sm_btn" type="submit" value="출석"/>
			</div>
		</form>
		<form action="/atted/atteEnd" method="post">
			<div class="emp_main_box">
				<input type="hidden" name="currentDate"/>
				<input type="hidden" name="atte_end"/>
				<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
				<label class="em_label">퇴근 체크</label>
				<input class="em_sm_btn" type="submit" value="퇴근"/>
			</div>
		</form>
		<div class="emp_main_box">
			<label class="em_label">남은 연차</label>
			<!-- 연차 계산 변수 들어올 자리 -->
		</div>
	</div>
	<div class="emp_info_box">
		<div class="emp_info_menu">
			<c:if test="${not empty employee}">
				<div class="info_item">
					<label>이름</label><label id="name">${employee.name}</label>
				</div>
				<div class="info_item">
					<label>사번코드</label><label id="employee_id">${employee.employee_id}</label>
				</div>
				<div class="info_item">
					<label>부서</label><label id="department_name">${employee.department_name}</label>
				</div>
				<div class="info_item">
					<label>부서 담당자</label><label id="manager_name">${employee.manager_name}</label>
				</div>
				<div class="info_item">
					<label>입사일</label><label id="employment_date">${employee.employment_date}</label>
				</div>
				<div class="info_item">
					<label>직급</label><label id="position_name">${employee.position_name}</label>
				</div>
				<div class="info_item">
					<label>근무형태</label><label id="worktype">${employee.worktype}</label>
				</div>
				<div class="info_item">
					<label>주소</label><label id="address">${employee.address}</label>
				</div>
			</c:if>
		</div>
		<div class="emp_info_menu">
			자신의 휴가신청건 목록
			<a href="/leave/leaveView?employee_id=${employee.employee_id}">휴가신청하기</a>
			<a href="/leave/leaveReqHistoryList?employee_id=${employee.employee_id}">휴가신청 기록보기</a>
		</div>
		<div class="emp_info_menu">
			자신의 출/퇴근 기록
		</div>
	</div>
</main>
<script src="/js/atted.js"></script>
<script src="/js/nowtime.js"></script>
</body>
</html>