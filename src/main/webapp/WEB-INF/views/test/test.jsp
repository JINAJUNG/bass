<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
id : <input type="text" id="id"><br>
pwd : <input type="password" id="pwd"><br>
<button onclick="login()">로그인</button>

<script>
function login(){
	var id = document.querySelector("#id").value;
	var pwd = document.querySelector("#pwd").value;
	var params = {id:id,pwd:pwd};
	$.ajax({
		url:'/user/login',
		method :'post',
		data:params,
		success:function(response){
			response = JSON.parse(response);
			if(response.login=='ok'){
				alert("로그인 성공");
			}else {
				alert("로그인 실패");
			}
		},
		error:function(response){
			console.log(response);
		}
	})
}
</script>
</body>
</html>