<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#leftDiv {
background-color : pink;
float : left;
width : 500px;
height : 400px;
}

#rightDiv { 
background-color : purple;
float : right;
width : 500px;
height : 400px;
}  
</style>
<jsp:include page="/WEB-INF/views/common/script.jsp" />
</head>
<body>
<div id="leftDiv">
<jsp:include page="/WEB-INF/views/common/left.jsp" />


</div>
<div id="rightDiv">
<jsp:include page="/WEB-INF/views/common/r1.jsp" />

</div>
 

<script>
function change(){

}
</script>

</body>
</html>