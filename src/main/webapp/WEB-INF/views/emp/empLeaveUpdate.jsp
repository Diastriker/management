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
	<form id="submit" action="/leave/leaveUpdate" method="GET">
		<input type ="hidden" name="employee_id" value="${leaveReqDTO.employee_id}"/>
		<input type ="hidden" name="seq" value="${leaveReqDTO.seq}"/>
		<input id="status" type ="hidden" name="status" value="${leaveReqDTO.status}"/>
		<table>
		  <tr>
		    <td colspan="4" class="title"><h2>휴가 신청</h2></td>
		  </tr>
		  <tr>
		    <td>성명</td>
		    <td><input type="text" name="name" value="${leaveReqDTO.name}"></td>
		    <td>부서담당자</td>
		    <td><input type="text" name="manager_name" value="${leaveReqDTO.manager_name}"></td>
		  </tr>
		  <tr>
		    <td>부서</td>
		    <td><input type="text" name="department_name" value="${leaveReqDTO.department_name}"></td>
		    <td>전화번호</td>
		    <td><input type="text" name="phone_num" value="${leaveReqDTO.phone_num}"></td>
		  </tr>
		  <tr>
		  	<td>신청일</td>
		  	<td colspan="3"><input type="date" name="reg_date" value="${leaveReqDTO.reg_date}"/></td>
		  </tr>
		  <tr>
		  <tr>
		    <td>기간</td>	    
		    <td>
		    <input type="date" name="leave_start_date" value="${leaveReqDTO.leave_start_date}">
		     ~ 
		     <input type="date" name="leave_end_date" value="${leaveReqDTO.leave_end_date}">
		    </td>		    
		    <td>휴가일수</td>
		    <td><input type="number" min="0" max="15" name="annual_days" value="${leaveReqDTO.annual_days}"></td>
		  </tr>
		  <tr>
		    <td>사유</td>
		    <td colspan="3">
		    <textarea style="width:100%; height:120px; resize:none;" name="content" >${leaveReqDTO.content}</textarea>
		    </td>
		  </tr>
		  <tr>
		    <td>신청자 (인)</td>
		    <td colspan="3"><input type="text" value="${leaveReqDTO.name}"></td>
		  </tr>
		  <tr>
		    <td colspan="4" style="text-align:center;">주식회사 ○○○</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
		  	<input type="submit" value="수정사항 제출하기"/>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
	
	<script>
		const statusEl = document.getElementById('status')
		const submitEl = document.getElementById('submit')
		const titleEL  = document.querySelector('.title')
		
		submitEl.addEventListener('submit', function(e) {	
		if(statusEl.value == 0) {
			alert('관리자가 확인 전까진 원본 수정이 불가능합니다')
			titleEL.focus();
			e.preventDefault();
			e.stopPropagation();
		}
	})
	</script>
	
</body>
</html>


