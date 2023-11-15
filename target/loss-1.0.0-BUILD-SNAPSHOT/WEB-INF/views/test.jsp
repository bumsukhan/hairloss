<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/js/test.js">
<script type="text/javascript">
const bnum = 1;

function listPage(){

	$.ajax({
		url: "/hairReply/all/" + bnum,
		type: "GET",
		dataType: "json",
		success: function(data) {
			let str = "";
			$.each(data, function(){
				alert('test');
				str += '<li data-renum= ${data.renum}" class= "replyList"><span>${data.rcontents}</span><button onclick=modClicked(this) class="point">수정</button></li>';		
			})
			
			$('#hairReply').html(str);
		
		}, error: function(request, status, error) {
			var msg = "ERROR : "+ request.status + "<br>";
			msg += "내용 : " + request.responseText + "<br>" + error;
			console.log(msg);
		}
		
	})
	
}

</script>


<title>Insert title here</title>
</head>
<body>
	<h2>Ajax Test Page</h2>
	
	<ul id="hairReply">
	</ul>

	<ul>
	</ul>
	
	<div>
		<div>
			작성자 : <input type="text" name="users_id" value="${users_id}">
		</div>
		<div>
			내용 : <textarea type="text" name="rcontents" cols="30" rows="3"></textarea>
		</div>
		<button onclick="listPage();">테스트</button>
		<button id="btnReplyAdd">등록</button>
	</div>
	
</body>
</html>