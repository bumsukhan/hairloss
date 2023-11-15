<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style type="text/css">
#wpcp-error-message {
    direction: ltr;
    text-align: center;
    transition: opacity 900ms ease 0s;
    z-index: 99999999;
}
.warning-wpcp {
    background:#ffecec url('https://tistory4.daumcdn.net/tistory/770263/skin/images/warning.png') no-repeat 10px 50%;
    border:1px solid #f5aca6;
}
.msgmsg-box-wpcp {
    border-radius: 10px;
    color: #555;
    font-family: Tahoma;
    font-size: 11px;
    margin: 10px;
    padding: 10px 36px;
    position: fixed;
    width: 300px;
    top: 50%;
    left: 50%;
    margin-top: -10px;
    margin-left: -130px;
    -webkit-box-shadow: 0px 0px 34px 2px rgba(242,191,191,1);
    -moz-box-shadow: 0px 0px 34px 2px rgba(242,191,191,1);
    box-shadow: 0px 0px 34px 2px rgba(242,191,191,1);
}
.hideme {
    opacity: 0;
    visibility: hidden;
}
.showme {
    opacity:1;
    visibility: visible;
}
</style>
<noscript> <meta http-equiv="Refresh" content="0; URL=http://www.enable-javascript.com/ko/"> </noscript>
<div id="wpcp-error-message" class="msgmsg-box-wpcp warning-wpcp hideme"><span>에러: </span>내용을 임의로 변경 할 수 없습니다.</div>
<script id="wpcp_disable_selection" type="text/javascript">
//<![CDATA[
var image_save_msg='이미지를 저장 할 수 없습니다.';
	var no_menu_msg='메뉴를 비활성화 상태로 만들 수 없습니다.';
	var smessage = "내용을 임의로 변경 할 수 없습니다.";

function disableEnterKey(e)
{
	if (e.ctrlKey){
     var key;
     if(window.event)
          key = window.event.keyCode;     //IE
     else
          key = e.which;     //firefox (97)
    //if (key != 17) alert(key);
     if (key == 97 || key == 65 || key == 16 || key == 67 || key == 80 || key == 99 || key == 88 || key == 120 || key == 26 || key == 85  || key == 86 || key == 83 || key == 43)
     {
          show_wpcp_message('복사 또는 붙여넣기를 할 수 없습니다.');
          return false;
     }else
     	return true;
     }
}

function disable_copy(e)
{	
	var elemtype = e.target.nodeName;
	var isSafari = /Safari/.test(navigator.userAgent) && /Apple Computer/.test(navigator.vendor);
	elemtype = elemtype.toUpperCase();
	var checker_IMG = '';
	if (elemtype == "IMG" && checker_IMG == 'checked' && e.detail >= 2) {show_wpcp_message(alertMsg_IMG);return false;}
	if (elemtype != "TEXT" && elemtype != "TEXTAREA" && elemtype != "INPUT" && elemtype != "PASSWORD" && elemtype != "SELECT" && elemtype != "OPTION" && elemtype != "EMBED")
	{
		if (smessage !== "" && e.detail == 2)
			show_wpcp_message(smessage);
		
		if (isSafari)
			return true;
		else
			return false;
	}	
}

function disable_copy_ie()
{
	var elemtype = window.event.srcElement.nodeName;
	elemtype = elemtype.toUpperCase();
	if (elemtype == "IMG") {show_wpcp_message(alertMsg_IMG);return false;}
	if (elemtype != "TEXT" && elemtype != "TEXTAREA" && elemtype != "INPUT" && elemtype != "PASSWORD" && elemtype != "SELECT" && elemtype != "OPTION" && elemtype != "EMBED")
	{
		//alert(navigator.userAgent.indexOf('MSIE'));
			//if (smessage !== "") show_wpcp_message(smessage);
		return false;
	}
}

function reEnable()
{
	return true;
}
document.onkeydown = disableEnterKey;
document.onselectstart = disable_copy_ie;
	if(navigator.userAgent.indexOf('MSIE')==-1)
	{
		document.onmousedown = disable_copy;
		document.onclick = reEnable;
	}

function disableSelection(target)
{
    //For IE This code will work
    if (typeof target.onselectstart!="undefined")
    target.onselectstart = disable_copy_ie;
    
    //For Firefox This code will work
    else if (typeof target.style.MozUserSelect!="undefined")
    {target.style.MozUserSelect="none";}
    
    //All other  (ie: Opera) This code will work
    else
    target.onmousedown=function(){return false}
    target.style.cursor = "default";
}
//Calling the JS function directly just after body load
window.onload = function(){disableSelection(document.body);};
//]]>
</script>
<script id="wpcp_disable_Right_Click" type="text/javascript">
	//<![CDATA[
	document.ondragstart = function() { return false;}
	/* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	Disable context menu on images by GreenLava Version 1.0
	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */
	    function nocontext(e)
		{
	       return false;
	    }
	    document.oncontextmenu = nocontext;
	//]]>
