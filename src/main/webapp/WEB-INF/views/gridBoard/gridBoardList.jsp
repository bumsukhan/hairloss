<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/custom.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet" href="/resources/css/datatables.css">
<link rel="stylesheet" href="/resources/css/datatables.min.css">
<script src="/resources/js/datatables.js"></script> 
<script src="/resources/js/datatables.min.js"></script> -->

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 그리드 옵션 제거
 	$('#gridBoard').DataTable({
		"paging"		: false,
		"ordering"		: true,
		"info"			: false,
		"filter"		: false,
		"lengthChange"	: false
	});
	
	$("a[name='title']").click(function(e)
	{
		boardGridDetail($(this));
	});
	
	$("#btnSearch").click(function(e)
	{
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/gridboarList.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});
	
	$("#hairBoardInsertForm").click(function()
	{
		location.replace("/loss/hairGridBoardInsertForm.do");
	});
	
	function boardGridDetail(obj)
	{
		var gridBoardListForm = $("#gridBoardListForm");
		gridBoardListForm.attr("method", "post");
		gridBoardListForm.attr("action", "<c:url value="/gridBoardDetail.do" />");
		$("#bnum").attr("value", obj.parent().find("#bnum").val());
		gridBoardListForm.submit();
	}
});
</script>

<title>머머리 월드 아이디 찾기</title>
</head>
<body>

<div class="container">
	<form id="gridBoardListForm" name="gridBoardListForm" action="" method="get">
		<div class="container">
			<h3>게시판</h3> 
				<div class="form-group row justify-content-right">
					<div class="w100" style="padding-right:10px">
						<select class="form-control form-control-sm" name="searchType" id="searchType">
							<option value="title">제목</option>
							<option value="Content">본문</option>
							<option value="reg_id">작성자</option>
						</select>
					</div>
					<div class="w300" style="padding-right:10px">
						<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
					</div>
				</div>
			<table id = "gridBoard" class="table table-hover">
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
					<c:when test="${fn:length(hairGridBoardLst) > 0}">
						<c:forEach var="hairGridBoardList" varStatus="status" items="${hairGridBoardLst}">
						<tr id="hairDetail">
							<td>${hairGridBoardList.rnum}</td>
							<td>
								<a href="#this" id="title" name ="title">${hairGridBoardList.title}
								<input type="hidden" id="bnum" name="bnum" value="${hairGridBoardList.bnum}" />
								</a>
							</td>
							<td>${hairGridBoardList.users_id}</td>
							<td>${hairGridBoardList.regdate}</td>
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
			<div class="text-xs-center">
		        <ul class="pagination">
		             <c:if test="${pageMaker.prev}">
		                <li class="page-item disabled"><a class="page-link" href="/loss/gridboarList.do?page=${pageMaker.startPage - 1}">이전</a></li>
		             </c:if>
		            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		                <li class="page-item" <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
		                    <a class="page-link" href="/loss/gridboarList.do?page=${idx}">${idx}</a>
		                </li>
		            </c:forEach>
		            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		                <li li class="page-item"><a class="page-link" href="/loss/gridboarList.do?page=${pageMaker.endPage + 1}">다음</a></li>
		            </c:if>
		        </ul>
			</div>
</body>



</html>
<%@ include file = "../common/footer.jsp" %>