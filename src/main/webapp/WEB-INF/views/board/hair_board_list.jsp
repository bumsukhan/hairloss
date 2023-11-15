<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file = "../common/header.jsp" %>
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
	$("a[name='title']").click(function(e)
	{
		boardDetail($(this));
	});
	
	$("#hairBoardInsertForm").click(function()
	{
		location.replace("/loss/hairBoardInsertForm.do");
	});
});

function boardDetail(obj)
{
	var hairBoardListForm = $("#hairBoardListForm");
	hairBoardListForm.attr("method", "post");
	hairBoardListForm.attr("action", "<c:url value="/hairBoardDetail.do" />");
	$("#bnum").attr("value", obj.parent().find("#bnum").val());
	hairBoardListForm.submit();
}

function fn_paging(curPage) {
	alert(curPage);
	location.href = "/hairBoardList.do?curPage=" + curPage;
}

</script>
<title>머머리 월드 게시판</title>
</head>
<body>
<div class="container">
	<form id="hairBoardListForm" name="hairBoardListForm" action="" method="get">
		<div class="container">
			<h3>게시판</h3>
			<table class="table table-hover">
				<thead>
					<tr class="something">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${fn:length(hairBoardList) > 0}">
						<c:forEach var="hairList" varStatus="status" items="${hairBoardList}">
						<tr id="hairDetail">
							<td>${hairList.rnum}</td>
							<td>
								<a href="#this" id="title" name ="title">${hairList.title}
								<input type="hidden" id="bnum" name="bnum" value="${hairList.bnum}" />
								</a>
							</td>
							<td>${hairList.users_id}</td>
							<td>${hairList.regdate}</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td style="text-align: center;" colspan="6">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<hr>
			<c:choose>
				<c:when test="${sessionScope.users_id != null}">
					<input class="btn btn-success pull-right" id="hairBoardInsertForm" name="hairBoardInsertForm" type="button" value="글쓰기">
				</c:when>
			</c:choose>
		</div>
	</form>
</div>
</body>
</html>
<%@ include file = "../common/footer.jsp" %>