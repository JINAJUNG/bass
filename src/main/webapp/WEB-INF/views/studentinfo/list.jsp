<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<c:if test="${!empty insertCount}">
		<c:if test="${insertCount eq 1 }">
			<script>
				alert("등록성공")
				//location.href = '/studentinfo'
			</script>
		</c:if>
	</c:if>
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
		xhr.send();
	}
}

window.addEventListener('load',function(){
		var conf= {
			url : '/studentinfo',
			success : function(response){
				response=JSON.parse(response);
				console.log(response)
				var html='';
				for(var si of response){
					 html +='<td>' + si.student_num + '</td>';
					 html +='<td><input type="text" id="student_name' + si.student_num +'" value="' + si.student_name + '"></td>';
					 html +='<td><input type="text" id="student_major' + si.student_num +'" value="' + si.student_major + '"></td>';
					 html +='<td><input type="text" id="total_credit_hour' + si.student_num +'" value="' + si.total_credit_hour + '"></td>';
					 html +='<td><input type="text" id="gpa' + si.student_num +'" value="' + si.gpa + '"></td>';
					 html +='<td><input type="text" id="student_phone' + si.student_num +'" value="' + si.student_phone + '"></td>';
					 html +='<td><input type="text" id="student_address' + si.student_num +'" value="' + si.student_address + '"></td>';
					 html +='<td><input type="text" id="student_professor' + si.student_num +'" value="' + si.student_professor + '"></td>';
					 html +='<td><input type="text" id="student_email' + si.student_num +'" value="' + si.student_email + '"></td>';
					 html +='<td><input type="text" id="student_grade' + si.student_num +'" value="' + si.student_grade + '"></td>';
					 html += '<td><button onclick="updateStudent(' + si.student_num +')">수정</button></td>';
					 html += '<td><button onclick="deleteStudent(' + si.student_num +')">삭제</button></td>';
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
	학생이름 :
	<input type="text" name="student_name">
	<button>학생검색</button>
	<table border="1">
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
			</tr>
		</thead>
		<tbody id="student">
		</tbody>
	</table>
	<script>
var updateStudent = function(){
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
	
	var conf= {
			url : '/studentinfo/' + student_num,
			method : 'PUT',
			param : params,
			success : function(response){
				alert(response);
			}
					
	}
	var au = new AjaxUtil(conf);
	au.send();
 
	};
	
	var deleteStudent = function(){
		var conf= {
				url : '/studentinfo/' + student_Num,
				method : 'DELETE',
				param : params,
				success : function(response){
					alert(response);
				}
						
		}
		var au = new AjaxUtil(conf);
		au.send();
	}

	function stView(student_num){ 
  		var url = "/studentinfo/" + student_num; 
  		var conf = {url:url, 
  				success:viewInfo}; 
  		 
  		var au = new AjaxUtil(conf); 
  		au.send(); 
  		 
  		function viewInfo(response){ 
  			document.querySelector("#student").innerHTML = getView(JSON.parse(res)); 
  		} 
  	} 
  	 
  	function modify(student_num){ 
  		var url = "/studentinfo/" + student_num; 
  		var conf = {url:url, 
  				success:updateView}; 
  		 
  		var au = new AjaxUtil(conf); 
  		au.send(); 
   
  		function updateView(response){ 
  			document.querySelector('#student').innerHTML = getModify(JSON.parse(response)); 
  		} 
  	} 
  	 
  	function updateInfo(){ 
  		var form = document.querySelector("student"); 
  		var formData = new FormData(form); 
 		 
  		var params = formDataToJson(formData); 
  				 
  		var conf = {url:"/studentinfo", 
  						method:"PUT", 
  						params:params, 
  						success:success 
  		}; 
  		 
  		function success(response){ 
  			alert("수정 완료!"); 
  			location.href="/url/studentinfo:list"; 
  		} 
  			 
  		var au = new AjaxUtil(conf); 
  		au.send(); 
  	}
  	}
</script>
</body>
</html>