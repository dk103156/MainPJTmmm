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
<title>내 정보 보기 </title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
}

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}
#contents.location-fixed {
    padding-top: 82px;
}
#contents {
    width: 100%;
    margin: 0;
    padding: 10px 0 0 0;
}


h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

.mb10 {
    margin-bottom: 10px!important;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

* {
    box-sizing: border-box;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}
table caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    opacity: 0;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.board-form tbody th {
    background: #f7f8f9;
}

.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}

table td, table th {
    padding: 0;
}

.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

.profile-photo {
    overflow: hidden;
}

div {
    display: block;
}

form {
    display: block;
    margin-top: 0em;
}

button, input {
    overflow: visible;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

input[type="file" i] {
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-align: start !important;
    padding: initial;
    border: initial;
}
.profile-photo .profile-img {
    overflow: hidden;
    float: left;
    width: 68px;
    height: 68px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border-radius: 68px;
    background-size: 100%;
    background-position: center;
}

.profile-photo .profile-img img {
    width: 100%;
    height: 100%;
}
img {
    border: 0;
}

.button.gray-line.small {
    line-height: 32px;
}

.profile-photo .button {
    float: left;
    margin: 17px 0 0 10px;
}

.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
}

.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}

button, select {
    text-transform: none;
}

button, input {
    overflow: visible;
}

.profile-photo .button.member-out {
    float: right;
    margin-left: 0;
}	

a.button:active, a.button:focus, a.button:hover, a.button:visited {
    color: #503396;
}

.profile-photo .button {
    float: left;
    margin: 17px 0 0 10px;
}

.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}

a.button {
    text-decoration: none;
}

a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}

.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #503396;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}	

.mt40 {
    margin-top: 40px!important;
}

.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}

h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #503396;
    line-height: 1.1;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.tit-util .right {
    float: right;
}
.tit-util:after {
    clear: both;
}

