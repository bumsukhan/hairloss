<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
$(document).ready(function(){
	$('#hairUserMembershipWithdraw').click(function(){
		var result = confirm("정말 탈퇴 하시겠습니까?");
		if (result == false) {
			return false;
		} else {
			alert('회원탈퇴 되셨습니다.')
			return true;
		}
	});
});
</script>
<style>

</style>

<footer>
	footer 입니다.
</footer>

