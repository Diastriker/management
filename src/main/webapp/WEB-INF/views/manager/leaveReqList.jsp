<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
		* {
		box-sizing : border-box;
		border-collapse: collapse;
	}
</style>

</head>
<body>
	<!-- 휴가 신청한 직원이름 리스트 페이지 -->
	<main>
		<table>
			<tr>
				<td colspan="2"><h2>휴가 신청한 직원리스트</h2></td>
			</tr>
			<tr>
				<td>직원 이름</td>
				<td>신청일</td>
			</tr>
			<c:forEach var="List" items="leaveReqList">
				<tr>
					<td><a href="/leave/showLeaveDetail?seq=${List.seq}">${List.name}</a></td>
					<td><a href="/leave/showLeaveDetail?seq=${List.seq}">${List.req_date}</a></td>
				</tr>
			</c:forEach>
		</table>
	</main>
	
	<script>
		
	</script>
</body>
</html>