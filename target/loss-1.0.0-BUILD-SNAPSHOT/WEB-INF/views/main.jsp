<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file = "common/header.jsp" %>
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
function test(){
	var num = new Array();
	num = ['test1',2,'test3','test4',5];
	test2(num);
}
function test2(n){
	alert(n);
	n.forEach(function(element, index, array) {
		alert(element);
	});
	
}


$(document).ready(function(){
	test();
	if(${not empty sessionScope.users_id}){
		
		window.opener.location.reload();
		window.close();
	}
});

</script>

<title>머머리 월드</title>
</head>
<body> 
	<div id="carousel" class="carousel slide" data-ride="carousel" style="margin: 30px;">
	
		<ul class="carousel-indicators">
			<li data-target="#carousel" data-slide-to="0" class="active"></li>
			<li data-target="#carousel" data-slide-to="1"></li>
			<li data-target="#carousel" data-slide-to="2"></li>
		</ul>
		
		<div class="carousel-inner">
			<div class="carousel-item active">
				<a href="#">
					<img style="width: 600px; height: auto; display: block; margin: 0px auto;" src="../resources/img/img-01.jpg" alt="야너두">
				</a>
			</div>
			<div class="carousel-item">
				<a href="#">
					<img style="width: 600px; height: auto; display: block; margin: 0px auto;" src="../resources/img/img-02.jpg" alt="공인중개사 합격 에듀윌!!">               
				</a>
			</div>
			<div class="carousel-item">
				<a href="#">
					<img style="width: 600px; height: auto; display: block; margin: 0px auto;" src="../resources/img/img-03.jpg" alt="야근">
		    	</a>
		    </div>
		</div>  
		
		<a class="carousel-control-prev" href="#carousel" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#carousel" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
</body>
</html>
<%@ include file = "common/footer.jsp" %>