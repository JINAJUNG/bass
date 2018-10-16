<%@page import="javax.servlet.jsp.tagext.TagLibraryInfo"%>
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
<body>
	<c:set value="${searchstudent}" var="si"></c:set>
</body>
<script>

var AjaxUtil = function(conf){
	var xhr = new XMLHttpRequest();
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var param = conf.param;

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

window.addEventListener('load', function(){ 
		var conf= {
			url : '/studentinfo',
			success : function(response){
				response=JSON.parse(response);
				
				var html='';
			
				for(var si of response){						
					 html +='<td>' + si.student_num + '</td>';
					 html +='<td><input type="text" id="student_name' + si.student_num +'" value="' + si.student_name + '"></td>';
					 html +='<td><input type="text" id="student_major' + si.student_num +'" value="' + si.student_major + '"></td>';
					 html +='<td><input type="text" id="total_credit_hour' + si.student_num +'" value="' + si.total_credit_hour + '"></td>';
					 html +='<td><input type="text" id="gpa' + si.student_num +'" value="' + si.gpa + '"></td>';
					 html +='<td><input type="tel" id="student_phone' + si.student_num +'" value="' + si.student_phone + '"></td>';
					 html +='<td><input type="text" id="student_address' + si.student_num +'" value="' + si.student_address + '"></td>';
					 html +='<td><input type="text" id="student_professor' + si.student_num +'" value="' + si.student_professor + '"></td>';
					 html +='<td><input type="text" id="student_email' + si.student_num +'" value="' + si.student_email + '"></td>';
					 html +='<td><input type="text" id="student_grade' + si.student_num +'" value="' + si.student_grade + '"></td>';
					 html += '<td><button type="button" class="btn btn-warning" onclick="updateStudent(' + si.student_num +')">수정</button></td>';
					 html += '<td><button type="button" class="btn btn-danger" onclick="deleteStudent(' + si.student_num +')">삭제</button></td>';
					 html += '<td><button type="button" class="btn btn-success" onclick="detailviewStudent(' + si.student_num +')">상세보기</button></td>';
					 html +='</tr>' 

				}

				document.querySelector('#student').insertAdjacentHTML('beforeend',html);

			

			}

	}

		var au = new AjaxUtil(conf);
		au.send();

});

</script>

<body>
	<form id="form">
		<div class="form row">
			<div class="col-1">
				<input type="text" id="keyword" class="form-control"
					placeholder="학과를 입력해주세요" name="student_major">
			</div>
			<br>
			<div class="mb-2 mr-sm-2">
				<button type="button" class="btn btn-info"
					onclick="searchStudent(document.querySelector('#keyword').value)">학과검색</button>
			</div>
		</div>
	</form>

	<form id="form2">
		<table class="table table-bordered table-hover">

			<thead>
				<tr>
					<th>학번</th>
					<th>학생이름</th>
					<th>학과</th>
					<th>이수학점</th>
					<th>평균학점</th>
					<th>핸드폰번호</th>
					<th>집주소</th>
					<th>담당교수</th>
					<th>이메일</th>
					<th>학년정보</th>
					<th>수정</th>
					<th>삭제</th>
					<th>상세보기</th>

				</tr>
			</thead>

			<tbody id="student">
			</tbody>
		</table>

		<button type="button" class="btn btn-info" onclick="addStudent()">학생등록</button>
	</form>
</body>

<script>

	function updateStudent(student_num){
		var student_name = document.querySelector("#student_name" + student_num).value;
		var student_major = document.querySelector("#student_major" + student_num).value;
		var total_credit_hour = document.querySelector("#total_credit_hour" + student_num).value;
		var gpa = document.querySelector("#gpa" + student_num).value;
		var student_phone = document.querySelector("#student_phone" + student_num).value;
		var student_address = document.querySelector("#student_address" + student_num).value;
		var student_professor = document.querySelector("#student_professor" + student_num).value;
		var student_email = document.querySelector("#student_email" + student_num).value;
		var student_grade = document.querySelector("#student_grade" + student_num).value;

		var params = {student_name:student_name,student_major:student_major,total_credit_hour:total_credit_hour,gpa:gpa,student_phone:student_phone,student_address:student_address,
					  student_professor:student_professor,student_email:student_email,student_grade:student_grade};

		params = JSON.stringify(params); 

		console.log(params);

		var conf= {
				url : '/studentinfo/' + student_num,
				method : 'PUT',
				param : params,
				success : function(response){
					if(response==1){
						alert("수정 성공");	
						location.href = '/url/studentinfo:list';

					}			

				}
						
		}

		var au = new AjaxUtil(conf);

		au.send();
	 
	};

	

	function deleteStudent(student_num){
		var conf= {
				url : '/studentinfo/' + student_num,
				method : 'DELETE',
				success : function(response){
					if(response==1){
						alert("삭제 성공");
						location.href = '/url/studentinfo:list';
					}		

				}
		

		}

		var au = new AjaxUtil(conf);
		
		au.send();

	};


	function addStudent(){

		location.href = '/studentinfo/insert';

		};		

	function detailviewStudent(student_num){
		
		location.href = "/studentinfo/"+student_num;

		}		
	
	function searchStudent(student_major){
		var conf= {
				url : '/studentinfo?keyword=' + student_major,
				method : 'GET',
				success : function(response){
					response=JSON.parse(response);
					
					var html='';
					document.querySelector('#student').innerHTML = '';
					for(var si of response){						
						 html +='<td>' + si.student_num + '</td>';
						 html +='<td><input type="text" id="student_name' + si.student_num +'" value="' + si.student_name + '"></td>';
						 html +='<td><input type="text" id="student_major' + si.student_num +'" value="' + si.student_major + '"></td>';
						 html +='<td><input type="text" id="total_credit_hour' + si.student_num +'" value="' + si.total_credit_hour + '"></td>';
						 html +='<td><input type="text" id="gpa' + si.student_num +'" value="' + si.gpa + '"></td>';
						 html +='<td><input type="tel" id="student_phone' + si.student_num +'" value="' + si.student_phone + '"></td>';
						 html +='<td><input type="text" id="student_address' + si.student_num +'" value="' + si.student_address + '"></td>';
						 html +='<td><input type="text" id="student_professor' + si.student_num +'" value="' + si.student_professor + '"></td>';
						 html +='<td><input type="text" id="student_email' + si.student_num +'" value="' + si.student_email + '"></td>';
						 html +='<td><input type="text" id="student_grade' + si.student_num +'" value="' + si.student_grade + '"></td>';
						 html += '<td><button type="button" class="btn btn-warning" onclick="updateStudent(' + si.student_num +')">수정</button></td>';
						 html += '<td><button type="button" class="btn btn-danger" onclick="deleteStudent(' + si.student_num +')">삭제</button></td>';
						 html += '<td><button type="button" class="btn btn-success" onclick="detailviewStudent(' + si.student_num +')">상세보기</button></td>';
						 html +='</tr>' 

					}

					document.querySelector('#student').insertAdjacentHTML('beforeend',html);

					}		

				}
		var au = new AjaxUtil(conf);
		au.send();
	}
	}
	
</script>
</html>