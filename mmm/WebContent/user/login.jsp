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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<title>로그인</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
  body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            background-color: beige;
        }
        
  p{
        text-align: center;
    }

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function(){
	
	function getParam(key) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var value = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == key) { value = temp[1]; }
	    }
	    return value;
	}

	var status = getParam("status");
	
	if(status=="failed"){
		alert("로그인 정보가 올바르지 않습니다.");
	}
	
	function validate() {
	    var re =  /^[0-9a-z]{5,15}$/;  // 아이디와 패스워드가 적합한지 검사할 정규식
	    
	 	var id= $("#userId").val();  //숫자,영문섞어서 5~15자 이내   	
		var pw= $("#password").val(); //숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력    		
		
		if(!check(re,id,"아이디는 5~15자의 영문 소문자와 숫자로만 입력")) {
			console.log(id);
			$("#userId").focus();
		    return;
		}
		
		if(!check(re,pw,"패스워드는 5~15자의 영문 소문자와 숫자로만 입력")) {
		    return;
		}
	}
	
	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}
	
	//======================"로그인" Event 연결==========
		
	$("#password").on("keydown",function (event) {
		 if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			console.log("클릭");
			id= $('#userId').val();
			pw= $('#password').val();
			validate();
			
			if(id == '' || id ==null||pw == '' || pw ==null){
				alert('아이디와 비밀번호를 입력하세요.');
				$('#loginBtn').attr("disabled", true);
				location.reload();
			/* }else if(pw == '' || pw ==null){
				alert('비밀번호를 입력하세요.');
				$('#loginBtn').attr("disabled", true); */
			}else{
				$('#loginBtn').attr("disabled", false);
				$('form').attr('method','POST').attr('action','/user/login').submit();	
			}
		 }
	})

			
		
	
	$('#loginBtn').on('click',function(){
		console.log("클릭");
		id= $('#userId').val();
		pw= $('#password').val();
		
		if(id == '' || id ==null||pw == '' || pw ==null){
			alert('아이디와 비밀번호를 입력하세요.');
			$('#loginBtn').attr("disabled", true);
			location.reload();
		/* }else if(pw == '' || pw ==null){
			alert('비밀번호를 입력하세요.');
			$('#loginBtn').attr("disabled", true); */
		}else{
			$('#loginBtn').attr("disabled", false);
			$('form').attr('method','POST').attr('action','/user/login').submit();	
		}
	})	
	
	
	
	$('#signUpBtn').on('click',function(){
		self.location = '/user/userAuthorization.jsp?type=addUser';
		
	})
	
	//===================naver Login============
	$('#naverLogin').on('click',function(){
		console.log('클릭');
		window.open('/naver/openWindow.jsp',
					'popWin',
					'left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no');
	})
	
	//===================kakao Login============
	$('#kakaoLogin').on('click',function(){
		console.log('클릭');
		window.open('/kakao/openWindow.jsp',
					'popWin',
					'left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no');
	})
	
	//===================google Login============
	$('#googleLogin').on('click',function(){
		console.log('클릭');
		window.open('/google/openWindow.jsp',
					'popWin',
					'left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no');
	})
	
});


</script>
</head>
<body>
	<!-- 화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<h1 class="bg-default text-center">로 그 인</h1>
		
		<!-- form Start /////////////////////////////////////-->	
		<form>
			<div class="form-group">
				<label for="userId">아이디</label>
				<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요.">
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label>
	    		<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요.">
	  		</div>
	  		<div class="form-group text-center">
	  			<button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
	  		</div> 
	  		<p>
	  			<a href="/user/userAuthorization?type=findId"  title="아이디 찾기">아이디찾기></a>&nbsp; 
	  			<a href="/user/userAuthorization?type=findPw"  title="비밀번호 찾기">비밀번호찾기></a>&nbsp; 
	  			<a href="/user/userAuthorization?type=addUnUserView"  title="비회원 예매">비회원예매></a>&nbsp; 
	  			<a href="/user/unUserLogin"  title="비회원 로그인">비회원 예매확인></a>&nbsp; 
	  			<a href="/user/userAuthorization?type=findUnUserPw"  title="비회원 비밀번호찾기">비회원 비밀번호찾기></a>
	  		</p>
	  		<div name="naverLogin" class="text-center">
				<img src="/resources/image/naverImage.png" id ="naverLogin" width="180" height="40" /> 
				<img src="/resources/image/kakaoImage.png" id ="kakaoLogin" width="180" height="40" />
				<img src="/resources/image/googleImage.png" id ="googleLogin" width="180" height="40" /> 
	  		</div>
	  		<p></p>
	  		<div class="form-group text-center">
	  			<button type="button" class="btn btn-primary" id="signUpBtn">회원가입</button>
	  		</div>
		</form>
		<br/>
		<!-- form end /////////////////////////////////////-->
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	


</body>
</html>