const equalsEl = document.querySelector('[id=equals]');
if(equalsEl != null) {
	alert('이미 존재하는 직원입니다.');
};

// 모달창 열기
let modalEl = document.querySelector('[id=addressSearch]');

modalEl.addEventListener('click', () => {
	let addressModalEl = document.querySelector('[id=addressModal]');
	addressModalEl.style.display = 'block';
});

// 모달창 닫기
let closeModalEl = document.querySelector('[id=closeModal]');

closeModalEl.addEventListener('click', () => {
	let addressModalEl = document.querySelector('[id=addressModal]');
	addressModalEl.style.display = 'none';
});

// 입력란에 도로명 주소를 입력한 후 검색 버튼 클릭
let searchBtnEl = document.querySelector('[id=searchBtn]');

searchBtnEl.addEventListener('click', () => {
	const keyword = document.querySelector('[id=searchKeyword]').value.trim();
	
	// 입력란에 입력 안했을 시 경고창 
	if(!keyword) {
		alert('도로명 주소를 입력해주세요.');
		return;
	}
	
	// 입력란에 입력한 문자열이 3자 이하인 경우 경고창
	if(keyword.length < 3) {
		alert('검색어는 최소 3자 이상 입력해주세요.');
		return;
	}
	
	fetch(`http://192.168.0.97:9090/address?keyword=${encodeURIComponent(keyword)}`)
		.then(response => {
			if (!response.ok) {
				throw new Error("네트워크 오류");
			}
			return response.json();
		})
		.then(data => {
			
			// 검색한 주소 리스트가 500건 이상인 경우 경고창
			if(data.length > 500) {
				alert('검색 결과는 최대 500건 출력됩니다. 더 자세한 도로명 주소를 입력하세요.');
			}
			
			const listEl = document.querySelector('[id=addressList]');
			listEl.innerHTML = "";
			
			data.forEach(addr => {
				const li = document.createElement("li");
				li.textContent = addr.search;
				li.dataset.id = addr.address_id;
				li.dataset.name = addr.search;
				
// 흥희가 작업할 공간 시작 ====================================================================================
/*
모달창은 #addressModal , 꾸미려면 <style> 태그 안에서
모달창안에 입력란은 #searchKeyword , 꾸미려면 <style> 태그 안에서
모달창안에 검색버튼은 #searchBtn , 꾸미려면 <style> 태그 안에서
*/

				li.style.cursor = 'pointer';
				li.style.padding = '3px';
				li.style.borderRadius = '10px';
				li.style.listStyle = 'none';
				li.style.marginBottom = '5px';
				
				// 출력된 주소를 클릭했을 때 실행되는 이벤트로
				// #successAddr ID를 가진 <input> 태그에 입력됨
				li.addEventListener('click', () => {
					document.querySelector('[id=successAddr]').value = li.dataset.name;
					document.querySelector('[id=addressCode]').value = li.dataset.id;
					document.querySelector('[id=addressModal]').style.display = 'none';
				});
				
				// hover 기능 : 마우스가 올려졌을 때
				li.addEventListener('mouseover', () => {
					li.style.boxShadow = '0 0 5px #000, 0 0 10px #333';
				})
				
				// hover 기능 : 마우스가 내려졌을 때
				li.addEventListener('mouseleave', () => {
					li.style.boxShadow = 'none';
				})
				
				// 1줄씩 출력
				listEl.appendChild(li);
				
//=============================================================================================================
			});
		})
		.catch(err => console.error(err));
});