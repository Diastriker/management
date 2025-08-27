<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 휴가신청서 기록들</title>
</head>
<body>
	<main>
		<table>
			<tr>
				<td>휴가 신청일</td>
				<td>휴가 일수</td>
				<td>승인 현황</td>
			</tr>
			<c:forEach var="HistoryList" items="${leaveHistoryList}">
			<tr>
				<td><a href="/leave/leaveReqHistory?seq=${HistoryList.seq}">${HistoryList.reg_date}</a></td>
				<td>${HistoryList.annual_days}</td>
				<td class="status">${HistoryList.status}</td>
			</tr>
			</c:forEach>
		</table>
	</main>
	
	<script>
		let statusEl = document.querySelectorAll('.status')
	  statusEl.forEach(el => {
		if (el.innerHTML == 0) {
			el.innerHTML = "승인대기"
		} else if (el.innerHTML == 1) { 
			el.innerHTML = "승인"
		} else {
			el.innerHTML = "반려"
		}	
	});
	</script>
	
</body>
</html>