</script>
<script>
	var timeout_result;
	function show_wpcp_message(smessage)
	{
		if (smessage !== "")
			{
			var smessage_text = '<span>메시지: </span>'+smessage;
			document.getElementById("wpcp-error-message").innerHTML = smessage_text;
			document.getElementById("wpcp-error-message").className = "msgmsg-box-wpcp warning-wpcp showme";
			clearTimeout(timeout_result);
			timeout_result = setTimeout(hide_message, 3000);
			}
	}
	function hide_message()
	{
		document.getElementById("wpcp-error-message").className = "msgmsg-box-wpcp warning-wpcp hideme";
	}
</script>
<script>
// F12 막기
window.onkeydown = function()
{
	var kcode = event.keyCode;
	if(kcode == 116) event.returnValue = false;
}
</script>
</head>

<script type="text/javascript">
$(document).ready(function()
{
	$('#myInfoCheck').click(function()
	{
 		var users_pw = $('#users_pw').val();
 		users_pw = $.trim(users_pw);
		var users_email = $('#users_email').val();
		users_email = $.trim(users_email);
		var users_phone_number = $('#users_phone_number').val();
		users_phone_number = $.trim(users_phone_number);

		var form = $("#hairUserMyInfoForm");
		form.attr("method", "post");
		form.attr("action", "<c:url value="/hairUserMyInfo.do" />")
		form.submit();
	});
});
</script>

