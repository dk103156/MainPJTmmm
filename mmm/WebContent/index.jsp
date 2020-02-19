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
<title>Insert title here</title>
<style>
	#shoppingCart{
		width : 50px;
		position:fixed;
		right:10px;
		bottom:0px;
		z-index:1000;
		cursor : pointer;
	}
	
	div.test{
		position:fixed;
		right:-200px;
		bottom:125px;
		z-index:1000;
		transition-property: right;
		transition-duration: 1s;
		width : 200px;
		height : 550px;
		border : 4px dashed #bcbcbc;
		overflow : auto;
	}

	
</style>
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
		alert("요청하신 페이지에 권한이 없습니다.");
	}
	
});


</script>



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
	<li> <a href="purchase/getInventoryList">내 인벤토리 목록</a></li>
	<li> <a href="product/getCartList">장바구니 목록 UI</a></li>
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
<ul>
  <h3>7.customer</h3>	
	<li> <a href="customer/getContactList">일대일문의 목록조회</a></li>
</ul>

<div class="test" >

</div>

<img id="shoppingCart" src="../resources/image/productIcon/shoppingcart_80945.png">	

<script>
	$(function(){
		
		myCartList();
		//페이지네이션으로 1페이지 설정했기때문에 8개까지만 나옵니다
		function myCartList(){
		 $.ajax({
			  type: "POST",
			  url: "/product/json/getCartList",
			  data: JSON.stringify({ cartUserNo : '${user.userNo}'}),
			  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		 }).done(
			data => {
				
				$("div.test").empty()
				data.list.forEach( (data,index) => {
					$.getJSON("/product/json/getProduct/"+data.cartProdNo)
					.done( x =>{
							var Image =x.product.prodImage
							
							var Element ="<div class='product'><span><img class='prodImage' src='../resources/image/"+Image+"' width=155><img class='removeCart'src='../resources/image/productIcon/close-button.jpg' width=20><span>";
								Element+="<input class='cartNo' type='hidden' value='"+data.cartNo+"'</div>"
							$("div.test").append(Element);
							
							$("div.product img.prodImage").last().on("click",function(){
								
								self.location ="/product/getProduct?prodNo="+x.product.prodNo
							});
							var cartNo = $.trim($("input.cartNo").last().val());
							$("img.removeCart").last().on("click",function(){
								
								$.get("/product/json/removeCart/"+cartNo)
								.done( () =>{
									 console.log("성공")
									 myCartList();
								})//end of $.get
							});//end of img.removeCart click
					})//end of $.getJSON
				}) //end of forEach
			}) //end of ajax Done
		}//end of function
	});// end of function
	
	$("#shoppingCart").on("click", function(){
		if($("div.test").css("right")=="-200px"){
			$("div.test").css("right","0px");
			$("#shoppingCart").css("opacity","0.5")
		}else{
			$("div.test").css("right","-200px");
			$("#shoppingCart").css("opacity","1");
		}
	});
	
	
    //시간 포맷
    function formatTime(time) {
     var d = new Date(time);
     var month = d.getMonth()+1; //월
     var date = d.getDate(); // 날짜
     
     var result =	zeroFormat(month)+"."+zeroFormat(date)
     return result;
  }
    
    //1일,2일을 0을 붙여 출력
    function zeroFormat(x){
       if(x<10){
          x = "0"+x;
       }
       
       return String(x);
    }    
    
</script>
</body>
</html>