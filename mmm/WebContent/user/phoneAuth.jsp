<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>휴대폰 인증</title>
<script type="text/javascript">
$(function(){	
	
	
	// 휴대폰중복체크(1 = 중복 / 0 != 중복)
	$('#phone').keyup(function() {
		console.log("클릭!!!")
		var phone = $('#phone').val();
		console.log(phone);
		$.ajax({
			url : '/user/json/phoneCheckDupl/'+ phone,
			type : 'get',
			success : function(data) {
				console.log("false = 중복o / true = 중복x : "+ data);							
				
				if (data == 0) {
						// 0 : 휴대폰번호가 중복되는 문구
						$("#confirmNum1").text("등록된 전화번호입니다 :p");
						$("#confirmNum1").css("color", "red");
						$("#smsBtn").attr("disabled", true);
				}else{
					$("#confirmNum1").text("");
					$("#smsBtn").attr("disabled", false);
				} 
				}, error : function() {
						console.log("실패");
				}
		})//ajax 끝
	});//중복체크 끝
	
		
		
	////////휴대폰번호 인증///////////////////////////////////
	$("#smsBtn").on("click", function(){
		console.log("클릭!")
		var phone = $("#phone").val();
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
		console.log(phone)
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			return;
		}else if(phone != "" && phone.length <11 ){
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
		    return;	
		}else if(re5.test(phone)){
				$("#confirmNum1").text("");
				$("#smsBtn").attr("disabled", false);
		}else{
			$("#confirmNum1").text("");
		}

		
		$.ajax({ 
			url : "/user/json/sendSMS/" + phone ,
			method : "get" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			success : function( JSONData , status ) {
				console.log("동작");
				console.log(JSONData.status);
				$("div").text(JSONData.status); 
			}
		})
	})
	

		
	$(document).on("click", "#chkBtn", function() {
		var numStr = $("#numStr").val();
		var phone = $('#phone').val();
		var len = numStr.length
		if(len != 6){
			$("#confirmNum2").text("인증번호를 확인해주세요.");
		}else {
			$.ajax({ 
				url : "/user/json/authSMS/" + numStr ,
				method : "get" ,
				datatype : "json" ,
				headers : {
					"Accept" : "application/json" ,
					"Content-Type" : "application/json"
				} ,
				success : function( JSONData , status ) {
					console.log("동작");
					console.log(JSONData.status);
					console.log(type);
					//$("div").text(JSONData.status); 
					
					if(JSONData == 0){
						//0: 인증번호가 틀림
						$('confirmNum2'),text('인증번호를 확인해주세요.');
						$("#confirmNum2").css("color", "red");
						$("#chkBtn").attr("disabled", true);
					}else{
						$("#confirmNum2").text("인증이 완료되었습니다.");
						$("#chkBtn").attr("disabled", false);
						
						if(type=="addUser"){
							self.location= "/user/addUser";
						
						} else if(type=="addUnUserView" ){
							self.location= "/user/addUnUserView";
							
						}else{
							nextPage(phone, "phone");
						}
						
					}
				}, error : function() {
					console.log("실패");
				}
			})//ajax 끝 
		}
		
	})//폰번호인증번호 입력후 확인 
					

});

</script>
</head>
<body>

<div class="row">
	<div class="col-md-6 center"></div>
		<div class="col-md-6 center" style="height: 300px; font-size: 14pt; padding-top: 7px; border: 1px solid purple; background-color: beige;">
			<strong>휴대폰 인증</strong>
			<form>
				<div class="form-group row" style="font-size: 12pt;">
					<label for="phone" class="col-sm-4 col-form-label">휴대전화번호</label>
					<div class="input-group sm-4">
						<input type="text" class="form-control" placeholder="-없이 입력해주세요." id="phone" name="phone" aria-label="Recipient's username"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" id="smsBtn"type="button">문자전송</button>
						</div>
					</div>
					<h6 id="confirmNum1" style="color: red;"></h6>
				</div>
				<div class="form-group row">
					<label for="numStr" class="col-sm-4 col-form-label"style="font-size: 12pt;">인증번호</label>
					<div class="col-sm-6">
						<input type="number" id="numStr" class="form-control" placeholder="인증번호 6자리">
					</div>
				</div>
				<h6 id="confirmNum2" style="color: red;"></h6>
				<div class="col-sm-12" style="text-align: center;">
					<button type="button" class="btn btn-dark" id="chkBtn">확인</button>
				</div>
			</form>
	</div>
</div>



</body>
</html>