.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}
p.reset {
    padding: 0;
    margin: 0;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.font-orange {
    color: #e63e30!important;
}

em {
    font-style: normal;
}

form {
    display: block;
    margin-top: 0em;
}

button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

input[type="hidden" i] {
    display: none;
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

table caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    opacity: 0;
}

colgroup {
    display: table-column-group;
}

col {
    display: table-column;
}

a.button.gray-line:active, a.button.gray-line:focus, a.button.gray-line:hover, a.button.gray-line:visited {
    color: #444;
}

.modal-layer {
    overflow-y: scroll;
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 501;
    background-color: rgba(0,0,0,0);
}

.modal-layer .focus {
    display: block;
    position: absolute;
    left: -9999px;
    top: -9999px;
    z-index: 502;
}

a {
    background-color: transparent;
}

a:-webkit-any-link {
    cursor: pointer;   
}

.modal-layer .wrap {
    position: absolute;
    left: 50%;
    top: 50%;
    width: 300px;
    min-height: 250px;
    margin: 0;
    padding: 45px 0 0 0;
    box-shadow: 2px 2px 6px 2px rgba(0,0,0,.1);
    background: #fff;
}

.modal-layer .wrap .layer-header {
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 45px;
    background: #503396;
}	

.modal-layer .wrap .layer-header h3.tit {
    color: #fff;
    padding: 15px 20px 0 20px!important;
    font-size: 1.2em;
    line-height: 1.1;
}	

.modal-layer .wrap .layer-con {
    overflow-y: auto;
    background-color: #fff;
    padding: 20px 20px 0 20px;
}

.box-gray.v1 {
    border-radius: 5px;
}

.mt20 {
    margin-top: 20px!important;
}

label {
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
}

.clearfix:after {
    clear: both;
}
.lh32 {
    line-height: 32px;
}

.w170px {
    width: 170px!important;
}
.float-l {
    float: left!important;
}

.change-phone-num-area {
    display: none;
    padding: 10px 0 0 0;
}

.change-phone-num-area .position {
    overflow: hidden;
    position: relative;
    margin-top: 10px;
    padding: 0;
}

.change-phone-num-area .position .label {
    width: 110px;
    line-height: 32px;
}

.change-phone-num-area .position>* {
    float: left;
}

.w160px {
    width: 160px!important;
}

.change-phone-num-area .position .button {
    margin-left: 6px;
}

.chk-num {
    display: inline-block;
    position: relative;
    padding: 0;
    vertical-align: middle;
}

.chk-num.small .line {
    height: 32px;
}
.chk-num .line {
    position: relative;
    height: 36px;
    padding: 0 50px 0 0;
    border: 1px solid #d8d9db;
    background-color: #fff;
}

.w180px {
    width: 180px!important;
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
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

.mt40 {
    margin-top: 40px!important;
}



.btn-group .button {
    margin: 0 3px;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}

.button.purple.large {
    line-height: 46px;
}
.btn-group .button {
    margin: 0 3px;
}
.button.purple {
    color: #fff;
    line-height: 36px;
    border: 0;
    background: #503396;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}

.btn-group:after {
    clear: both;
}
.btn-group:after, .btn-group:before {
    content: '';
    display: table;
}

.btn-group, .btn-group-vertical {
    position: relative;
    display: -ms-inline-flexbox;
    display: inline-flex;
    vertical-align: middle;
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
	
	
	
	
	
	
	
	
	
	$("#updateImgBtn").on("click",function(){
		$("#fileForm").attr("action","/user/addProfile").attr("method","post").attr("enctype","multipart/form-data").submit();
	})
	
	
	$("#updateBtn").on("click",function(){
		$("#InfoForm").attr("action","/user/updateUser").attr("method","post").submit();
	})
	
	$("#byeBtn").on("click",function(){
		var userNo= $("#userNo").val();
		self.location="user/byeUser"+userNo;
	})
	
	// 파일 선택 후 액션
    $('#profileTarget').on('change', function(e) {
    	var fileSize = this.files[0].size;
		var maxSize = 360 * 360;
 		if(fileSize > maxSize) {
			alert("파일용량을 초과하였습니다.");
			$(".custom-file label").html("<i class='fas fa-camera-retro'>size 360x360</i>");
			$("#preview").html("");
			return;
		}else{
			
			readImg(this);
		}
	})

	function readImg(input){
    	
		var width = 360;
		var height = 360;
	
		if(input.files && input.files[0]){
			var render = new FileReader();
			
			render.onload = function(e){
				var image = $('#preview').attr('src',e.target.result).attr('width','300px').attr('height','300px').css('overflow' , 'hidden');
				console.log(e.target.result);
				 $("#preview").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px; overflow : hidden'>");
			}	
			 render.readAsDataURL(input.files[0]);
		}
	}

	
	// 첨부파일 추가
	$('#addProfileImgBtn').on('click', function() {
	    $('#profileTarget').click();
	});
	

	


});

</script>
</head>
<body>

<!--container-->
<div class="container">
	<div id="contents">
		<h2 class="tit">개인정보 수정</h2>

		<ul class="dot-list mb10">
			<li>회원님의 정보를 정확히 입력해주세요.</li>
		</ul>

		<div class="table-wrap">
			<table class="board-form">
				<caption>프로필사진, 아이디 항목을 가진 표</caption>
				<colgroup>
					<col style="width:180px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">프로필 사진</th>
							<td>
							<div class="profile-photo">
								<form name="fileForm" id="fileForm">
									<input type="file"  class="profileTarget" id="profileTarget" name="image" accept="image/*" style="display: none;">
									<input type="hidden" name="userNo" id="userNo" value="${user.userNo}">
									
									<div class="profile-img" id="preview">
										<c:if test="${user.profile.trim() eq null}">	
											<img src="https://www.megabox.co.kr//static/pc/images/mypage/bg-profile.png" alt="프로필 사진 샘플" />
										</c:if>
										<c:if test="${user.profile.trim() ne null}">
											<img alt="" src="/resources/image/${user.profile}">
											<input type="hidden" name="profile" value="${user.profile}">
										</c:if>
									</div>
								</form>
								
								<button type="button" class="button small gray-line" id="addProfileImgBtn">이미지 선택</button>
								<button type="button" class="button small gray-line" id="updateImgBtn">등록</button>
								<!-- Button trigger modal -->
								<button type="button" class="button small member-out" data-toggle="modal" data-target="#staticBackdrop" title="회원탈퇴">회원탈퇴</button>
								
								<!-- Modal -->
								<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="staticBackdropLabel">회원 탈퇴</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        ${user.userName}님 탈퇴를 하시겠습니까?
								        	원한다면 해볼테면 해보슈
								        <input type="password" name="password" id="password">	
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								        <button type="button" class="btn btn-primary" id="byeBtn">탈퇴</button>
								      </div>
								    </div>
								  </div>
								</div>
							</div>
							</td>
					</tr>
					<tr>
						<th scope="row">아이디</th>
							<td>${user.userId}</td>	
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="tit-util mt40 mb10">
			<h3 class="tit">기본정보</h3>

			<div class="right">
				<p class="reset"><em class="font-orange">*</em> 필수</p>
			</div>
		</div>

		<form name="mbInfoForm" id="InfoForm">
			<input type="hidden" name="userNo" value="${user.userNo }" />
			<input type="hidden" name="phoneNo" value="${user.phone }" />
			
			<div class="table-wrap mb40">
				<table class="board-form">
					<caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
					<colgroup>
						<col style="width:180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								이름 <em class="font-orange">*</em>
							</th>
								<td>
									<span class="mbNmClass">${user.userName}</span>
								</td>
						</tr>
						<tr>
							<th scope="row">
						    	생년월일 <em class="font-orange">*</em>
						    </th>
						    <td>
						      ${user.birth}  
						    </td>
						</tr>
						<tr>
							<th scope="row">
							    <label for="num">휴대폰</label> <em class="font-orange">*</em>
							</th>
								<td>
									<div class="clearfix">
										<p class="reset float-l w170px lh32 changeVal" data-name="phoneNo">
										    ${user.phone}
										</p>
									    <div class="float-l">
									        <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
									    </div>
									</div>
								
								    <div class="change-phone-num-area">
						        		<div class="position">
								            <label for="chPhone" class="label">변경할 휴대폰</label>
								            <input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11" />
								            <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
								        </div>
								
											<div class="position" style="display: none;">
												<label for="chkNum" class="label">인증번호 입력</label>
								
								            <div class="chk-num small">
								                <div class="line">
								                    <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="4">
								
								                    	<div class="time-limit" id="timeLimit">3:00</div>
												</div>
											</div>
								            	<button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
								        	</div>
									</div>
								</td>
							</tr>
							<tr>
							    <th scope="row">
							        <label for="email">이메일</label> <em class="font-orange">*</em>
							    </th>
							    <td>
							        <input type="text" id="email" name="email" class="input-text w500px" value="${user.email}" />
							    </td>
							</tr>
							<tr>
							    <th scope="row">비밀번호 <em class="font-orange">*</em></th>
							    <td>
							        <a href="/on/oh/ohh/Mypage/userPwdChangePage.do" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a>
							
							        마지막 비밀번호 변경: 1일전에 함 (2020-02-12 10:44:21)
							    </td>
							</tr>
							<tr>
							    <th scope="row">주소</th>
							    <td>
							        <span></span>
							        <a href="#" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a>
							        <p class="reset mt10"> </p>
							    </td>
							</tr>
                      </tbody>
                  </table>
              </div>
		
		
		<div class="tit-util mt40 mb10">
			<h3 class="tit">추가정보</h3>
		</div>

			<div class="table-wrap mb40">
				<table class="board-form">
					<caption>선호하는 장르, 자주가는 극장을 가진 표</caption>
					<colgroup>
						<col style="width:180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								선호장르 1
							</th>
								<td>
									<span class="mbNmClass">${user.likeGenre1}</span>
								</td>
						</tr>
						<tr>
							<th scope="row">
						    	선호장르 2
						    </th>
						    <td>
						      	<span class="mbNmClass">${user.likeGenre2}</span> 
						    </td>
						</tr>
						<tr>
							<th scope="row">
							   선호장르 3
							</th>
								<td>
									<span class="mbNmClass">${user.likeGenre3}</span> 
								</td>
							</tr>
							<tr>
							    <th scope="row">
							        자주가는 극장 1
							    </th>
							    <td>
							       <span class="mbNmClass">${user.likeTheater1}</span> 
							    </td>
							</tr>
							<tr>
							    <th scope="row">
									자주가는 극장 2
								</th>
							    <td>
							        <span class="mbNmClass">${user.likeTheater2}</span> 
							    </td>
							</tr>
							<tr>
							  <th scope="row">
									자주가는 극장 3
								</th>
							    <td>
							        <span class="mbNmClass">${user.likeTheater3}</span> 
							    </td>
							</tr>
                      </tbody>
                  </table>
              </div>
		</form>
		
		
		
          <div class="mt40" style="text-align: center; margin-bottom:20px;">
			
	              <button class="button large"  id="cancelBtn">취소</button>
	              <button class="button purple large" id="updateBtn">등록</button>
			
          </div>
          
		</div>
<!-- contents -->
	
</div>
<!-- container end-->






</body>
</html>