<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/custom.css"> <!-- 폰트체 커스텀 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function()
{
	$('#hairUserFindPw').click(function()
	{
		var users_id = $('#users_id').val();
		users_id = $.trim(users_id);
		var idRe =  /^[a-z]+[a-z0-9]{3,15}$/g; // 아이디 유효성 검사
		var users_jumin = $('#users_jumin').val();
		users_jumin = $.trim(users_jumin);
		var users_phone_number = $('#users_phone_number').val();
		users_phone_number = $.trim(users_phone_number);
		var phoneRe = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g; // 핸드폰번호 유효성 검사
		$.ajax({
			type : 'get'
			, url : '${pageContext.request.contextPath}/hairUserFindPw.do?users_id=' + users_id + '&users_jumin='+ users_jumin + '&users_phone_number=' + users_phone_number
			, success : function(data)
			{
				
				if (users_id == "") {
					alert("아이디를 입력 하세요."); 
					return false;
				}
				 else if (!idRe.test(users_id))
				{
					alert("아이디는 4자 이상 15자 이하 입니다.");
					$("#users_id").focus();
					return false;
				}
				 else if (users_jumin == null || users_jumin.length == 0)
				{
					alert("주민등록번호를 입력 하세요.");
					$("#users_jumin").focus();
					return false;
				}
		     	 else if (users_jumin.length != 13)
				{
		     		 alert("주민등록번호 13자리를 작성 해 주세요.");
		    		 $("#users_jumin").focus();
		    		 return false;
				}
		     	 else if (isNaN(users_jumin) == true)
		    	{
		    		alert("주민등록 번호는 - 없이 숫자만 입력해 주세요. ex) 8011111022210");
		    		$("#users_jumin").focus();
		    		return false;
		    	}
		     	 else if (users_phone_number == null || users_phone_number.length == 0)
				{
					alert("핸드폰 번호를 입력해 주세요.");
					$("#users_phone_number").focus();
					return false;
				}
				 else if (isNaN(users_jumin) == true)
				{
					alert("핸드폰 번호는 숫자로만 입력 해 주세요.");
					$("#users_jumin").focus();
					return false;
				}
				 else if (!phoneRe.test(users_phone_number))
				{
					alert("핸드폰 번호 양식을 지켜주세요. ex) 010-0000-1111");
					$("#users_phone_number").focus();
					return false;
				}
				
				if(!$.trim(data)) {
					 alert('입력하신 정보와 동일한 비밀번호를 찾을 수 없습니다.');
				}
				 else
				{
					alert('고객님의 비밀번호는 ' + data + ' 입니다.');
					/*
					$("#pw_find").text(data);
					$("#pw_find").css("color", "red");
					*/
				}
			}
			, error: function(xhr, status, error)
			{
	            alert('실패');
	        },
		});
	});
});
</script>
<title>머머리 월드 비밀번호 찾기</title>
</head>
<body>
<div class="container">
	<h3>비밀번호 찾기</h3>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<form id="hairUserFindPwForm" name="hairUserFindPwForm" action=""  method="/hairUserFindId.do" >
				<div class="form-group">
					<input class="form-control" type="text" id="users_id" name="users_id" value="${users_id}" autocomplete="off" autofocus placeholder="아이디"><br>
					<input class="form-control" type="text" id="users_jumin" name="users_jumin" placeholder="주민등록번호"><br>
					<input class="form-control" type="text" id="users_phone_number" name="users_phone_number" placeholder = "핸드폰번호"><br>
					<%-- <span id="pw_find">${msg}</span><br> --%>
				</div>
				<input class="btn btn-success pull-right" id="hairUserFindPw" name= "hairUserFindPw" type="button" value="비밀번호 찾기">
			</form>
		</div>
	</div>
</div>
</body>
</html>