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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<title>로그인</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body{
font-family: 'Noto Sans KR', sans-serif;
}

body > div.container{
	border: 3px solid #D6CDB7;
    margin-top: 10px;
    background-color: beige;
      }
        
p{
      text-align: center;
  }
  
h3.tit {
    color: #333;
    font-size: 1.2em;
    line-height: 1.1;
}  

.col-wrap{

	letter-spacing: 0;
	line-height: 1.5;
	font-size: 15px;
	color: #444;
	font-weight: 400; 

}
  
.login-input-area .input-text {
    display: block;
    width: 100%;
    height: 46px;
}

.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
  
.login-input-area .chk-util {
    overflow: hidden;
    padding: 15px 0 35px 0;
}

.login-input-area .chk-util .left {
    float: left;
}

[type=checkbox], [type=radio] {
    width: 16px;
    height: 16px;
    vertical-align: middle;
}
[type=checkbox], [type=radio] {
    box-sizing: border-box;
    padding: 0;
}

label {
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
}

.button.purple.large {
    line-height: 46px;
}
.login-input-area .btn-login {
    display: block;
    width: 100%;
}

.login-input-area .link {
    padding: 20px 0 30px 0;
    text-align: center;
    line-height: 1.1;
}

	

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

	
	
	function clickBtn(){
		$("#btn").trigger("click");
	}
	

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
	    var re =  /^[0-9a-z]{5,15}$/;  // 아이디가 적합한지 검사할 정규식
	    var re3 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{5,15}$/; 
	    
	 	var id= $("#userId").val();  //숫자,영문섞어서 5~15자 이내   	
		var pw= $("#password").val(); //숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력    		
		
		if(!check(re,id,"아이디는 5~15자의 영문 소문자와 숫자로만 입력해주세요.")) {
			console.log(id);
			$("#userId").focus();
		    return;
		}
		
		if(!check(re3,pw,"비밀번호는 5~15자의 영문 소문자와 숫자,특수문자를 포함하여 입력해주세요.")) {
		    return;
		}
	}
	
	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}
	
