const btnEl = document.querySelector('[id=loginBtn]');

btnEl.addEventListener('click', function(e) {
	const idEl = document.querySelector('[name=employee_id]').value.trim();
	const pwEl = document.querySelector('[name=password]').value.trim();
	
	if(!idEl) {
		alert('사번코드를 입력해주세요.');
		e.preventDefault();
		return;
	}
	
	if(!pwEl) {
		alert('비밀번호를 입력해주세요.');
		e.preventDefault();
		return;
	}	
});

const notEmpEl = document.querySelector('[id=notEmp]');

if(notEmpEl != null) {
	alert(notEmpEl.value);
}
