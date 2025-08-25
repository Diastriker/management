<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<table>
			<tr>
				<td>휴가 신청일</td>
				<td>휴가 일수</td>
			</tr>
			<c:forEach var="HistoryList" items="leaveHistoryList">
			<tr>
				<td>${HistoryList.reg_date}</td>
				<td>${HistoryList.annual_days}</td>
			</tr>
			</c:forEach>
		</table>
	</main>
</body>
</html>