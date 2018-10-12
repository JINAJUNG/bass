<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

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

	<form name="joinform" id="joinform" action="/studentinfo" method="post">
		학생이름 : <input type="text" name="student_name" id="student_name"><br>
		학과 : <input type="text" name="student_major" id="student_major"><br>
		이수학점 : <input type="text" name="total_credit_hour" id="total_credit_hour"><br> 
		평균학점 : <input type="text" name="gpa" id="gpa"><br> 
		핸드폰번호 : <input type="text" maxlength="12" name="student_phone" id="student_phone"><br> 
		집주소 : <input type="text" name="student_address" id="student_address"><br>
		담당교수 : <input type="text" name="student_professor" id="student_professor"><br> 
		이메일 : <input type="text" name="student_email" id="student_email"><br> 
		학년정보 : <input type="text" name="student_grade" id="student_grade"><br>

		<button type="button" onclick="addStudent()" class="btn btn-info">학생등록</button>

	</form>

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
						alert("수정 성공");	

					}			

				}
						
		}

			var au = new AjaxUtil(conf);

			au.send(); 

		};

		 function joinform() { //유효성검사
			 	var student_name = document.querySelector("#student_name");
			    var student_major = document.querySelector("#student_major");
			    var total_credit_hour = document.querySelector("#total_credit_hour");
			    var gpa = document.querySelector("#gpa");
			    var student_phone = document.querySelector("#student_phone");
			    var student_address = document.querySelector("#student_address");
			    var student_professor = document.querySelector("#student_professor");
			    var student_email = document.querySelector("#student_email");
			    var student_grade = document.querySelector("#student_grade");		
			    
			    if(student_name.value.length=='' || !(student_name.value.length > 1)){
			    	alert("이름을 입력해 주세요");
			    	student_name.focus();
			    	return false;
			    }

			    if(student_major.value.length==''|| !(student_major.value.length>=2)){
			    	alert("전공학과를 입력해주세요");
			    	student_major.focus();
			    	return false;

			    }

			    if(total_credit_hour.value.length==''){
			    	alert("이수학점을 입력해주세요");
			    	total_credit_hour.focus();
			    	return false;

			    	}

			    if(gpa.value.length==''){
			    	alert("평균학점을 입력해주세요");
			    	gpa.focus();
			    	return false;

			    	}

			    if(student_phone.value.length=='' || !(student_phone.value.length==11)){
			    	alert("휴대폰번호를 숫자로만 입력해주세요");
			    	student_phone.focus();
			    	return false;

			    	} 

			    if(student_address.value.length==''){
			    	alert("주소를 입력해주세요");
			    	student_address.focus();
			    	return false;

			    	}

			    if(student_professor.value.length=='' || !(student_professor.value.length > 1)){
			    	alert("교수님 이름을 입력해주세요");
			    	student_professor.focus();
			    	return false;

			    	}

			    if(student_email.value.length=='' || !(student_email.value.length > 1)){
			    	alert("이메일 주소를 정확히 입력해주세요");
			    	student_email.focus();
			    	return false;

			    	}

			    if(student_grade.value.length==''){
			    	alert("학년정보를 숫자로만 입력해주세요");
			    	student_grade.focus();
			    	return false;

			    	}

			/* var student_name = document.joinform.student_name;

			if (student_name.value == '' || !(student_name.value.length > 1)) {

				window.alert("이름을 입력하시오");

				document.joinform.student_name.focus();

				document.getElementById('student_name').select();

				return false; // 이름 입력이 안되어 있다면 submit 이벤트를 중지

			}

			

			var student_major = document.joinform.student_major;

			if (student_major.value == '') {

				window.alert("학과를 입력하시오");

				document.joinform.student_major.focus();

				document.getElementById('student_major').select();

				return false; // 학과 입력이 안되어 있다면 submit 이벤트를 중지

			}

			var total_credit_hour = document.joinform.total_credit_hour;

			if (total_credit_hour.value == '') {

				window.alert("이수학점을 입력하시오");

				document.joinform.total_credit_hour.focus();

				document.getElementById('total_credit_hour').select();

				return false; // 이수학점 입력이 안되어 있다면 submit 이벤트를 중지

			}

			var gpa = document.joinform.gpa;

			if (gpa.value == '') {

				window.alert("평균학점을 입력하시오");

				document.joinform.gpa.focus();

				document.getElementById('gpa').select();

				return false; // 평균학점 입력이 안되어 있다면 submit 이벤트를 중지

			}

			var student_phone = document.joinform.student_phone;

			if (student_phone.value == '' || !(student_phone.value = '-')) {

				window.alert("숫자만 입력하시오");

				document.joinform.student_phone.focus();

				document.getElementById('student_phone').select();

				return false; // 전화번호 입력이 안되어 있다면 submit 이벤트를 중지

			}

			

			var student_address = document.joinform.student_address;

			if (student_address.value == '') {

				window.alert("주소를 입력하시오");

				document.joinform.student_address.focus();

				document.getElementById('student_address').select();

				return false; // 주소 입력이 안되어 있다면 submit 이벤트를 중지

			}

			var student_professor = document.joinform.student_professor;

			if (student_professor.value == '') {

				window.alert("교수님 이름을 입력하시오");

				document.joinform.student_professor.focus();

				document.getElementById('student_professor').select();

				return false; // 교수님 이름 입력이 안되어 있다면 submit 이벤트를 중지

			}

			

			var student_email = document.joinform.student_email;

			if (student_email.value == '') {

				window.alert("이메일 형식이 잘못 되었습니다");

				document.joinform.student_email.focus();

				document.getElementById('student_email').select();

				return false; // 이메일 입력이 안되어 있다면 submit 이벤트를 중지

			}

			

			var student_grade = document.joinform.student_grade;

			if (student_grade.value == '') {

				window.alert("학년정보를 입력하시오");

				document.joinform.student_grade.focus();

				document.getElementById('student_grade').select();

				return false; // 학년정보 입력이 안되어 있다면 submit 이벤트를 중지

			}

			 */

			

			return true;

		} 

	</script>

</body>

</html>