<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>휴가 신청</title>
	<link rel="stylesheet" href="/css/empHeader.css"/>
	<link rel="stylesheet" href="/css/reset.css"/>

<style>
  table {
    border-collapse: collapse;
    width : 800px;
		height : 500px;
    margin: 150px auto;
  }
  
  h2 { text-align : center; }
  
  td, th {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
  }
  
  td:nth-of-type(1) { width : 8%; }
  td:nth-of-type(2) { width : 55%; }
  td:nth-of-type(3) { width : 12%; }
  td:nth-of-type(4) { width : 25%; }
  
  input { padding : 6px; }
  
</style>

</head>
<%@ include file="../emp/empHeader.jsp" %>
<body>

	<main>		
	<form action="/leave/leaveAgree" method="GET">
		<input type ="hidden" name="employee_id" value="${leaveDetail.employee_id}"/>
		<input type ="hidden" name="seq" value="${leaveDetail.seq}"/>
		<table>
		  <tr>
		    <td colspan="4" class="title"><h2>휴가 신청서</h2></td>
		  </tr>
		  <tr>
		    <td>성명</td>
		    <td><input type="text" name="name" value="${leaveDetail.name}" readonly></td>
		    <td>부서담당자</td>
		    <td><input type="text" name="manager_name" value="${leaveDetail.manager_name}" readonly></td>
		  </tr>
		  <tr>
		    <td>부서</td>
		    <td><input type="text" name="department_name" value="${leaveDetail.department_name}" readonly></td>
		    <td>전화번호</td>
		    <td><input type="text" name="phone_num" value="${leaveDetail.phone_num}" readonly></td>
		  </tr>
		  <tr>
		  	<td>신청일</td>
		  	<td colspan="3"><input type="date" value="${leaveDetail.reg_date}" readonly/></td>
		  	<td>남은 연차일수</td>
		  	<td><input type="number" value="${leaveDetail.remaining_leave}"></td>
		  </tr>
		  <tr>
		  <tr>
		    <td>기간</td>	    
		    <td>
		    <input type="date" name="leave_start_date" value="${leaveDetail.leave_start_date}" readonly>
		     ~ 
		     <input type="date" name="leave_end_date" value="${leaveDetail.leave_end_date}" readonly>
		    </td>		    
		    <td>휴가일수</td>
		    <td><input type="number" min="0" max="15" name="annual_days" value="${leaveDetail.annual_days}" readonly></td>
		  </tr>
		  <tr>
		    <td>사유</td>
		    <td colspan="3">
		    <textarea style="width:100%; height:120px; resize:none;" name="content" readonly>
		    ${leaveDetail.content}
		    </textarea>
		    </td>
		  </tr>
		  <tr>
		    <td>신청자 (인)</td>
		    <td colspan="3"><input type="text" value="${leaveDetail.name}" readonly></td>
		  </tr>
		  <tr>
		    <td colspan="4" style="text-align:center;">주식회사 ○○○</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
		  	<input type="submit" value="승인"/><br>
		  	<a href="/leave/leaveRefuse?seq=${leaveDetail.seq}">반려</a><br>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
<script src="/js/nowtime.js"></script>
</body>
</html>