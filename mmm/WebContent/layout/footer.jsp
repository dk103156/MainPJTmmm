<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
   
   <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
<title></title>
 
<style>

body {
	font-family: 'Noto Sans KR', sans-serif !important;
}
 
footer {
	background-color:  #333;
}

.foo_div > a > img {
    width: 109px;
    height: 107px;
    border-radius: 50%;
    margin-top: 32px;
    margin-left: 30px;
}

.foo_div {
	float: left;
}

.foo_div1 {
	text-align: center;
}

.foo_div1 span {
	font-size: 15px;
	color: white;
}

.foo_div1 p {
	margin-top: 5px;
	color: white;
}


.foo_div1 div:nth-child(1) {
	margin-bottom: 10px;
}

.foo_div1 div > a > img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-top: 15px;
}

</style>


</head>


<script type="text/javascript">
$(function(){
	
	$('#mainLoginBtn').on('click',function(){
		$("#loginModal").modal("show");
		
	})
	
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
	
	
	
// 	//clickBtn();
	
// 	$("#btn").on('click',function(){	
// 		self.location="/user/login";
// 	})
	
	
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

<footer>
	    <div class="foo_div">
	    	<a href="/main" title="MMM"><img src="../resources/image/logo/logo.png"></a>
	    </div>
	    <div class="foo_div1" style="margin-right: 70px;">
		    <div class="3Sa_Logo">	    
		    	<a href="http://www.cgv.co.kr/" target="_blank"><img alt="" src="../resources/image/logo/CGV.png" style="margin-right: 50px;"></a> 
		    	<a href="https://www.lottecinema.co.kr/" target="_blank"><img alt="" src="../resources/image/logo/LotteCinema.png" style="margin-right: 50px;"></a>
		    	<a href="https://www.megabox.co.kr/" target="_blank"><img alt="" src="../resources/image/logo/MegaBox.jpg"></a>
		    </div>	
		    <div class="copyright">    
		    	<span>(주) MMM</span> <span> | </span>
		    	<span>대표 :  GETSET 조</span> <span> | </span>
		    	<span>사업자 등록번호 : 000-00-00000</span> <span> | </span>
		    	<p>주소 : 대한민국 어디엔가 사는!</p>
		    	<p style="margin-bottom: auto; padding-left: 138px;">뭅 ? 뭅 ! 뭅</p>
	    	</div>
	    </div>
</footer>
    
    <!-- Login Modal -->
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