<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/manager.css"/>
	<title>My Company Manager</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 관리자 메인 페이지 본문 부분 -->
<main>
	<div class="mng_top_box">
		<div class="mng_top_item">
			<p>당일 출근 인원</p>
			<p>24명/26명</p>
		</div>
		<div class="mng_top_item">
			<p>휴가자 인원</p>
			<p>2명/26명</p>
		</div>
		<div class="mng_top_item">
			<p>휴가 승인 대기</p>
			<p>2건</p>
		</div>
		<div class="mng_top_item">
			<p>초과근무 승인 대기</p>
			<p>5건</p>
		</div>
	</div>
	<div class="mng_bottom_box">
		<div class="mng_bottom_item">
			<div class="mng_bottom_menu">
				<label>담당 부서</label><label>부서 이름</label>
			</div>
			<div class="mng_bottom_menu">
				<label>부서 코드</label><label>부서 코드</label>
			</div>
			<div class="mng_bottom_menu">
				<label>이름</label><label>이름</label>
			</div>			
			<div class="mng_bottom_menu">
				<label>사번 코드</label><label>사번 코드</label>
			</div>
			<div class="mng_bottom_menu">
				<label>입사일</label><label>입사일</label>
			</div>
			<div class="mng_bottom_menu">
				<label>부서 직원수</label><label>부서 직원수</label>
			</div>
		</div>
		<div class="mng_bottom_item">
			여기는 부서 직원 목록
		</div>
		<div class="mng_bottom_item">
			여기는 당일 출근한 부서 직원 목록
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
</body>
</html>