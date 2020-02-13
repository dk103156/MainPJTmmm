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

  <!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

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

	//============= "등록"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-info" ).on("click" , function() {
			self.location = "/product/mainListProduct";
		});
	});	
	 
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".img-circle.img-responsive" ).on("click" , function() {
				var prodNo = $(this).next().val();
				console.log(prodNo);
				self.location = "/product/getProduct?prodNo="+prodNo;
			});
		});	
	
	 
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetProductList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetProductList(1);
			});
		 });
		
		
		 function CheckAll(chkBasketNo){
				
				if( document.detailForm.chkAll.checked == true ) {
					for (i = 0; i < chkBasketNo.length; i++){
						chkBasketNo[i].checked = true ;
					}
				} else {
					for (i = 0; i < chkBasketNo.length; i++){
						chkBasketNo[i].checked = false;
					}
				}
			}
		
		
		
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
	
	
 		<br/><br/><br/>
 		 	
 			
 <div class="container">
	<div class="col-lg-6 col-sm-6">
		
			<div class="col-md-6">
				<h3 style="color:#f22e42;">&nbsp;STEP 01</h3>
	    		<h2 style="color:#f22e42;">장바구니</h2>
			</div>
			<div class="col-md-6">
				<h3>&nbsp;STEP 02</h3>
	    		<h2>선물하기</h2>
			</div>
	</div>
	
	<div class="col-lg-6 col-sm-6">
			 <div class="col-md-6">
				<h3>&nbsp;STEP 03</h3>
	    		<h2>결제하기</h2>
			</div>  		
			<div class="col-md-6">
				<h3>&nbsp;STEP 04</h3>
	    		<h2>결제완료</h2>
			</div> 
	</div>
		<hr/>
 	</div>	
 	<div class="container">
 		<br/>
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
							<div class="col-md-2" style="text-align:center;">
										합계
							</div>
							<div class="col-md-3" style="text-align:center;">
							</div>
							<br><hr>
		</div>
		
		<c:set var="i" value="0" />
		<c:forEach var="cart" items="${list}">
		<c:set var="i" value="${ i }" />
		<input type="hidden" value = "${cart.cartNo}">
				 <div class="row cart" style="padding:0.5em;">	
							<div class="col-md-2" style="text-align:center;vertical-align:middle;">
										<input type="hidden" name="cartNo" value="${cart.cartNo}">
										<img src="/resources/image/${cart.product.prodImage}" width ="auto" height="92"><br/>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:middle;">
										<h4><strong>${cart.product.prodName}</strong></h4>
										<br>
										<h5>${cart.product.prodDetail}</h5>
							</div>
							<div class="col-md-3" style="text-align:center;vertical-align:middle;">
							<br>
										<h3>${cart.product.prodPrice}원</h3>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:right;">
							<br>
										<h3>${cart.quantity}개</h3>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:right;">
							<br>
										<h3> ${cart.product.prodPrice*cart.quantity}원</h3>
							</div>
					</div>
					<hr/>
		</c:forEach>
		
		
		
 	</div>
 	
</body>
</html>