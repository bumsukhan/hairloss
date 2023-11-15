<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/custom.css"> 폰트체 커스텀 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(document).ready(function()
{
	$('#loginForm').click(function()
	{
		var popupX = (window.screen.width / 2) - (600 / 2);
		var popupY = (window.screen.height / 2) - (500 / 2);
		
		var pop = window.open('/loss/_popup.do', 'login popup', 'width=600, height=500, left='+ popupX + ', top='+ popupY + 'scrollbars=no, resizable=no, toolbars=no, menubar=no');
		// location.href = "<c:url value='/_popup.do' />";
	});
	
	$('#joinForm').click(function(){
		window.open('/loss/_popup.do','login popup').close();
		location.href = "<c:url value='/hairUserJoinForm.do' />";
	});

	$('#boardListForm').click(function(){
		location.href = "<c:url value='/hairBoardList.do' />";
	});
	
	$('#hairUserLogout').click(function()
	{
		if (confirm("로그아웃 하시겠습니까?") == false)
		{
			return false;	
		}
		 else
		{
			alert('로그아웃 되었습니다.');
			location.href = "<c:url value='/hairUserLogout.do' />"
			return true;
		}
	});
	
	$('#hairUserMembershipWithdraw').click(function()
	{
		if (confirm("정말 탈퇴 하시겠습니까?") == false)
		{
			
			alert('test1');
			return false;
		}
		 else
		{
			location.href = "<c:url value='/hairUserMembershipWithdraw.do' />"
			alert('탈퇴 되었습니다.');
			location.href = "<c:url value='/main.do' />";
			return true;
		}
	});
	
	
});
</script>
</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<a class="navbar-brand" href="/loss/main.do">머머리 월드</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<c:choose>
			<c:when test="${sessionScope.users_id != null}">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" id="hairUserLogout">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/loss/hairUserMyInfoForm.do">내 정보 보기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="hairUserMembershipWithdraw">회원탈퇴</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/loss/hairBoardList.do">게시판으로 이동</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="hairBoard" href="/loss/gridboarList.do">그리드 게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="hairMail" href="/loss/test/doE.do">메일함</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link"  id="loginForm" href="#">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="joinForm" href="#">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="boardListForm" href="#">게시판으로 이동</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</nav>
</body>
</html>