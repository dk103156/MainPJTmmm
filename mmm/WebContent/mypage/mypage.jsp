<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>마이페이지</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	background-color: white;
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 150px;
	left: 0;
	font-family: 'Noto Sans KR', sans-serif;
}
#contaniner{
	width: 800px;
	display: inline-block;
	vertical-align: middle;
	font-family: 'Noto Sans KR', sans-serif;
}
.lnb-area location-fixed{
    padding-top: 82px;
}

.lnb-area {
    float: left;
    width: 200px;
    background-color: #fff;
}

#lnb {
    margin: 0;
    padding: 0;
}
#contaniner > div > div.col-md-8 > div.top > span{
 font-size: 25px;
}

#lnb .tit {
    overflow: hidden;
    margin: 0;
    padding: 0;
    border-radius: 10px 10px 0 0;
    background-color: #333;
}

* {
    box-sizing: border-box;
}


#lnb .tit a {
    display: block;
    width: 100%;
    font-size: 1.2em;
    line-height: 90px;
    text-align: center;
    color: #fff;
    text-decoration: none;
}


#lnb>a{
    display: block;
    color: #222;
    padding: 10px 15px;
    font-weight: 400;
    background-color: #fee50e;
}

#lnb a {
    display: block;
    text-decoration: none;
    line-height: 1.3;
}

#lnb .depth3 {
    padding: 20px 0;
}


#lnb .depth3 {
    padding: 20px 0;
	border-radius: 0 0 10px 10px;

.inner-wrap {
	width: 1100px;
	margin: 0 auto;
}

.my-magabox-info {
    overflow: hidden;
    height: 367px;
    border-radius: 10px;
    background-color: #fee50e;
}

.my-magabox-info .top .photo {
    float: left;
    width: 200px;
    padding: 20px 0 0 60px;
}

.my-magabox-info .top .grade {
    float: left;
    padding-top: 20px;
}

.my-magabox-info .bottom {
    overflow: hidden;
    height: calc(100% - 198px);
    padding: 26px 30px 29px 30px;
    background-color: #eaebed;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
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
	
	if(status=="pwChkOk"){
		alert("눌리나");
		
	}
	

	$("a[href='#']:contains('회원정보수정')").on('click',function(){
		//var userNo = $('#userNo').val();
		//console.log(userNo);	
		//$("#plusPage").load("/user/getUser");
		$("#plusPage").load("/user/passwordCheck");
	})
	
	$("a[href='#']:contains('예매/예매 취소 내역')").on('click',function(){	
		$("#plusPage").load("/ticketing/getTicketingList");
	})
	
	$("a[href='#']:contains('내가 본 영화')").on('click',function(){	
		$("#plusPage").load("/mypage/mySeenMovieList");
	})
	
	
	
	$("#MypageHome").on('click',function(){	
		$("#plusPage").load("/mypage/mypageUser");
	})
	
	$("#MypageHome").trigger("click");
	
});
</script>
</head>
<body>
<h1>${user.userId}/${user.userNo }</h1>
<!-- container  -->
<div class= "container">
	<div class="row">
		<!-- left side bar -->
		<div class="col-md-3" style="padding-left: 50px;">
			<div class="inner-wrap">
				<div class="lnb-area">
					<nav id="lnb">
						<p class="tit"><a href="#" id ="MypageHome" title="Mypage">Mypage Home</a></p>
						<input type="hidden" id="userNo" name="userNo" value="${user.userNo}"> 
			

							<a href="#" title="예매/예매취소내역">예매/예매 취소 내역</a>
							<a href="#"	title="구매내역">구매 내역</a>
							<a href="#"	title="구매취소내역">구매 취소 내역</a>
			                <a href="#" title="보관함">보관함</a>
							<a href="#" title="포인트 내역">포인트 내역</a>
							<a href="#" title="내가 본 영화">내가 본 영화</a>
							<a href="#" title="한줄평/내 리뷰 조회">한줄평/내 리뷰 조회</a>
							<a href="#"	title="나의 이벤트 응모내역">나의 이벤트 응모내역</a>
							<a href="#"	title="나의 문의내역">나의 문의내역</a>
							<a href="#" title="회원정보수정">회원정보수정</a>
							
						
					</nav>
				</div>	
			</div>
		</div>
		<!-- left side bar end -->
		
		<!-- contents Start -->
		<div class="col-md-9" style=" height: 200px;" id="plusPage">	
		<!--다른 페이지 로딩 되는 부분  -->

		</div>	
		<!-- contents end -->
		
	</div>
</div>
<!-- container  end-->


</body>
</html>