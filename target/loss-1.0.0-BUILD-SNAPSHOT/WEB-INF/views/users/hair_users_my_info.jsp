<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

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
// F5, F12 막기
window.onkeydown = function()
{
	var kcode = event.keyCode;
	if(kcode == 123 || kcode == 116) event.returnValue = false;
}
</script>


<title>머머리 월드 회원가입</title>
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

<body class="no-drag" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div class="container">
		<h3>내 정보 보기</h3>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<form id="hairUserMyInfoForm" name="hairUserMyInfoForm" autocomplete="off">
				<div class="form-group">
					<label class="col-sm-12" for="users_id">
						아이디 <input class="form-control" type="text" id="users_id" name="users_id" value = "${hairUserGetMyInfo.users_id}" disabled="disabled"><br>
					</label>
					<label class="col-sm-12"  for="users_pw">
						비밀번호 <input class="form-control" type="password" id="users_pw" name="users_pw" value = "${hairUserGetMyInfo.users_pw}" placeholder="비밀번호"><br>
					</label>
					<label class="col-sm-12"  for="users_name">
						이름 <input class="form-control" type = "text" id="users_name" name="users_name" value = "${hairUserGetMyInfo.users_name}" disabled="disabled"><br>
					</label>
					<label class="col-sm-12"  for="users_email">
						이메일 <input class="form-control" type="email" id="users_email" name="users_email" placeholder="이메일" value = "${hairUserGetMyInfo.users_email}"><br>
					</label>
					<label class="col-sm-12"  for="users_phone_number">
						핸드폰 번호 <input class="form-control" type="text" id="users_phone_number" name="users_phone_number" placeholder="핸드폰번호" value = "${hairUserGetMyInfo.users_phone_number}"><br>
					</label>
					</div>
					<p style="color:red;">${msg}</p>
				<input class="btn btn-success pull-right" type="button" id="myInfoCheck" name="myInfoCheck" value="정보 변경">
			</form>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file = "../common/footer.jsp" %>