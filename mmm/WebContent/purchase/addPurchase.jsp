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
		$( "#addPurchase" ).on("click" , function() {
			fncAddPurchase();
		
		});
		
		function fncAddPurchase(){
			 var prodNo = $("#prodNo").val();
			 console.log(prodNo);
			var purchaseQuantity = $("#purchaseQuantity").val();
			 console.log(purchaseQuantity);
			
			$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();		
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

		 
			
		
		 
	 });		 
		</script>
		
	</head>

<body>
	
		<jsp:include page="/product/prodToolBar.jsp" />
	
	
 		<br/><br/><br/>
 <form action="/purchase/addPurchase" method="post">
 			
 <div class="container">
	<div class="col-lg-6 col-sm-6">
		
			<div class="col-md-6">
				<h3>&nbsp;STEP 01</h3>
	    		<h2>장바구니</h2>
			</div>
			<div class="col-md-6">
				<h3>&nbsp;STEP 02</h3>
	    		<h2>선물하기</h2>
			</div>
	</div>
	
	<div class="col-lg-6 col-sm-6">
			 <div class="col-md-6">
				<h3 style="color:#f22e42;">&nbsp;STEP 03</h3>
	    		<h2 style="color:#f22e42;">결제하기</h2>
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
 		<hr style="background-color:black; height:3px;">
 		
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
		
		
		<input type="hidden" value = "${purchase.purchaseProd.prodNo}">
				 <div class="row cart" style="padding:0.5em;">	
							
							<div class="col-md-2" style="text-align:center;vertical-align:middle;">
										<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}">
										<img src="/resources/image/${purchase.purchaseProd.prodImage}" width ="auto" height="92"><br/>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:middle;">
										<h4><strong>${purchase.purchaseProd.prodName}</strong></h4>
										<br>
										<h5>${purchase.purchaseProd.prodDetail}</h5>
							</div>
							<div class="col-md-3" style="text-align:center;vertical-align:middle;">
							<br>
										<h3>${purchase.purchaseProd.prodPrice}원</h3>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:right;">
							<br>
										<input type="hidden" name="purchaseQuantity" value="${purchase.purchaseQuantity}">
										<h3>${purchase.purchaseQuantity}개</h3>
							</div>
							<div class="col-md-2" style="text-align:center;vertical-align:right;">
							<br>		
										<input type="hidden" name="purchasePrice" value="${purchase.purchaseProd.prodPrice*purchase.purchaseQuantity}">
										<h3> ${purchase.purchaseProd.prodPrice*purchase.purchaseQuantity}원</h3>
							</div>
					</div>
					<br>
					<hr style="background-color:black; height:1px;">
					<br><br><hr/>
					
							<div class="col-md-3" style="text-align:center;">
							<h4><strong>총 상품 금액</strong></h4>
							</div>
							<div class="col-md-3" style="text-align:right;">
									<h4><strong>할인 금액</strong></h4>
							</div>
							
							<div class="col-md-2" style="text-align:center;">
									
							</div>
							<div class="col-md-3" style="text-align:center;">
									<h4><strong>총 결제 예정 금액</strong></h4>
							</div>
							<div class="col-md-3" style="text-align:center;">
							</div>
							<br><hr>
							
							<div class="col-sm-3" style="text-align:center;vertical-align:right;">
							<br>
										<h2> ${purchase.purchaseProd.prodPrice*purchase.purchaseQuantity}원</h2>
							</div>
							<div class="col-md-1" style="text-align:center;vertical-align:right;">
							<br>
								<img src="/resources/image/minus.png" width ="auto" height="50">
							</div>
							<div class="col-sm-3" style="text-align:center;vertical-align:right;">
							<br>
										<h2> 0원</h2>
							</div>
							<div class="col-md-1" style="text-align:center;vertical-align:right;">
							<br>
								<img src="/resources/image/nen.png" width ="auto" height="50">
							</div>
							<div class="col-sm-3" style="text-align:center;vertical-align:right;">
							<br>
										<h2> ${purchase.purchaseProd.prodPrice*purchase.purchaseQuantity}원</h2>
							</div>
 	</div>
 	
 	<div class="container">
 		<hr><br/><br/><br/><br/>
 		<h3>주문자 정보 확인</h3>
 		<hr style="background-color:black; height:3px;">
 		
 		<div class="col-md-2 control-label"><h4>이름 <h4></div>
 		<input type="hidden" name="rcName" value="${user.userName}">
		<div class="col-md-2 control-label"><h4>${user.userName}<h4></div>
				
		<div class="col-md-2 control-label"><h4>휴대전화번호 <h4></div>
		<input type="hidden" name="rcPhone" value="${user.phone}">
		<div class="col-md-2 control-label"><h4>${user.phone}<h4></div>
		<br><br><hr style="background-color:black; height:1px;">
		<h6>*구매하신 기프트콘은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.</h6>
		<h6>입력된 휴대전화 번호가 맞는지 꼭 확인하세요.</h6>
		<br><hr><br><br><br>
 	</div>
 	
 	<div class="container">
            <p class="com_list_style1_title">
                <input type="checkbox" id="check00" class="com_custom_checkbox com_all_checker"><label for="check00">주문정보/결제 대행 서비스 약관 모두 동의</label></p>
            <dl class="com_custom_checkbox1" style="display: block;">
                <dt>
                    <input type="checkbox" id="check10" class="com_custom_checkbox com_all_particle_checker" data-required="true"><label for="check10">기프트콘 구매 동의</label></dt>
                <dd>
                    <p class="txtBox">
                        기프트콘 발송 및 CS처리 등을 이해 수신자로부터 비트캠프에 수신자의 휴대전화번호를 제공하는 것에 대한 적합한 동의를 받습니다.</p>
                </dd>
            </dl>
            
            <br><hr style="background-color:black; height:1px;"><br><br>
           
    </div>
    
   <div class="container">
   		<div class="col-md-3 col-sm-6">
   		</div>
   		<div class="col-md-1" style="text-align:right;">
		</div>
   	<img src="/resources/image/addPurchase.PNG" width ="auto" height="70" name="addPurchase" id="addPurchase">
   </div>
  </form> 
</body>
</html>