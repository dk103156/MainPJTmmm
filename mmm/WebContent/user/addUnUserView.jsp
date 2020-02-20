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

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
</style>

<title>비회원 로그인</title>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function(){
	$('#addUserBtn').on("click",function(){
		console.log('click');
		validate();
	})
	
	
	
	function validate() {
	    var re =  /^[0-9]{4}$/;  // 패스워드가 적합한지 검사할 정규식
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
	    
		var pw= $("#password").val(); 
		var checkPw= $("#password2").val();
		var birth = $("#birth").val(); 
		var phone = $("#phone").val().replace(/-/gi,''); 
		var isChk = $("#agreeCheck").is(":checked");
		console.log("쳬크빢쓰 : "+isChk)
		
		
		if(birth=="") {
		    alert("생년월일을 입력해 주세요");
		    console.log(birth);
		    $("#birth").focus();
		    return false;
		}
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			$("#addUserBtn").attr("disabled", true);
			return;
		}else if(phone != "" && phone.length <11 ){ 
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
			$("#addUserBtn").attr("disabled", true);
		    return;	
		}else if(re5.test(phone)){
				$("#confirmNum1").text("");
				$("#smsBtn").attr("disabled", true);
		}else{
			$("#confirmNum1").text("");
		}
		
		
		if(!check(re,pw,"패스워드는 4자리 숫자로만 입력해주세요.")) {
		    return;
		}
		
		if(pw != checkPw) {
		    alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		    $("#password2").val("");
		    $("#password2").focus();
		    return;
		}
		
		
		if(!isChk){
			alert("개인정보 수집동의 체크해주세요.")
			return;
		}

		alert("가입을 축하합니다.!!!!");
		$("form").attr("method" , "POST").attr("action" , "/user/addUnUser").submit();
			
	}

	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}	


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
						$("#confirmNum1").text("등록된 아이디가 있습니다. 로그인 해주세요 :p ");
						$("#confirmNum1").css("color", "red");
						$("#confirmNum1").css("color", "red");
						$("#smsBtn").attr("disabled", true);
						$("#addUserBtn").attr("disabled", true);
				}else{
					$("#confirmNum1").text("");
					$("#smsBtn").attr("disabled", false);
					//$("#addUserBtn").attr("disabled", false);
				} 
				}, error : function() {
						console.log("실패");
				}
		})//ajax 끝
	});//중복체크 끝  
	
	/* 
	///////////////////////휴대폰번호 인증///////////////////////////////////
	$("#smsBtn").on("click", function(){
		console.log("클릭!")
		var phone = $("#phone").val();
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
		console.log(phone)
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			$("#addUserBtn").attr("disabled", true);
			return;
		}else if(phone != "" && phone.length <11 ){ 
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
			$("#addUserBtn").attr("disabled", true);
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
		
		
	$(document).on("click", "#smsChkBtn", function() {
		var numStr = $("#numStr").val();
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
					//$("div").text(JSONData.status); 
					
					if(JSONData == 0){
						//0: 인증번호가 틀림
						$('confirmNum2'),text('인증번호를 확인해주세요.');
						$("#confirmNum2").css("color", "red");
						$("#addUserBtn").attr("disabled", true);
					}else{
						$("#confirmNum2").text("인증이 완료되었습니다.");
						$("#addUserBtn").attr("disabled", false);
					}
				}, error : function() {
					console.log("실패");
				}
			})//ajax 끝	
		}	
	})//폰번호인증 끝 */
	
})




</script>
<body>

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-default text-center">비 회 원 예 매 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form>
			<div class="form-group row">
    			<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
    			<div class="col-sm-10">
      				<input type="date" class="form-control" id="birth" name="birth" placeholder="ex)20200101">
      				<input type="hidden" class="form-control" id="role" name="role" value="unUser">
    			</div>
			</div>
			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-2 pt-0">성별</legend>
						<div class="col-sm-6">
							<div class="form-check">
		          				<input class="form-check-input" type="radio" id="male" name="gender" value="M" checked>
		          				<label class="form-check-label" for="Male">
		                           	남	
		          				</label>
		        			</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" id="female" name="gender" value="F">
								<label class="form-check-label" for="female">
									여	
		          				</label>
							</div>
		      			</div>
				</div>
		  	</fieldset>
		  	<div class="form-group row" style="font-size: 12pt;">
				<label for="staticEmail" class="col-sm-2 col-form-label">휴대전화번호</label>
				<div class="input-group sm-10">
					<input type="text" class="form-control" placeholder="-없이 입력해주세요." id="phone" name="phone" aria-label="Recipient's username"
						aria-describedby="basic-addon2">
				</div>
				<h6 id="confirmNum1" style="color: red;"></h6>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password" name="password" placeholder="Password">
		    	</div>
			</div>
			<div class="form-group row">
				<label for="password2" class="col-sm-2 col-form-label">비밀번호확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password2" placeholder="Password">
				</div>
			</div>
			<div class="form-check">
			    <input type="checkbox" class="form-check-input" id="agreeCheck">
			    <label class="form-check-label" for="agreeCheck">개인정보수집 및 이용 동의</label>
			</div>	
			<div class="form-group row">
				<div class="col-sm-12 text-center">
					<button type="button" id="addUserBtn" class="btn btn-primary" >비회원 예매하기</button>
			 	</div>
			</div>
		</form>
		<!-- form end /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>