<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
var AjaxUtil = function(conf){
	var xhr = new XMLHttpRequest();
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var param = conf.param?conf.param:'{}';
	
	var success = conf.success?conf.success:function(response){
		alert(response);
	}
	var error = conf.error?conf.error:function(response){
		alert(response);
	}
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status=="200"){
				success(xhr.responseText);
			}else{
				error(xhr.responseText);
			}
		}
	}
	xhr.open(method,url);
	if(method!='GET'){
		xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
	}
	this.send = function(){
		xhr.send(param);
		
	}
}

</script>
<body>

	<form action="/studentinfo" method="post">
		학생이름 : <input type="text" name="student_name"><br> 
		학과 : <input type="text" name="student_major"><br> 
		이수학점 : <input type="text" name="total_credit_hour"><br>
		평균학점 : <input type="text" name="gpa"><br>
		핸드폰번호 : <input type="text" name="student_phone"><br>
		집주소 : <input type="text" name="student_address"><br>
		담당교수 : <input type="text" name="student_professor"><br>
		이메일 : <input type="text" name="student_email"><br>
		학년정보 : <input type="text" name="student_grade"><br>			
		<button onclick="addStudentinfo()">학생등록</button>
	</form>
	<script>
	function addStudentinfo(){
		var student_name = document.querySelector("#student_name" + student_num).value;
		var student_major = document.querySelector("#student_major" + student_num).value;
		var total_credit_hour = document.querySelector("#total_credit_hour" + student_num).value;
		var gpa = document.querySelector("#gpa" + student_num).value;
		var student_phone = document.querySelector("#student_phone" + student_num).value;
		var student_address = document.querySelector("#student_address" + student_num).value;
		var student_professor = document.querySelector("#student_professor" + student_num).value;
		var student_email = document.querySelector("#student_email" + student_num).value;
		var student_grade = document.querySelector("#student_grade" + student_Num).value;

		var params = {student_name:student_name,student_major:student_major,total_credit_hour:total_credit_hour,gpa:gpa,student_phone:student_phone,student_address:student_address,
					student_professor:student_professor,student_email:student_email,student_grade:student_grade};
		params = JSON.stringify(params);
		console.log(params)
		/* 
		var conf= {
				url : '/studentinfo',
				method : 'POST',
				param : params,
				success : function(response){
					if(response==1){
						alert("저장완료");
						location.href = '/studentinfo'
					}
					
				}
						
		}
		var au = new AjaxUtil(conf);
		au.send();
	  */
		};
	
	</script>
</body>
</html>