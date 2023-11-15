const bnum = 1;

alert('test');

function listPage(){
	alert('test');
	listUrl = "/hairReply/all/" + bnum;
	alert(listUrl);
	sendAjax(listUrl, (isSuccess, res)=>{
		if(isSuccess){
			alert('test');
			let data = res.hairReplyList;
			let str = "";
     
			data.forEach(
			    (d) => {
				str += '<li data-rnum= "${d.rnum}" class= "replyList"><span>${d.rcontents}</span><button onclick=modClicked(this) class="point">수정</button></li>';
			    }
			);

			//test.jsp 비어있던 replies 함수에 목록을 추가
			$('#hairReply').html(str);
		}
	});
}

function sendAjax(url, fn,  method, jsonData){
	alert('test');
	let options = {
			method: method || 'GET',
			url: url,
			contentType: "application/json"
	};
	//jsonData가 있을 때만 data : JSON.stringify(jsonData) 추가
	if(jsonData){
		options.data = JSON.stringify(jsonData);
	}
	
	$.ajax(options).always((responseText, statusText, ajaxResult) =>{
		let isSuccess = statusText === 'success'; //ajax 호출 성공 여부
		fn(isSuccess,responseText);
		if(!isSuccess){
			alert("오류가 발생하였습니다. (errorMessage:" + responseText + ")");
		}
	})
}
w