<script type="text/javascript">
$(document).ready(function()
{
	var idck = 0;
	
	$('#reg_submit').click(function(){
		var users_id = $('#users_id').val();
		users_id = $.trim(users_id);
		
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/hairUserIdCheck.do?users_id=' + users_id,
			success : function(data) {
				if(data == 1) {
					$("#id_check").text("사용중인 아이디 입니다.");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", false);
					idck = 0;
				}
				 else
				{	
					var idRe =  /^[A-Za-z]+[A-Za-z0-9]{3,15}$/g; // 아이디 유효성 검사
					 
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
					 else
					{
						$("#id_check").text("사용 가능한 아이디 입니다.");
						$("#id_check").css("color", "LawnGreen");
						$("#reg_submit").attr("disabled", false);
						idck = 1;
											
						confirm(users_id + "는 사용 가능한 아이디 입니다. \n"
								+ "사용 하시겠습니까?");
					}
				}
			}, error : function() {
				console.log("실패");
			}
		});
	});
	
	// 특수문자 제한
	$("input[name='users_id']").keyup(function() {
		var value = $(this).val();
		var arr_char = "\"'\[]!@#$^&*=\\,<>?！'，．／：；？＾｀｜￣‥…¨〃–―∥＼"
			+ "´ˇ˘˝˙¸˛¡¿ː（）［］｛｝〔〕〈〉《》「」『』【】＋－＜＝＞±×÷≠≤≥∞∴♂♀∠⊥⌒∂"
			+ "∇≡≒≪≫√∽∝∵∫∬∈∋⊆⊇⊂⊃∪∩∧∨￢⇒⇔∀∃∮∑∏＄％￦′″Å￠￡￥¤℉‰€"
			+ "㎕㎗㎘㏄㎣㎤㎦㎙㎚㎛㎞㎢㏊㎍㎎㎏㏏㎈㎉㏈㎧㎨㎰㎱㎲㎳㎴㎵㎶㎷㎸㎹"
			+ "㎀㎁㎂㎃㎄㎺㎻㎼㎽㎾㎿㎐㎑㎒㎓㎔Ω㏀㏁㎊㎋㎌㏖㏅㎭㎮㎯㏛㎩㎪㎫㎬㏝㏐㏓"
			+ "㏃㏉㏜㏆＃＆＊＠§※☆★○●◎◇◆□■△▲▽▼→←↑↓↔〓◁◀▷▶♤♠♡♥♧♣⊙◈▣◐◑"
			+ "▒▤▥▨▧▦▩♨☏☎☜☞¶†‡↕↗↙↖↘♭♩♪♬㉿㈜№㏇™㏂㏘℡ªº"
			+ "─│┌┐┘└├┬┤┴┼━┃┏┓┛┗┣┳┫┻╋┠┯┨┷┿┝┰┥┸╂┒┑┚"
			+ "┙┖┕┎┍┞┟┡┢┦┧┩┪┭┮┱┲┵┶┹┺┽┾╀╁╃╄╅╆╇╈╉╊㉠㉡㉢㉣㉤㉥㉦㉧㉨㉩㉪㉫㉬㉭㉮㉯㉰㉱㉲㉳㉴㉵㉶㉷㉸㉹㉺㉻"
			+ "㈀㈁㈂㈃㈄㈅㈆㈇㈈㈉㈊㈋㈌㈍㈎㈏㈐㈑㈒㈓㈔㈕㈖㈗㈘㈙㈚㈛ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ"
			+ "①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂"
			+ "ⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩ½⅓⅔¼¾⅛⅜⅝⅞¹²³⁴ⁿ₁₂₃₄"
			+ "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
			+ "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ"
			+ "ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψ"
			+ "ωÆÐĦĲĿŁØŒÞŦŊæđðħıĳĸŀłøœßŧŋŉАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧ"
			+ "ШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя"
			+ "❥❦❧☯⋰⋱⌛⌚⌡⌠ ❒❖❡♔♕♖♗♘♙♚♛♜♝♞➔➕➖➗➘➙➚➛➜➝➞➟ ☨☩☪➩➪➫➤➥➦➧➨➬➭➮➯➰➱➲"
			+ "➳➴➵➶☿♀♁♂➷➸➹➺➻➼➽➾ ☀☁☂☃☄★☆☇☈☉☊☋☌☍☎☏☐☑☒☓月☚☛☜☝☞☟☠☡☣☤☥☦☫☬☭☮☯฿ "
			+ "	ุึัี้ิืูํ๊็๋☰☱☲☳☴☵☶☷☸☹☺☻☼♃♄♅♆♇♈♉♊♋♌♍♎ ♠♡♢♣♤♥♦♧♑♒♓♮♯♰​❀ ☼☽☾☿♀♁♂♩♪♫♬➠♏♐☽☾♭♱♨ ⬆⬇⬅➡↗↖↘↙◀▶✳✴♈♉♊♋♌♍♎♏♐♑♒♓⛎"
			+ "✁✂✃✄ ✆✇✈✉✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺"
			+ "✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❍❏❐❑❒❖❘❙❚❛❜❝❞ ❡ ❢❣❤❥❦❧❶❷❸❹❺❻❼❽❾❿➀➁➂➃➄➅➆➇➈➉➊➋➌➍➎➏➐➑➒➓"
			+ "➔➘➙➚➛➜➝➞➟➠➡➢➣➤➥➦➧➨➩➪➫➬➭➮➯➱➲➳➴➵➶➷➸➹➺➻➼➽➾★☆☉☎☏ ☜ ☞☬♀♂✁✂✃✄✆✇✈✉✌✍✎✏✐✑✒☉☎☏☜☞☬♀♂"
			+ "♔♕♖♗♘♙♚♛♜♝♞ლ♛๑✧ஆஇஈஊஎஏஐஒஓஔ◌ஂஃ◌ா◌ி◌ௗஙஜஞணநனமயறலளழ வஸஹ௧௨௩௪௫ д╬☉ღ❤ஐ◌ிΔ❤ˇټ"
			+ "๑۩۞۩✿✾✌✍✎✏❀ิ✌✐≫½¿✪ ★☆☎☏☞☜✐✑✒✔✕✖✗✘✙✚✛✜✝✞ ✯✮✬✫✪✧✦✥✤✣✢✡✠✰✱✰❀❂❄❅❉❊❋❣❤❦❤✨";
	
			for (var i = 0; i < arr_char.length; i++)
			{
				if (value.indexOf(arr_char[i]) != -1) {
					alert("특수문자는 입력하실 수 없습니다.");
					value = value.substr(0, value.indexOf(arr_char[i]));
					
					$(this).val(value);
				}	
			}
	});
	
	$('#joinCheck').click(function()
	{	
	var idRe =  /^[a-z]+[a-z0-9]{3,15}$/g; // 아이디 유효성 검사
	var nameRe = /^[가-힣a-zA-Z]+$/; // 이름 유효성 검사

	// 이메일 유효성 검사
	var emailRe = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	// 이메일주소 형식 체크 정규식2
    //var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	var phoneRe = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g; // 핸드폰번호 유효성 검사
	
	// 비밀번호 규칙 정규식
	// : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
    var pwRe = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
	
	var users_id = $('#users_id').val();
		users_id = $.trim(users_id);
	var users_pw = $("#users_pw").val();
		users_pw = $.trim(users_pw);
	var users_name = $("#users_name").val();
		users_name = $.trim(users_name);
	var users_jumin = $("#users_jumin").val();
		users_jumin = $.trim(users_jumin);
	var users_email = $("#users_email").val();
		users_email = $.trim(users_email);
	var users_phone_number = $("#users_phone_number").val();
		users_phone_number = $.trim(users_phone_number);

	if(users_id == null || users_id.length == 0)
	{
		alert("아이디를 입력해 주세요.");
		$("#users_id").focus();
		return;
	}
	 else if (!idRe.test(users_id))
	{
		alert("아이디는 4자 이상 15자 이하 입니다.");
		$("#users_id").focus();
		return;
	}
	 else if (users_pw == null || users_pw.length == 0 )
	{
		alert("비밀번호를 입력해 주세요.");
		$("#users_pw").focus();
		return;
	}
	 /*
	 else if (!pwRe.test(users_pw))
	{
		alert("비밀번호는 숫자,특수문자 1회이상,/n영문은 2개 이상으로 8자리 이상 입니다.")
		$("#users_pw").focus();
		return;
	}	 
	 */
	 else if (users_name == null || users_name.length == 0)
	{
		alert("이름을 입력해 주세요.");
		$("#users_name").focus();
		return;
	}
	 else if (!nameRe.test(users_name))
	{
		 alert("이름은 한글과 영문만 가능합니다.");
		 $("#users_name").focus();
		 return;
	}
	 else if (users_jumin == null || users_jumin.length == 0)
	{
		alert("주민등록번호를 입력해 주세요.");
		$("#users_jumin").focus();
		return;
	}
	 else if (users_jumin.length != 13)
	{
		 alert("주민등록번호 13자리를 작성 해 주세요.");
		 $("#users_jumin").focus();
		 return;
	}
	 else if (isNaN(users_jumin) == true)
	{
		alert("주민등록 번호는 - 없이 숫자만 입력해 주세요. ex) 8011111022210");
		$("#users_jumin").focus();
		return;
	}
	 else if (users_email == "")
	{
		alert("이메일을 입력해 주세요.");
		$("#users_email").focus();
		return;
	}
	 else if (!emailRe.test(users_email))
	{
		alert("이메일 양식을 지켜주세요. ex) test@naver.com");
		$("#users_email").focus();
		return;
	}
	 else if (users_phone_number == null || users_phone_number.length == 0)
	{
		alert("핸드폰 번호를 입력해 주세요.");
		$("#users_phone_number").focus();
		return;
	}
	 else if (!phoneRe.test(users_phone_number))
	{
		alert("핸드폰 번호 양식을 지켜주세요. ex) 010-0000-1111");
		$("#users_phone_number").focus();
		return;
	}
	 else if (idck == 0)
	{
		alert("중복 체크 버튼을 눌러주세요.");
		return false;
	}
	 
	var form = $("#hairUserJoinForm");
		form.attr("method", "post");
		form.attr("action", "<c:url value="/hairUserJoin.do" />");
		
		alert('회원가입이 완료 되었습니다.');
		
		/* 열려있는 부모 팝업창을 닫는다. (회원가입 할 때 로그인 팝업이 유지되면 안되므로.) */
		window.open('/loss/_popup.do','login popup').close();
		
		form.submit();
	});
});

