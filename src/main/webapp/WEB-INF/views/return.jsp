<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>머머리 월드</title>

<script>
	/* 팝업창을 닫는다. */
	window.close();
	/* 팝업창 종료 후 reload */
	opener.document.location.reload();	
	/* 부모창 url을 메인으로 변경 시킨다. */
	// opener.location.href  = '/loss/main.do';
	// alert('test');
	
	var test = ${sessionScope.users_id};
	
</script>