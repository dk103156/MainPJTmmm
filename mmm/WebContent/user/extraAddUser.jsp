<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>추가정보 입력</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
  body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            background-color: beige;
        }
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function(){
	$('#addUserBtn').on('click',function(){
		console.log("클릭");
		validate();
		
	});
	
	//============= "취소" Event 처리 및  연결 ===========
	$("a[href='#']").on("click",function(){
		$("form")[0].reset();
	});		


	function validate() {
	    
	    var re2 = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g // 이메일이 적합한지 검사할 정규식
		var re4 = /^[가-힣]{2,15}$/ //이름이 한글인지 검사할 정규식
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
	    
	
		var name = $("#userName").val();
		var birth = $("#birth").val(); 
		var addr = $("#addr").val(); 
		var email = $("#email").val(); 
		var phone = $("#phone").val().replace(/-/gi,''); 
		var isChk = $("#agreeCheck").is(":checked");
		console.log("쳬크빢쓰 : "+isChk)
		
		
		
		if(name == "") {
		    alert("이름을 입력해 주세요");
		    $("#userName").focus();
		    return false;
		}
		
		if(!check(re4, name, "한글만 입력 가능합니다.")) {
		    return false;
		}
		
		if(birth=="") {
		    alert("생년월일을 입력해 주세요");
		    console.log(birth);
		    $("#birth").focus();
		    return false;
		}
		
		if(email=="") {
		    alert("이메일을 입력해 주세요");
		    $("#email").focus();
		    return false;
		}
		
		 
		if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		    return false;
		}
		
		if(!(phone.length==11||phone.length==10)) {
		    alert("전화번호를 확인해주세요.");
		    $("#phone").focus();
		    return false;
		}
		if(!check(re5,phone,"숫자만 입력해주세요.")){
			$("#phone").focus();
			return;
		}
		
		if(!isChk){
			alert("개인정보 수집동의 체크해주세요.")
			return;
		}
		
		alert("가입을 축하합니다.!!!!");
		$("form").attr("method" , "POST").attr("action" , "/user/extraAddUser").submit();
		
		
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
						$("#addUserBtn").attr("disabled", true);
				}else{
					$("#confirmNum1").text("");
					$("#addUserBtn").attr("disabled", false);
				} 
				}, error : function() {
						console.log("실패");
				}
			})//ajax 끝
		});//중복체크 끝
	
});



</script>
</head>
<body>
<body>
<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-default text-center">추 가 정 보 입 력</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form>
		  	<div class="form-group row">
		    	<label for="userName" class="col-sm-2 col-form-label">이름</label>
		    	<div class="col-sm-10">
		      		<input type="hidden" class="form-control" id="userId" name="userId" value="${user.userId}">
		      		<input type="hidden" class="form-control" id="password" name="password" value="${user.password}">
		      		<input type="hidden" class="form-control" id="identity" name="identity" value="${user.identity}">
		      		<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}"placeholder="이름">
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
			<div class="form-group row">
    			<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
    			<div class="col-sm-10">
      				<input type="date" class="form-control" id="birth" name="birth" placeholder="ex)20200101">
    			</div>
			</div>
<!-- <div class="form-group row">
		    	<label for="userName" class="col-sm-2 col-form-label">주소</label>
		    	<div class="col-sm-10">
		      		<input type="text" class="form-control" id="addr" name="addr" placeholder="주소">
		    	</div>
		  	</div> -->
  			<div class="form-group row">
    			<label for="email" class="col-sm-2 col-form-label">이메일</label>
    			<div class="col-sm-10">
      				<input type="email" class="form-control" id="email" name="email" value="${user.email}" placeholder="이메일">
    			</div>
  			</div> 
			<div class="form-group row">
    			<label for="phone" class="col-sm-2 col-form-label">휴대전화번호</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" id="phone" name="phone" placeholder="-없이 입력해주세요.">
    			</div>
    			<h6 id="confirmNum1" style="color: red;"></h6>
  			</div>
  			<div class="form-group row">
    			<label for="likeGenre1" class="col-sm-2 col-form-label">선호장르</label>
    			<div class="col-sm-3">
    				<select class="form-control" id="likeGenre1" name="likeGenre1">
      					<option>드라마</option>
						<option>코미디</option>
						<option>액션</option>
						<option>멜로/로맨스</option>
						<option>스릴러</option>
						<option>미스터리</option>
						<option>공포(호러)</option>
						<option>어드벤쳐</option>
						<option>범죄</option>
						<option>가족</option>
						<option>판타지</option>
						<option>SF</option>
						<option>서부극(웨스턴)</option>
						<option>사극</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
						<option>전쟁</option>
						<option>뮤지컬</option>
						<option>성인물(에로)</option>
						<option>공연</option>
						<option>기타</option>
    				</select>
    			</div>
    			<div class="col-sm-3">
					<select class="form-control" id="likeGenre2" name="likeGenre2">
						<option>드라마</option>
						<option>코미디</option>
						<option>액션</option>
						<option>멜로/로맨스</option>
						<option>스릴러</option>
						<option>미스터리</option>
						<option>공포(호러)</option>
						<option>어드벤쳐</option>
						<option>범죄</option>
						<option>가족</option>
						<option>판타지</option>
						<option>SF</option>
						<option>서부극(웨스턴)</option>
						<option>사극</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
						<option>전쟁</option>
						<option>뮤지컬</option>
						<option>성인물(에로)</option>
						<option>공연</option>
						<option>기타</option>
					</select>
    			</div>
				<div class="col-sm-3">
					<select class="form-control" id="likeGenre3" name="likeGenre3">
						<option>드라마</option>
						<option>코미디</option>
						<option>액션</option>
						<option>멜로/로맨스</option>
						<option>스릴러</option>
						<option>미스터리</option>
						<option>공포(호러)</option>
						<option>어드벤쳐</option>
						<option>범죄</option>
						<option>가족</option>
						<option>판타지</option>
						<option>SF</option>
						<option>서부극(웨스턴)</option>
						<option>사극</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
						<option>전쟁</option>
						<option>뮤지컬</option>
						<option>성인물(에로)</option>
						<option>공연</option>
						<option>기타</option>
					</select>
				</div>
  			</div>
  			<div class="form-group row">
				<label for="likeTheater1" class="col-sm-2 col-form-label">자주가는 극장</label>
    			<div class="col-sm-3">
					<select class="form-control" id="likeTheater1" name="likeTheater1">
						<c:forEach var="i" items="${getTheaterList}">
			   				<option>${i.theaterName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-3">
					<select class="form-control" id="likeTheater2" name="likeTheater2">
						<c:forEach var="i" items="${getTheaterList}">
			   				<option>${i.theaterName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-3">
					<select class="form-control" id="likeTheater3" name="likeTheater3">
						<c:forEach var="i" items="${getTheaterList}">
			   				<option>${i.theaterName}</option>
						</c:forEach>
					</select>
				</div>
  			</div>
  			<div class="form-check">
			    <input type="checkbox" class="form-check-input" id="agreeCheck">
			    <label class="form-check-label" for="agreeCheck">개인정보수집 및 이용 동의</label>
			</div>	
			<div class="form-group row">
				<div class="col-sm-12 text-center">
					<button type="button" id="addUserBtn" class="btn btn-primary" >가&nbsp;입</button>
      				<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
    			</div>
			</div>
			
		</form>
		<!-- form end /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	

</body>
</html>