</script>

<title>머머리 월드 회원가입</title>
</head>
<body>
<div class="container">
		<h3>회원가입</h3>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<form id="hairUserJoinForm" name="hairUserJoinForm" autocomplete="off">
				<div class="form-group form-group-lg">
					<label class="col-sm-10" for="users_id">
						<input class="form-control " type="text" id="users_id" name="users_id" maxlength="15" autofocus placeholder="아이디">
					</label>
					<input class="btn btn-success pull-right" id="reg_submit" name="reg_submit" type="button" value="중복체크">
				</div>
				
				<div class="form-group form-group-lg" id="id_check"></div>
				
				<div class="form-group form-group-lg">
					<label class="col-sm-11" for="users_pw">
						<input class="form-control" type="password" id="users_pw" name="users_pw" maxlength="15" placeholder="비밀번호"><br>
					</label>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-11" for="users_name">
						<input class="form-control" type="text" id="users_name" name="users_name" placeholder="이름" min="4" maxlength="20"><br>
					</label>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-11" for="users_jumin">
						<input class="form-control" type="text" id="users_jumin" name="users_jumin" placeholder="주민등록번호" ma><br>
					</label>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-11" for="users_email">
						<input class="form-control" type="email" id="users_email" name="users_email" placeholder="이메일"><br>
					</label>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-11" for="users_phone_number">
						<input class="form-control" type="text" id="users_phone_number" name="users_phone_number" placeholder="핸드폰번호"><br>
					</label>
				</div>
				<div style="width: 30%; float:none; margin:0 auto;">
					<div class="btn-group" role="btn-group">
						<input class="btn btn-success" type="button" id="joinCheck" name="joinCheck" value="회원가입">
					</div>
					<div class="btn-group" role="btn-group">
						<input class="btn btn-success pull-right" type="reset" > 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>	
</body>
</html>
<%@ include file = "../common/footer.jsp" %>