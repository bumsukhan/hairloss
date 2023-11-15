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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>머머리 월드 게시글 작성</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('#hairGridBoardInsert').click(function(){
		
		var title = $("#title").val();
		title = $.trim(title);
		var contents = $("#contents").val();
		contents = $.trim(contents);
		
		if (title.length == 0 || title == null)
		{
			alert('제목을 입력 하세요.');
			return false;	
		}
		 else if (contents.length == 0 || contents == null)
		{
			alert('내용을 입력 하세요.');
			return false;
		}
		
		var form = $("#hairGridBoardInsertForm");
		form.attr("method", "post");
		form.attr("action", "<c:url value="/hairGridBoardInsert.do" />")
		form.submit();
	});
	
	// 특수문자 제한
/* 	$("input[name='title']").keyup(function() {
		var value = $(this).val();
		var arr_char = "❥❦❧☯⋰⋱⌛⌚⌡⌠❒❖❡♔♕♖♗♘♙♚♛♜♝♞➔➕➖➗➘➙➚➛➜➝➞➟☨☩☪➩➪➫➤➥➦➧➨➬➭➮➯➰➱➲"
		+ "➳➴➵➶☿♀♁♂➷➸➹➺➻➼➽➾☀☁☂☃☄☇☈☉☊☋☌☍☑☒☓月☟☠☡☣☤☥☦☫☬☭☮☯฿"
		+ "ุึัี้ิืูํ๊็๋☰☱☲☳☴☵☶☷☸☹☺☻☼♃♄♅♆♇♈♉♊♋♌♍♎♑♒♓♮♯♰❀☼☽☾➠♏♐☽☾♭♱⬆⬇⬅➡✳✴♈♉♊♋♌♍♎♏♐♑♒♓⛎"
		+ "✁✂✃✄✆✇✈✉✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺"
		+ "✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❍❏❐❑❒❖❘❙❚❛❜❝❞❡❢❣❤❥❦❧❶❷❸❹❺❻❼❽❾❿➀➁➂➃➄➅➆➇➈➉➊➋➌➍➎➏➐➑➒➓"
		+ "➔➘➙➚➛➜➝➞➟➠➡➢➣➤➥➦➧➨➩➪➫➬➭➮➯➱➲➳➴➵➶➷➸➹➺➻➼➽➾☉☬✁✂✃✄✆✇✈✉✌✍✎✏✐✑✒☉☬"
		+ "♔♕♖♗♘♙♚♛♜♝♞ლ♛๑✧ஆஇஈஊஎஏஐஒஓஔ◌ஂஃ◌ா◌ி◌ௗஙஜஞணநனமயறலளழவஸஹ௧௨௩௪௫д╬☉ღ❤ஐ◌ி❤ˇټ"
		+ "๑۩۞۩✿✾✌✍✎✏❀ิ✌✐≫¿✪✐✑✒✔✕✖✗✘✙✚✛✜✝✞✯✮✬✫✪✧✦✥✤✣✢✡✠✰✱❀❂❄❅❉❊❋❣❤❦❤✨";

		for (var i = 0; i < arr_char.length; i++)
		{
			if (value.indexOf(arr_char[i]) != -1) {
				alert("특수문자는 입력하실 수 없습니다.");
				value = value.substr(0, value.indexOf(arr_char[i]));
				
				$(this).val(value);
			}	
		}
	}); */
});

// 글 제목 공백 제한
function noSpaceForm(obj)
{
	if (obj.value == " ")
	{
		alert("해당 항목에는 공백을 사용할 수 없습니다.");
		obj.focus();
		obj.value = obj.value.replace(' ', '');
		return false;
	}
}

// 글 내용 글자수 제한
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

</script>
<body class="no-drag" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form id="hairGridBoardInsertForm" name="hairGridBoardInsertForm" action="" enctype="multipart/form-data">
<div class="container">
	<h3>게시판 글 쓰기</h3>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
				<div class="form-group">
					<input class="form-control" type="text" id="title" name="title" placeholder="제목" maxlength="30" style="border: 0; outline: 0;" autocomplete="off"><br>
					<input class="form-control" type="text" id="users_id" name="users_id" value="${users_id}" disabled="disabled" style="border: 0; outline: 0; background-color: white;"><br>
					<textarea class="form-control" id="contents" name="contents" style="height: 300px; resize: none; border: 0; outline: 0;" maxlength="3999" placeholder="내용" onkeyup="fnChkByte(this);"></textarea><br>
					<input type="file" name="uploadfile" multiple="" />
					</div>
				</div>
				
				<a class="btn btn-primary pull-left" href="/loss/gridboarList.do">글목록</a>
				<input class="btn btn-success pull-right" type="button" id="hairGridBoardInsert" name="hairGridBoardInsert" value="글 쓰기">
		</div>
	</div>
</div>
</form>
</body>
</html>
<%@ include file = "../common/footer.jsp" %>