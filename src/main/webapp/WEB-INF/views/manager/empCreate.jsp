<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My Company</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      box-sizing: border-box;
    }

    body {
      background-color: #2c3e50;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .joinForm {
      width: 500px;
      background-color: #fff;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    }

    .joinForm h2 {
      margin-bottom: 30px;
      color: #2c3e50;
      font-size: 28px;
    }

    .textForm {
      margin-bottom: 20px;
    }

    .textForm input,
    .textForm select {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 15px;
      transition: all 0.3s;
      background-color: #f8f9fa;
    }

    .textForm input:focus,
    .textForm select:focus {
      outline: none;
      border-color: #6c5ce7;
      background-color: #fff;
      box-shadow: 0 0 5px rgba(108, 92, 231, 0.4);
    }

    .btn {
      width: 100%;
      padding: 12px;
      background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
      background-size: 200%;
      background-position: left;
      border: none;
      border-radius: 6px;
      color: white;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      transition: 0.4s;
    }

    .btn:hover {
      background-position: right;
    }

    .btn:active {
      transform: scale(0.98);
    }

    .address {
      background-color: #dfe6e9;
      border: none;
      width: 100%;
      padding: 10px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }

    .address:hover {
      background-color: #b2bec3;
    }

    /* 모달창 스타일 */
    #addressModal {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      width: 400px;
      transform: translate(-50%, -50%);
      background-color: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      z-index: 1000;
    }

    #addressModal input[type="text"] {
      width: calc(100% - 80px);
      padding: 10px;
      margin-right: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    #searchBtn,
    #closeModal {
      padding: 10px 15px;
      background-color: #6c5ce7;
      border: none;
      color: white;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 10px;
    }

    #searchBtn:hover,
    #closeModal:hover {
      background-color: #4b4edc;
    }

    #addressList {
      list-style: none;
      margin-top: 15px;
      max-height: 120px;
      overflow-y: auto;
      padding-left: 0;
    }

    #addressList li {
      padding: 8px;
      border-bottom: 1px solid #ddd;
      cursor: pointer;
    }

    #addressList li:hover {
      background-color: #f1f1f1;
    }
    
  </style>
</head>
<body>
	<c:if test="${not empty equals}">
		<input type="hidden" id="equals">
	</c:if>
  <form action="/manage/empCreate" method="POST" class="joinForm">
    <h2>직원등록</h2>
    <div class="textForm">
      <select id="departement" name="department_id" required>
        <option value="" disabled selected>-- 부서 선택 --</option>
        <option value="1010">총무 경비팀</option>
        <option value="1020">총무 시설관리팀</option>
        <option value="2010">재무회계 1팀</option>
        <option value="2020">재무회계 2팀</option>
        <option value="2030">감사팀</option>
        <option value="3010">영업 1팀</option>
        <option value="3020">영업 2팀</option>
        <option value="3030">영업 3팀</option>
        <option value="4010">자재관리팀</option>
        <option value="5010">가공 1팀</option>
        <option value="5020">가공 2팀</option>
        <option value="6010">생산 1라인</option>
        <option value="6020">생산 2라인</option>
        <option value="6030">생산 3라인</option>
        <option value="7010">운송 1팀</option>
        <option value="8010">안전관리팀</option>
      </select>
    </div>

    <div class="textForm">
      <select name="worktype_id">
          <option disabled selected>-- 근무 형태 --</option>
          <option value="1">정규직</option>
          <option value="2">계약직</option>
          <option value="3">파견직</option>
          <option value="4">일용직</option>
      </select>
      
    </div>
	
	<div class="textForm">
		<select name="position_id">
			<option disabled selected>-- 직급 --</option>
			<option value="11">사원</option>
			<option value="12">대리</option>
			<option value="13">과장</option>
			<option value="14">차장</option>
			<option value="15">부장</option>
			<option value="21">생산사원</option>
			<option value="22">A팀 반장</option>
			<option value="23">B팀 반장</option>
			<option value="24">생산반장</option>
			<option value="25">생산부팀장</option>
			<option value="26">생산본부장</option>
			<option value="31">가공사원</option>
			<option value="32">가공반장</option>
			<option value="41">운송사원</option>
			<option value="42">운송팀장</option>
			<option value="43">운송본부장</option>
			<option value="51">안전관리본부장</option>
		</select>
	</div>
	
    <div class="textForm">
      <input name="name" type="text" placeholder="이름" required />
    </div>

    <div class="textForm">
      <input name="gender" type="text" placeholder="성별" required />
    </div>

    <div class="textForm">
      <input name="email" type="email" placeholder="이메일" required />
    </div>

    <div class="textForm">
      <button type="button" id="addressSearch" class="address">주소검색</button>
      <input type="text" id="successAddr" name="address" readonly placeholder="선택된 주소" style="margin-top: 10px;" />
    </div>

    <div id="addressModal">
      <div style="display: flex;">
        <input type="text" id="searchKeyword" placeholder="도로명 주소 입력" />
        <button type="button" id="searchBtn">검색</button>
      </div>
      <ul id="addressList"></ul>
      <button type="button" id="closeModal" style="margin-top: 10px;">닫기</button>
    </div>
    
    <div class="textForm">
      <input name="phone_num" type="text" placeholder="전화번호" required />
    </div>

    <div class="textForm">
      생년월일
      <input id="hiredate" name="birthdate" type="date" value="1980-01-01"/>
    </div>
    
    <div class="textForm">
    	입사일
    	<input name="employment_date" type="date" value="2025-05-01"/>
    </div>

    <input type="submit" class="btn" value="J O I N" />
  </form>
  <script src="/js/address.js"></script>
</body>
</html>
