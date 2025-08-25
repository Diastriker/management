<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header	class="mngHeader">
	<div class="mngHeader_menu">
		<a href="#">Manager Dash Board</a>
	</div>
	<div class="mngHeader_menu">
		<p>출/퇴근 현황</p>
		<ul class="selected_menu">
			<li><a href="#">당일 출/퇴근 현황</a></li>
			<li><a href="#">출/퇴근 기록부</a></li>
		</ul>
	</div>
	<div class="mngHeader_menu">
		<p>직원 조회</p>
		<ul class="selected_menu">
			<li><a href="#">직원 목록 조회</a></li>
			<li><a href="#">휴가자 조회</a></li>
		</ul>
	</div>
	<div class="mngHeader_menu">
		<p>승인</p>
		<ul class="selected_menu">
			<li><a href="#">휴가자 승인</a></li>
			<li><a href="#">초과근무 승인</a></li>
		</ul>
	</div>
	<div class="mngHeader_menu">
		<a href="/manage/empView">직원 등록</a>
	</div>
	
	<!-- 시계 -->
	<div class="mngHeader_menu">
		<div id="now_time"></div>
	</div>
</header>