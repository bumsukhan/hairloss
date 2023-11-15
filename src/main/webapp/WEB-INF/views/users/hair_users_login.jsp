<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

window.onkeydown = function()
{
	var kcode = event.keyCode;
	if(kcode == 116)
	{
		event.returnValue = false;
	}
}

$(document).ready(function()
{
	$("#findPw").click(function()
	{
		var users_id = ${'#users_id'}.val();
		alert(users_id);
	});
});

</script>

<title>머머리 월드 로그인</title>
</head>
<body>
<div class="container">
	<h3>로그인</h3> 
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<form action="/loss/hairUserLogin.do"  method="post" >
			<div class="form-group">
				<input class="form-control" type="text" id="users_id" name="users_id" value="${users_id}" autocomplete="off" autofocus placeholder="아이디"><br>
				<input class="form-control" type="password" name="users_pw" placeholder = "비밀번호"><br>
				<span style="color: red">${msg}</span><br>
				
				</div>
				<div style="width: 30%; float:none; margin:0 auto;">
					<a class="nav-link" href="/loss/hairUserFindIdForm.do">아이디 찾기</a>
					<a class="nav-link" id="findPw" href="#">비밀번호 찾기</a>
					<input class="btn btn-primary" id = 'loginSubmit' type="submit" value="로그인">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>