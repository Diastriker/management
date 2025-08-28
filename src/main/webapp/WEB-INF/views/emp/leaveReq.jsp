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
    white-space: nowrap;
  }
  
  h2 { text-align : center; }
  
  td, th {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
    font-weight: 600;
  }
  
  td:nth-of-type(1) { width : 8%; }
  td:nth-of-type(2) { width : 55%; }
  td:nth-of-type(3) { width : 12%; }
  td:nth-of-type(4) { width : 25%; }
  
  input { padding : 6px; }
  
	.leave_btn {
  		width: 120px;
  		height: 45px;
  		font-size: 18px;
  		font-weight: 600;
  		border: none;
  		border-radius: 12px;
  		
  		background-color: #2C3E50;
  		color: white;
  		letter-spacing: 1px;
  		
  		&:hover {
  			text-shadow: 0 0 3px #FFF;
  		}
  	}
  	
  .overlay {
	 position: fixed;
	 top: 0;
	 left: 0;
	 width: 100%;
	 height: 100%;
	 background: rgba(0, 0, 0, 0.5); /* 투명도를 더하는 스타일(아주 유용한듯) */
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 z-index: 1000;
}

	.modal {
	  background: white;
	  padding: 20px;
	  border-radius: 8px;
	  text-align: center;
	}
	
	button {
	  margin: 10px;
	  padding: 8px 16px;
	}
</style>

</head>
<body>

	<%@ include file="empHeader.jsp" %>
	
	<main class="emp_dashboard">		
	<form id="form" action="/leave/leaveReqFinish" method="GET">
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
		  	<td><input id="reg"  class="date" type="date" name="reg_date"/></td>
		  	<td>남은 연차일수</td>
		  	<td>${leaveReqDTO.remaining_leave}</td>
		  </tr>
		  <tr>
		    <td>기간</td>
		    <td>
		    <input id="start" class="date" type="date" name="leave_start_date" >
		     ~ 
		     <input id="end" class="date" type="date" name="leave_end_date"></td>
		    <td>휴가일수</td>
		    <td><input id="annual_days" type="number" min="1" max="${leaveReqDTO.remaining_leave}" name="annual_days"></td>
		  </tr>
		  <tr>
		    <td>사유</td>
		    <td colspan="3"><textarea style="width:100%; height:120px; resize:none; outline:none; " name="content"></textarea></td>
		  </tr>
		  <tr>
		    <td>신청자 (인)</td>
		    <td colspan="3"><input type="text" value="${employee.name}"></td>
		  </tr>
		  <tr>
		    <td colspan="4" style="text-align:center; font-size: 18px; font-weight: 600; letter-spacing: 2px;">My Company</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
		  	<input id="emp_leave_req" class="leave_btn" type="submit" value="제출하기"/>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
	
	<script src="/js/nowtime.js"></script>
	
	<script>
  // 날짜 선택할때 과거 시간때는 선택불가(회색)
	let dateEls = document.querySelectorAll('.date')
	let today = new Date().toISOString().split('T')[0] 	

	dateEls.forEach(function(date) {
		date.setAttribute('min',today)
		})
	// dateEls.forEach(date => date.setAttribute('min',today))
		
	
	
	/* 날짜를 통해 휴가일수 자동계산 - 로직에 허점 많음...;
	const startEl = document.getElementById('start')
	const endEl   = document.getElementById('end')
	const annual_daysEl = document.getElementById('annual_days')
	
	endEl.addEventListener('change', () => {
		let start = parseInt( startEl.value.split('-')[2] )
		let end = parseInt( endEl.value.split('-')[2] )
		
		annual_daysEl.value = end - start + 1;
	})
	*/
	
	const subBtn = document.querySelector('#emp_leave_req');
	const formEL = document.querySelector('#form');
	subBtn.addEventListener('click',function(e) { 
		
		if(${leaveReqDTO.remaining_leave} == 0) {
			e.preventDefault();
			alert('남은 연차가 없습니다')
		}
			e.preventDefault(); // 기존 기능 실행취소
			
			const overlay = document.createElement('div');
			overlay.className= "overlay";
			
			const modal = document.createElement('div');
			modal.className = "modal";
			
			const message = document.createElement('p')
			message.innerHTML = "정말로 신청 하시겠습니까?";
			
			const check = document.createElement('button')
			check.innerHTML = "확인";
			check.addEventListener('click', function() {
				alert("신청 성공")
				document.body.removeChild(overlay);
				formEL.action(); 
			})

			const cancel = document.createElement('button')
			cancel.innerHTML = "취소";
			cancel.addEventListener('click', function() {
				document.body.removeChild(overlay);
			})
			
			document.body.appendChild(overlay);
			overlay.appendChild(modal);
			modal.appendChild(message);
			modal.appendChild(check);
			modal.appendChild(cancel);
		})

	</script>
	
</body>
</html>



