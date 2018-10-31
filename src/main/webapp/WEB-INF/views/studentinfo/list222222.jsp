<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/script.jsp" />
</head>
<script>
	var AjaxUtil = function(conf) {
		var xhr = new XMLHttpRequest();
		var url = conf.url;
		var method = conf.method ? conf.method : 'GET';
		var param = conf.param ;
		var success = conf.success ? conf.success : function(response) {
			alert(response);

		}

		var error = conf.error ? conf.error : function(response) {
			alert(response);

		}

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == "200") {
					success(xhr.responseText);

				} else {
					error(xhr.responseText);

				}

			}

		}

		xhr.open(method, url);
		if (method != 'GET') {
			xhr.setRequestHeader('Content-type',
					'application/json;charset=utf-8');

		}

		this.send = function() {
			xhr.send(param);

		}

	}

</script>

<body>

	<form name="login" id="login" action="/logininfo" method="post">
		id : <input type="text" name="id" id="id"><br>
		pwd : <input type="password" name="pwd" id="pwd"><br>
		pwdChk : <input type="password" name="pwdChk" id="pwdChk"><br> 
		age : <input type="text" name="age" id="age"><br> 
		email : <input type="text" maxlength="12" name="email" id="email"><br> 
		
		<input type="submit" onsubmit="login()">회원가입</button>

	</form>
<c:set var="cnt" value="${insertCount}"></c:set>
	<script>
		function addStudent() { // 학생등록
			 if(!joinform()){
				return;

			} 
		 
			var student_name = document.querySelector("#student_name").value;
			var student_major = document.querySelector("#student_major").value;
			var total_credit_hour = document.querySelector("#total_credit_hour").value;
			var gpa = document.querySelector("#gpa").value;
			var student_phone = document.querySelector("#student_phone").value;
			var student_address = document.querySelector("#student_address").value;
			var student_professor = document.querySelector("#student_professor").value;
			var student_email = document.querySelector("#student_email").value;
			var student_grade = document.querySelector("#student_grade").value;
			
			var params = {
					student_name : student_name,
					student_major : student_major,
					total_credit_hour : total_credit_hour,
					gpa : gpa,
					student_phone : student_phone,
					student_address : student_address,
					student_professor : student_professor,
					student_email : student_email,
					student_grade : student_grade

			};

			params = JSON.stringify(params);
			console.log(params)

			var conf= {
				url : '/studentinfo/',
				method : 'POST',
				param : params,
				success : function(response){
					if(response==1){
						alert("등록 성공");	
						location.href = "/url/studentinfo:list";

					}			

				}
						
		}

			var au = new AjaxUtil(conf);
			au.send(); 

		};

		 function login() { //유효성검사
			 	var id = document.querySelector("#id");
			    var pwd = document.querySelector("#pwd");
			    var pwdChk = document.querySelector("#pwdChk");
			    var age = document.querySelector("#age");
			    var email = document.querySelector("#email");
			   			    
			    if !(id.value.length>=5) {
			    	alert("아이디를 입력해 주세요");
			    	id.focus();
			    	return false; // 아이디 입력이 안되어 있다면 submit 이벤트를 중지
			    }

			    if !(pwd.value.length>=8){
			    	alert("비밀번호를 입력해주세요");
			    	pwd.focus();
			    	return false; //비밀번호 입력이 안되어 있다면 submit 이벤트를 중지

			    }

			    if(pwdChk.value.length!=pwd.value.length){
			    	alert("비밀번호를 확인해주세요");
			    	pwdChk.focus();
			    	return false; // 비밀번호 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(age.value.length<0 && !(age.value.length>130)){
			    	alert("나이를 입력해주세요");
			    	age.focus();
			    	return false; // 나이 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(email.value.length=='' || !(email.value.length==11)){
			    	alert("휴대폰번호를 숫자로만 입력해주세요");
			    	student_phone.focus();
			    	return false; // 번호 입력이 안되어 있다면 submit 이벤트를 중지

			    	} 

			    if(student_address.value.length==''){
			    	alert("주소를 입력해주세요");
			    	student_address.focus();
			    	return false; // 주소 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(student_professor.value.length=='' || !(student_professor.value.length > 1)){
			    	alert("교수님 이름을 입력해주세요");
			    	student_professor.focus();
			    	return false; // 교수님 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(student_email.value.length=='' || !(student_email.value.length > 1)){
			    	alert("이메일 주소를 정확히 입력해주세요");
			    	student_email.focus();
			    	return false; // 이메일 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(student_grade.value.length=='' || !(student_grade.value<=4)){
			    	alert("학년정보를 숫자로만 입력해주세요");
			    	student_grade.focus();
			    	return false; // 학년정보 입력이 안되어 있다면 submit 이벤트를 중지

			    	}
			
			return true;

		} 

	</script>

</body>

</html>