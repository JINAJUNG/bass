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
			    	return false; // 이름 입력이 안되어 있다면 submit 이벤트를 중지
			    }

			    if(student_major.value.length==''|| !(student_major.value.length>=2)){
			    	alert("전공학과를 입력해주세요");
			    	student_major.focus();
			    	return false; //학과 입력이 안되어 있다면 submit 이벤트를 중지

			    }

			    if(total_credit_hour.value.length==''){
			    	alert("이수학점을 입력해주세요");
			    	total_credit_hour.focus();
			    	return false; // 이수학점 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(gpa.value.length==''){
			    	alert("평균학점을 입력해주세요");
			    	gpa.focus();
			    	return false; // 평균학점 입력이 안되어 있다면 submit 이벤트를 중지

			    	}

			    if(student_phone.value.length=='' || !(student_phone.value.length==11)){
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