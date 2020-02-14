<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>MovMovMov</h1>
<h1>${user.userId}/${user.userNo }</h1>
<ul>
  <h3>1.Users</h3>	
	<li> <a href="user/login">로그인 UI</a></li>
	<li> <a href="mypage/mypage.jsp">마이페이지 UI</a></li>
</ul>
<ul>
 <h3>2.Product</h3>	
	<li> <a href="product/getVoucherList">상품 목록 UI</a></li>
</ul>

<ul>
  <h3>3.Movie</h3>	
	<li> <a href="movie/getBoxOfficeList">박스오피스조회 UI</a></li>
	<li> <a href="movie/getExpectedMovieList">상영예정작조회 UI</a></li>
</ul>
<ul>
  <h3>4.Ticketing</h3>	
	<li> <a href="ticketing/addTicketing">영화 일반예매 UI</a></li>
	<li> <a href="ticketing/addCompareTicketing">영화 극장별 비교예매 UI</a></li>
	<li> <a href="ticketing/getTicketingList">영화예매내역</a></li>
</ul>
<ul>
  <h3>5.payment</h3>	
	<li> <a href="payment/preparePayment"><strike>결제하기 Test</strike></a> 따로 Test 안해요. 일반결제에서 넘어갑니다.</li>
</ul>
<ul>
  <h3>6.event</h3>	
	<li> <a href="event/getPreviewList">이벤트 목록조회</a></li>
	<li> <a href="event/getQuizList">퀴즈 풀기</a></li>
	<li> <a href="customer/addNoticeAd">올라가?</a></li>
</ul>

<h3>7.purchase</h3>	
	<li> <a href="purchase/getPurchaseList">구매내역 (관리자)</a></li>
</ul>

	
</body>
</html>