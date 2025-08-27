<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/empHeader.css">
<link rel="stylesheet" href="/css/empMain.css"> 
<style>
	
	* {
		box-sizing : border-box;
		border-collapse: collapse;
	}
	
  table {
    border-collapse: collapse;
    width : 800px;
		height : 500px;
    margin: 20px auto;
    background : white;
		border : 3px solid black;
    box-shadow: 0 0 3px #FFF;
    margin-top : 80px;
    height : 75%;
    width : 65%;
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
<body>

	<%@ include file="empHeader.jsp" %>
	
	<main class="emp_dashboard">		
	<form action="/leave/leaveReqFinish" method="GET">
		<input type ="hidden" name="employee_id" value="${employee_id}"/>
		<table>
		  <tr>
		    <td colspan="4" class="title"><h2>휴가 신청서</h2></td>
		  </tr>
		  <tr>
		    <td>성명</td>
		    <td><input type="text" name="name" value="${employee.name}" readonly></td>
		    <td>부서담당자</td>
		    <td><input type="text" name="manager_name" value="${employee.manager_name}" readonly></td>
		  </tr>
		  <tr>
		    <td>부서</td>
		    <td><input type="text" name="department_name" value="${employee.department_name}" readonly></td>
		    <td>전화번호</td>
		    <td><input type="text" name="phone_num" value="${employee.phone_num}" readonly></td>
		  </tr>
		  <tr>
		  	<td>신청일</td>
		  	<td colspan="3"><input type="date" name="reg_date"/></td>
		  </tr>
		  <tr>
		    <td>기간</td>
		    <td><input type="date" name="leave_start_date" > ~ <input type="date" name="leave_end_date"></td>
		    <td>휴가일수</td>
		    <td><input type="number" min="0" max="15" name="annual_days"></td>
		  </tr>
		  <tr>
		    <td>사유</td>
		    <td colspan="3"><textarea style="width:100%; height:120px; resize:none; outline:none; " name="content"></textarea></td>
		  </tr>
		  <tr>
		    <td>신청자 (인)</td>
		    <td colspan="3"><input type="text"></td>
		  </tr>
		  <tr>
		    <td colspan="4" style="text-align:center;">주식회사 ○○○</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
		  	<input id="emp_leave_req" type="submit" value="제출하기"/>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
	
	<script src="/js/nowtime.js"></script>
	
	<script>
		El.forEach(AA => {
			AA.addEventListener('click',function() {
				
			})
		} )
	</script>
	
</body>
</html>



