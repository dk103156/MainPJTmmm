<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	
	<!--  ///////////////////////// CSS ////////////////////////// 
	<style>
	img{
	border: 3px solid #ece1fc;
    margin-top: 10px;
	float:left;
	}
	</style>	
	-->
	
	
	
	
	
	<style>
       body {
       		background-color: #f9fad4;
            margin-top: 10px;
        }
     </style>  
     
   	 <style>
      hr{
        background-color:black;
        height:2px;
      }
  	 </style>
  

	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".addPurchase" ).on("click" , function() {
				var quantity = $(this).next().next().val();
				var prodNo = $(this).next().val();
				self.location = "/purchase/addPurchase?prodNo="+prodNo+"&quantity="+quantity;
			});
		});																																					
		
	 
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".addGift" ).on("click" , function() {
				var quantity = $(this).prev().val();
				var prodNo = $(this).prev().prev().val();
				self.location = "/purchase/addGiftPurchase?prodNo="+prodNo+"&quantity="+quantity;
			});
		});	 
	 
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".deleteCart" ).on("click" , function() {
				var cartNo = $("#cartNo").val();
				self.location = "/cart/deleteCart?cartNo="+cartNo;
			});
		});	
	 
		
		
		 $(document).ready(function() {

				$(window).scroll(function () {

					// 현재 위치의 높이

					//var curHeight = $(window).height() + $(window).scrollTop();

					var curHeight = $(window).scrollTop();

					// 문서의 높이

					var docHeight = $(document).height();



					// 어느 정도 조건이 만족하면 내용 생성

					if (curHeight > docHeight - 800) {

						$('<div class="thumb-wrapper">').appendTo('body');

					}

				});

			});

		
		</script>
		
	</head>

<body>
	
		<jsp:include page="/product/prodToolBar.jsp" />
	
	
 		<br/><br/>
 		 	
 			
 <div class="container">
		
			<div class="col-sm-6">
				<h2>구매 내역</h2>
			</div>
	
 </div>	
 	<div class="container">
 		<hr style="background-color:black; height:4px;">
 		
 		<div class="row" style="text-align:center;">
							
							<div class="col-md-3" style="text-align:center;">
										상품명
							</div>
							<div class="col-md-3" style="text-align:right;">
										상품가격
							</div>
							<div class="col-md-1" style="text-align:right;">
							</div>
							<div class="col-md-2" style="text-align:center;">
										수 량
							</div>
							<div class="col-md-3" style="text-align:center;">
										총 구매 가격
							</div>
							
							<br><hr>
		</div>
		
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i}" />
		<input type="hidden"  name="purchaseNo"  id="purchaseNo" value = "${purchase.purchaseNo}">
		${cart.product.prodNo}  
				 <div class="row cart" style="padding:0.5em;">	
							<div class="col-md-2" style="text-align:center;vertical-align:middle;">
										<input type="hidden" name="purchaseNo" value="${purchase.purchaseNo}">
										<img src="/resources/image/${purchaseProd.prodImage}" width ="auto" height="92"><br/>
							</div>
							<div class="col-md-3" style="text-align:center;vertical-align:middle;">
									
										<h4><strong>${purchaseProd.prodName}</strong></h4>
										<br>
										<h5>${purchaseProd.prodDetail}</h5>
							</div>
							<div class="col-md-3" style="text-align:center;vertical-align:middle;">
							<br>
										<h3>${purchaseProd.prodPrice}원</h3>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:right;">
							<br>
										<h3>${purchase.purchaseQuantity}개</h3>
							</div>
							<div class="col-md-3" style="text-align:center;vertical-align:right;">
							<br>
									<h3>${purchase.purchasePrice}원</h3>
							</div>
							
							
					</div>
					<hr/>
		</c:forEach>
		
		
		
 	</div>
 	
</body>
</html>