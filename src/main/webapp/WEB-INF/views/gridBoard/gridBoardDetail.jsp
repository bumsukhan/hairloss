<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/custom.css"> <!-- 폰트체 커스텀 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function()
{
	$('#hairBoardUpdate').click(function()
	{
		var result = confirm("현재 글을 수정 하시겠습니까?");
		if (result == true)
		{
			var hairBoardUDForm = $("#hairBoardUDForm").serialize();
			
			var title = $('#title').val();
			title = $.trim(title);

			var contents = $('#contents').val();
			contents = $.trim(contents);
			
			if (title == null || title == "" || title.length == 0)
			{
				alert('제목을 입력 해 주세요.');
				$("#title").focus();
				return false;
			}
			 else if (contents == null || contents == "" || contents == 0)
			 {
				alert('내용을 입력 해 주세요.');
				$('#contents').focus();
				return false;
			 }

			$.ajax({
				type : 'post'
				, url : '${pageContext.request.contextPath}/hairGridBoardUpdate.do'
				, data : hairBoardUDForm
		        , success : function(data){
		           alert('수정 되었습니다.');
		        },
		        error: function(xhr, status, error){
		           alert('실패');
		        },
			});
		}
		 else
		{
			return true;
		}
	});
	
	// 삭제 메소드
	$('#hairBoardDelete').click(function()
	{
		var result = confirm("현재 글을 삭제 하시겠습니까?");
		if (result == true)
		{
			var bnum = $("#bnum").val();
			var hairBoardUDForm = $("#hairBoardUDForm");
			hairBoardUDForm.attr("method", "post");
			hairBoardUDForm.attr("action", "<c:url value="/hairGridBoardDelete.do" />");
			hairBoardUDForm.submit();
			
			alert('삭제 되었습니다.');
			return false;
		}
		 else
		{
			return true;
		}
	});

	$('#btnPrePage').click(function(e) {
		// var hairBoardUDForm = $("#hairBoardUDForm").serialize();

		var bnum = $("#bnum").val();
		var flag = $("#flag").val('pre');
		var chknum = $("#chknum").val();
		
		var hairBoardUDForm = $("#hairBoardUDForm");
		
		hairBoardUDForm.attr("method", "post");
		hairBoardUDForm.attr("action", "<c:url value="/gridBoardDetail.do" />");
		hairBoardUDForm.submit();
		


	}); 
	
	$('#btnNextPage').click(function(e) {
		// var hairBoardUDForm = $("#hairBoardUDForm").serialize();

		var bnum = $("#bnum").val();
		var flag = $("#flag").val('next');
		var chknum = $("#chknum").val();
		
		var hairBoardUDForm = $("#hairBoardUDForm");
		
		hairBoardUDForm.attr("method", "post");
		hairBoardUDForm.attr("action", "<c:url value="/gridBoardDetail.do" />");
		hairBoardUDForm.submit();

		
	}); 
});

// 글자수 제한
function fnChkByte(obj) {
	var maxByte = 2650;
    var str = obj.value;
    var str_len = str.length;
    
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";

    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //한글2Byte
        } else {
            rbyte++; //영문 등 나머지 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return할 문자열 갯수
        }
    }
	
	if (rbyte > maxByte)
	{
		alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		str2 = str.substr(0, rlen);
		obj.value = str2;
		fnChkByte(obj, maxByte);
	}
	 else
	{
		var textarea = $('textarea[name="contents"]:visible').val();
		textarea = rbyte;
	}
}

// 시프트키, ctrl키 방지
function click(){
	if(event.shiftKey)
	{
		alert('shift 키를 사용할 수 없습니다.');
	}
	 else if(event.ctrlKey)
	{
		alert('ctrl 키를 사용할 수 없습니다.');		
	}
}

document.onmousedown = click;
document.onkeydown = click;
</script>

<title>머머리 월드 상세보기</title>
</head>
<body class="no-drag" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form id="hairBoardUDForm" name="hairBoardUDForm" action="" method="">
	<input type="hidden" id="bnum" name="bnum" value="${hairGridBoardDetail.bnum}">
	<input type="hidden" id="chknum" name="chknum" value="">
	<input type="hidden" id="flag" name="flag" value="">


<div class="container">
	<h3>게시판 상세보기</h3>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<div class="form-group">
				<c:choose>
					<c:when test="${sessionScope.users_id != hairGridBoardDetail.users_id}">
						<input class="form-control" type="text" id="title" name="title" value="${hairGridBoardDetail.title}" readonly="readonly" style="border: 0; outline: 0; background-color: white;"><br>
						<input class="form-control" type="text" id="users_id" name="users_id" value="${hairGridBoardDetail.users_id}" style="border: 0; outline: 0; background-color: white;" readonly="readonly"><br>
						<textarea class="form-control" id="contents" name="contents" maxlength="4000" readonly="readonly" style="height: 300px; resize: none; border: 0; outline: 0; background-color: white;">${hairGridBoardDetail.contents}</textarea><br>

						<a class="btn btn-primary pull-left" href="/loss/gridboarList.do">글목록</a>
					</c:when>
					<c:otherwise>
						<input class="form-control" type="text" id="title" name="title" value="${hairGridBoardDetail.title}" maxlength="50" style="border: 0; outline: 0;"><br>
						<input class="form-control" type="text" id="users_id" name="users_id" value="${hairGridBoardDetail.users_id}" style="border: 0; outline: 0; background-color: white;" disabled="disabled"><br>
						<textarea class="form-control" id="contents" name="contents" maxlength="4000" onkeyup="fnChkByte(this);" style="height: 300px; resize: none; border: 0; outline: 0;">${hairGridBoardDetail.contents}</textarea><br>
	
						<a class="btn btn-primary pull-left" href="/loss/gridboarList.do">글목록</a>
						<input class="btn btn-success pull-right" type="button" id="hairBoardUpdate" name="hairBoardUpdate" value="글 수정">
						<input class="btn btn-success pull-right" type="button" id="hairBoardDelete" name="hairBoardDelete" value="글 삭제">
						
						<input class="btn btn-success pull-right" type="button" id="btnPrePage" name="btnPrePage" value="이전글">
						<input class="btn btn-success pull-right" type="button" id="btnNextPage" name="btnNextPage" value="다음글">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>
<%@ include file = "../common/footer.jsp" %>