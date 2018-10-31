<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/script.jsp" />
</head>

<body>
<c:set value="${student}" var="si"></c:set>

<form class="container" name="view" id="view" action="/studentinfo" method="post">
<table class="table table-bordered">
<tr>
<th>학번</th>
<td>${si.student_num}</td>
</tr>

<tr>
<th>이름</th>
<td>${si.student_name}</td>
</tr>

<tr>
<th>학과</th>
<td>${si.student_major}</td>
</tr>

<tr>
<th>이수학점</th>
<td>${si.total_credit_hour}</td>
</tr>

<tr>
<th>평균학점</th>
<td>${si.gpa}</td>
</tr>

<tr>
<th>핸드폰번호</th>
<td>${si.student_phone}</td>
</tr>

<tr>
<th>집주소</th>
<td>${si.student_address}</td>
</tr>

<tr>
<th>담당교수</th>
<td>${si.student_professor}</td>
</tr>

<tr>
<th>이메일</th>
<td>${si.student_email}</td>
</tr>

<tr>
<th>학년정보</th>
<td>${si.student_grade}</td>
</tr>

</thead>
</table>

<button type="button" class="btn btn-primary" onclick="listStudent()">목록</button>

</form>
<script>

 function detailviewStudent(student_num) { //상세보기
	var url = "/studentinfo/" + student_num; 
		var conf = {
				url:url, 
				success:success,
				method:'GET'

				}; 
		 
		var au = new AjaxUtil(conf); 
		au.send(); 
	 
		} 
		 */
function listStudent(){//목록으로 돌아가기
	
	location.href = "/url/studentinfo:list";
}

	

</script>
</body>
</html>