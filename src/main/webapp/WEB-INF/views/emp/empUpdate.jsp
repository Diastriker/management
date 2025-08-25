<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/empHeader.css">
	<link rel="stylesheet" href="/css/empMain.css">
	<title>My Company</title>
</head>
<body>
<!-- 직원 페이지 Header 영역 -->
<%@ include file="empHeader.jsp" %>

<!-- 직원 수정 페이지 본문 영역 -->
<main class="emp_dashboard">
	<form action="/emp/empUpdate" method="post">
		<div class="emp_update_box">
			<div class="update_info">
				<p>직원 정보 수정</p>
			</div>
			<div class="update_info">
				<label>사원 코드</label>
				<input type="text" name="employee_id" value="${employee.employee_id}" readOnly/>
			</div>
			<div class="update_info">
				<label>부서</label>
				<input type="text" name="department_name" value="${employee.department_name}" readOnly/>
			</div>
			<div class="update_info">
				<label>이름</label>
				<input type="text" name="name" value="${employee.name}" readOnly/>
			</div>
			<div class="update_info">
				<label>비밀번호</label>
				<input type="text" name="password"/>
			</div>
			<div class="update_info">
				<label>비밀번호 확인</label>
				<input type="text" id="passwordEquals"/>
			</div>
			<div class="update_info">
				<label>입사일</label>
				<input type="text" name="emplyment_date" value="${employee.employment_date}" readOnly/>
			</div>
			<div class="update_info">
				<label>이메일</label>
				<input type="text" name="email" value="${employee.email}"/>
			</div>
			<div class="update_info">
				<label id="addressSearch">주소 검색</label>
				<input type="text" id="successAddr" name="address" value="${employee.address}" readOnly/>
			</div>
			<input type="submit" value="직원 정보 업데이트"/>
		</div>
	</form>
	<!-- 주소 모달 창 시작 -->
	<div id="addressModal">
		<div>
			<input type="text" id="searchKeyword" placeholder="도로명 주소 입력" />
			<ul id="addressList"></ul>
			<button type="button" id="searchBtn">검 색</button>
			<button type="button" id="closeModal">닫 기</button>
		</div>
	</div>
</main>
<script src="/js/address.js"></script>
<script src="/js/nowtime.js"></script>
</body>
</html>