<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>

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
	<main>		
	<form action="/leave/leaveReqFinish" method="GET">
		<input type ="hidden" name="employee_id" value="${employee_id}"/>
		<table>
		  <tr>
		    <td colspan="4" class="title"><h2>휴가 신청</h2></td>
		  </tr>
		  <tr>
		    <td>성명</td>
		    <td><input type="text" name="name"></td>
		    <td>부서담당자</td>
		    <td><input type="text" name="manager_name"></td>
		  </tr>
		  <tr>
		    <td>부서</td>
		    <td><input type="text" name="department_name"></td>
		    <td>전화번호</td>
		    <td><input type="text" name="phone_num"></td>
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
		    <td colspan="3"><textarea style="width:100%; height:120px; resize:none;" name="content"></textarea></td>
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
		  	<input type="submit" value="신청"/>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
</body>
</html>