function updateClock() {
	const now = new Date(); 
	
	// 년 월 일
	const year = now.getFullYear();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	const day = String(now.getDate()).padStart(2, '0');
	
	
	
	// 시간:분:초
	const hours = String(now.getHours()).padStart(2, '0');
	const minutes = String(now.getMinutes()).padStart(2, '0');
	const seconds = String(now.getSeconds()).padStart(2, '0');
	
	// atte_start에 값 넣기
	const atte_startEl = document.querySelector('[name=atte_start]');
		  atte_startEl.value = `${hours}:${minutes}`;
		  
	const atte_endEl = document.querySelector('[name=atte_end]');
	      atte_endEl.value = `${hours}:${minutes}`;
	
	const currentDateEl = document.querySelectorAll('[name=currentDate]');
	currentDateEl.forEach( e => {
		e.value = `${year}-${month}-${day}`;
	});
	
	const week = ["일", "월", "화", "수", "목", "금", "토"];
	const weekDay = week[now.getDay()]; // 0~6 → 요일 변환
	
	document.getElementById("now_time").textContent = `
		${year}-${month}-${day} (${weekDay}) ${hours}:${minutes}:${seconds}`;
}

updateClock();

setInterval(updateClock, 1000);