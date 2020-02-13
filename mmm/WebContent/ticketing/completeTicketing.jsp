<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  	
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="row mt-3 mb-5">
		<div class="col-12 text-center">
			<span><h2>예매가 완료 되었습니다.</h2></span>
		</div>
	</div><!-- end of row -->
	
	<div class="row">
		<div class="col-4 text-center my-auto">
			<img src="${movie.poster}" width="200" height="280" />
		</div>
		<div class="col-1"></div>
		<div class="col-7">		
			<div class="row mb-4">
				<div class="col-3">예매 PIN NO</div>
				<div class="col-9">${ticketing.ticketingPinNo }</div>
			</div>
			<div class="row mb-4">
				<div class="col-3">영화제목</div>
				<div class="col-9">${ticketing.movieName}</div>
			</div>
			<div class="row mb-4">
				<div class="col-3">극장</div>
				<div class="col-9">${ticketing.theaterName }</div>
			</div>
			<div class="row mb-4">
				<div class="col-3">예매일시</div>
				<div class="col-9">${ticketing.ticketingDate }</div>
			</div>	
			<div class="row mb-4">
				<div class="col-3">인원수</div>
				<div class="col-9">${ticketing.headCount } 명</div>
			</div>
			<div class="row mb-4">
				<div class="col-3">좌석번호</div>
				<div class="col-9">${ticketing.seatNo }</div>
			</div>
			<div class="row mb-4">
				<div class="col-3">결제금액</div>
				<div class="col-9">${payment.totalPrice}원</div>
			</div>
			<div class="row mb-4">
				<div class="col-3">결제수단</div>
				<div class="col-9">
				<c:choose>
					<c:when test="${payment.payMethod==0}">
						<div class="col">현금 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==1}">
						<div class="col">포인트 ${payment.usingPoint}p</div>
					</c:when>
					<c:when test="${payment.payMethod==2}">
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==3}">
						<div class="col">현금 ${payment.cash}원</div>
						<div class="col">포인트 ${payment.usingPoint}p</div>
					</c:when>
					<c:when test="${payment.payMethod==4}">
						<div class="col">현금 ${payment.cash}원</div>
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==5}">
						<div class="col">포인트 ${payment.usingPoint}p</div>
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==6}">
						<div class="col">현금 ${payment.cash}원</div>
						<div class="col">포인트 ${payment.usingPoint}p</div>
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
				</c:choose>
				</div>
			</div>			
			
			<c:if test="${payment.payMethod==0 || payment.payMethod==3 || payment.payMethod==4 || payment.payMethod==6}">
				<div class="row ">
					<div class="col-3">적립포인트</div>
					<div class="col-9">${payment.savingPoint}원</div>
				</div>
			</c:if>
		</div>
	</div><!-- end of row -->
	
	<div class="row mt-5">
		<div class="col-3"></div>
		<div class="col-2">
			<button type="button" class="btn btn-primary">예매정보 출력</button>
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-secondary">결과 SMS 발송</button>
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-dark confirm">예매 확인/취소</button>
		</div>
		<div class="col-3"></div>
	</div>

</div><!-- end of container -->

<script>
$("button.confirm").on("click",function(){
	self.location="/ticketing/getTicketingList";
});

</script>
</body>
</html>