$(function(){	
	
	clickBtn();
	
	$("#btn").on('click',function(){	
		self.location="/user/login";
	})
	
	
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

			
		
	

	//$('#loginBtn').button('toggle').addClass('fat')
	
	$('#loginBtn').on('click',function(){
		console.log("클릭");
		id= $('#userId').val();
		pw= $('#password').val();
		
		if(id == '' || id ==null||pw == '' || pw ==null){
			alert('아이디와 비밀번호를 입력하세요.');
			$('#loginBtn').attr("disabled", true);
			location.reload();
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
<!-- 	<!-- 화면구성 div Start /////////////////////////////////////--> 
<!-- 	<div class="container"> -->
		
<!-- 		<h1 class="bg-default text-center">로 그 인</h1> -->
		
<!-- 		<!-- form Start /////////////////////////////////////-->	 
<!-- 		<form> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label for="userId">아이디</label> -->
<!-- 				<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요."> -->
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label for="password">비밀번호</label> -->
<!-- 	    		<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요."> -->
<!-- 	  		</div> -->
<!-- 	  		<div class="form-group text-center"> -->
<!-- 	  			<button type="button" class="btn btn-primary" id="loginBtn">로그인</button> -->
<!-- 	  		</div>  -->
<!-- 	  		<p> -->
<!-- 	  			<a href="/user/userAuthorization?type=findId"  title="아이디 찾기">아이디찾기></a>&nbsp;  -->
<!-- 	  			<a href="/user/userAuthorization?type=findPw"  title="비밀번호 찾기">비밀번호찾기></a>&nbsp;  -->
<!-- 	  			<a href="/user/userAuthorization?type=addUnUserView"  title="비회원 예매">비회원예매></a>&nbsp;  -->
<!-- 	  			<a href="/user/unUserLogin"  title="비회원 로그인">비회원 예매확인></a>&nbsp;  -->
<!-- 	  			<a href="/user/userAuthorization?type=findUnUserPw"  title="비회원 비밀번호찾기">비회원 비밀번호찾기></a> -->
<!-- 	  		</p> -->
<!-- 	  		<div name="naverLogin" class="text-center"> -->
<!-- 				<img src="/resources/image/naverImage.png" id ="naverLogin" width="180" height="40" />  -->
<!-- 				<img src="/resources/image/kakaoImage.png" id ="kakaoLogin" width="180" height="40" /> -->
<!-- 				<img src="/resources/image/googleImage.png" id ="googleLogin" width="180" height="40" />  -->
<!-- 	  		</div> -->
<!-- 	  		<p></p> -->
<!-- 	  		<div class="form-group text-center"> -->
<!-- 	  			<button type="button" class="btn btn-primary" id="signUpBtn">회원가입</button> -->
<!-- 	  		</div> -->
<!-- 		</form> -->
<!-- 		<br/> -->
<!-- 		<!-- form end /////////////////////////////////////--> 
<!-- 	</div> -->
<!-- 	<!--  화면구성 div end /////////////////////////////////////--> 


<!-- Button trigger modal -->
<button type="button" id="btn" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">
  Login
</button>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
        <h3 class="tit" id="exampleModalLabel">로그인</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
	    <!-- col-wrap -->
	    <form>
			<div class="col-wrap">
				<div class="col left">
					<div class="login-input-area">
						<input autocomplete="off" id="userId" name="userId" maxlength="20" type="text" placeholder="아이디" title="아이디를 입력하세요" class="input-text strTrim"><!--아이디--><!--아이디를 입력하세요-->
						<input autocomplete="off" id="password" name="password" maxlength="20" type="password" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text mt15" style="margin-top: 15px;"><!--비밀번호--><!--비밀번호를 입력하세요-->
		
						<!-- chk-util -->
						<div class="chk-util">
							<div class="left">
								<input id="chkIdSave" type="checkbox"> <label for="chkIdSave">아이디 저장<!--아이디 저장--></label>
							</div>
						</div>
						<!--// chk-util -->
			
						<button id="loginBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; height: 46px;  border: 0; width: 100%; cursor: default; background-color:#fee50e;" disabled="disabled">로그인<!--로그인--></button>
			
						<div class="link" style="padding-top: 20px; padding-bottom: 30px; text-align: center;">
							<a href="/user/userAuthorization?type=findId" title="ID 찾기 선택" style=" margin-left:10px; color: #333; ">ID 찾기<!--ID/PW 찾기--></a>
							<a href="/user/userAuthorization?type=findPw" title="PW 찾기 선택" style=" margin-left:10px; position: relative; color: #333;">PW 찾기<!--ID/PW 찾기--></a>
							<a href="/user/userAuthorization.jsp?type=addUser" title="회원가입 선택"style=" margin-left:10px; relative; position: relative; color: #333;">회원가입<!--회원가입--></a>
							<a href="/user/userAuthorization?type=addUnUserView" title="비회원 예매"style=" margin-left:10px; position: relative; color: #333;">비회원 예매<!--비회원 예매--></a>
							<a href="/user/unUserLogin" title="비회원 예매확인 선택"style=" margin-left:10px; position: relative; color: #333;">비회원 예매확인<!--비회원 예매확인--></a>
						</div>
			
						<div class="sns-login" style="text-align: center;">
							<a href="" style="margin-left: 23px; margin-right: 23px;" id ="naverLogin" title="네이버로 로그인 선택" ><img src="/resources/image/user/ico-naver.png" alt="네이버"></a>
							<a href="" style="margin-left: 23px; margin-right: 23px;" id ="kakaoLogin" title="카카오톡으로 로그인 선택"><img src="/resources/image/user/ico-kakao.png" alt="카카오톡"></a>
							<a href="" style="margin-left: 18px; margin-right: 23px;" id ="googleLogin" title="구글로 로그인 선택"><img src="/resources/image/user/ico-google.png" alt="구글"></a>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--// col-wrap -->
      </div>
    </div>
  </div>
</div>



</body>
</html>