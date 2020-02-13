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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>마이페이지</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	background-color: #f9fad4;
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 150px;
	left: 0;
}
#contaniner{
	width: 800px;
	display: inline-block;
	vertical-align: middle;
}
.col{
	border: 1px solid #ced4da;
	border-radius: .25rem;
}
.col-left{
	text-align: left;
}

#contaniner > div > div.col-md-8 > div.top > span{
 font-size: 25px;
}



</style> 

</head>
<body>


<!--container-->
	<div id="contaniner">
	
		<div class="row">
			<div class="col-md-4 ">
				<div class="col"  id="v-pills-tab" style="background-color: #93aec9; " role="tablist" aria-orientation="vertical">
					
						<p><a class="nav-link" href="/user/login.jsp" title="Mypage Home">Mypage Home</a></p>
				
							<a class="nav-link" href="/user/login.jsp" title="예매/구매내역">예매/구매내역</a>
							<a class="nav-link" href="#" title="쿠폰/보관함/선물함">쿠폰/보관함/선물함</a>
							<a class="nav-link" href="/mypage/movie-coupon" title="구매/구매취소내역">구매/구매취소내역</a>
							<a class="nav-link" href="/mypage/store-coupon" title="스토어 교환권">포인트 내역</a>
							<a class="nav-link" href="/mypage/discount-coupon" title="한줄평/내 리뷰 조회">한줄평/내 리뷰 조회</a>
							<a class="nav-link" href="/mypage/point-list" title="내 응모 내역">내 응모 내역</a>
							<a class="nav-link" href="/mypage/point-list" title="내 문의 내역">내 문의 내역</a>
				</div>
			 </div>
			 <br>
			 <div class="col-md-8" >
			 	<div class="top">
			 		<img src="/resources/image/profile.PNG" width="150" height="150" style=" padding-bottom: 10px; padding-top: 20px;">
			 		<span style="margin-left:10px;">oooo님  &nbsp; VIP등급입니다.</span><br>
			 		<button class="btn btn-primary btn-sm">내 정보 조회/수정</button>
			 	</div>
			 	<div class="bottom">
			 		<span><a></a></span>
			 	</div>
			 	
			 </div>
		</div>
			
</div>
<!--container end-->






</body>
</html>