<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
	img{
	border: 3px solid #ece1fc;
    margin-top: 10px;
	float:left;
	}
    body {
       		background-color: #f9fad4;
            margin-top: 10px;
     }
     hr{
        background-color:black;
        height:3px;
      }
</style>
		
</head>

	<body>
	<jsp:include page="/product/prodToolBar.jsp" />
	<br>
	
	
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	<br>
 	<div class="container">
 		<div class="row">
	 		<h1 style="margin: 10px;">${product.prodName}</h1>
 		</div>
 		
 		<hr style="background-color: black; height:2px;">
 		
 		<div class="row">
 			<div id='productImage' class="col-sm-5">
					<c:forEach var = "image" items ="${fileArr}">
		 				<img class="mx-0" src="/resources/image/${image}" width=400 height=436/>
		 			</c:forEach>	
			</div>
			<div id='productInfo' class="col-sm-7 px-0">
				<div class="row mx-0">
					<div class="col-12">
						<h1 class="pl-3" style="margin: 0px;">${product.prodPrice}원</h1>
					</div>
				</div>
				<div class="row mx-0">
					<div class="col-12">
					<br>
					</div>
				</div>
				<div class="row mx-0 mb-2">
					<div class="col-3"><strong class="pl-3">상품구성 </strong></div>
					<div class="col-9"><span>${product.prodDetail}</span></div>
				</div>
				<div class="row mx-0 mb-2">
					<div class="col-3"><strong class="pl-3">프랜차이즈 </strong></div>
					<div class="col-9"><span>
					<c:if test= "${product.franType eq  0}">CGV</c:if>
					<c:if test= "${product.franType eq  1}">롯데시네마</c:if>
					<c:if test= "${product.franType eq  2}">메가박스</c:if> 
					</span></div>
				</div>	
				<div class="row mx-0 mb-2">
					<div class="col-3"><strong class="pl-3">상품종류 </strong></div>
					<div class="col-9"><span>
		 			<c:if test= "${product.prodType eq  0}">영화관람권 </c:if>
					<c:if test= "${product.prodType eq  1}">스토어이용권</c:if>
					<c:if test= "${product.prodType eq  2}">스낵</c:if> 
					</span></div>
					<br><br>
				</div>
				
				
				<div class="row mx-0 mb-6">
				<div class="col-sm-6"></div>
					<div class="col-sm-6">
					<br>
						<h5 style="text-align: center;"> 총 구매 금액 </h5>
					</div>
				<div class="col-sm-8 row">
						<div class="col-sm-3">
								<label class="control-label">
									<img src="/resources/image/buy.jpg" style="width: 120px; height:120px; margin: 0px 0px;" id="addPurchase"/>
								</label>
						</div>						
						<div class="col-sm-3">
							<label class=" col-sm-3 control-label">
	 							<img src="/resources/image/addCart.jpg" style="width: 120px; height:120px; margin: 0px 20px;" id="addCart"/>
							</label>			
						</div>	
				</div>
					<form>
						<input id='price' type='text' name='purchasePrice' value='${product.prodPrice}' readonly> 원 <br> 
						<input id='quantity' type='number' name='purchaseProductQuantity' value='1'  min='1' step="1"> 개
						<input type='hidden' name='purchaseProductNo' value="${product.prodNo}">
					</form>				
				</div><!-- end of row -->	
				
			</div><!-- end of #productInfo -->
		</div>	<!-- end of row -->
		<hr>
		
		<div id='caution'class="row mx-0">
			<div class="col-12 pageHeader">
			<br>
				<h2>상품 이용 안내</h2>
			</div>
			
			<div class="col-12 pageContent">
				<span>
					<h5><p>영화관람권 기프트콘은 CGV모바일, 홈페이지, 오프라인 극장에서 영화를 예매할 수 있는 온라인 상품권입니다.<br>
						- 구매 후 전송받으신 기프트콘은,<br>
						- 지정된 상영타입의 영화만 예매 가능합니다.(ex. 3D 관람권으로는 3D 영화만 예매 가능합니다)<br>
						- 금액권이 아니므로 차액 환급이 불가합니다. (ex.조조영화/청소년 관람 시 차액환급 불가)<br>
						- 영화 상영 후 환불 및 반품은 불가합니다.<br>
						- 관람권 기프트콘을 온라인에 등록하시는 경우,<br>
						<br><br>
						- 매점상품 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.<br>
						- 구매 후 전송받으신 기프트콘은,<br>
						- 사용가능한 CGV의 매점에서 지정된 해당 상품으로만 교환이 가능합니다.<br>
						- 해당 상품 내에서 팝콘 혹은 음료, 스낵 변경 시 추가 비용이 발생합니다.<br>
						- 교환 완료한 상품의 환불 및 반품은 불가합니다.<br>
						- 상기 이미지는 실제와 다를 수 있습니다.</p></h5>
				</span>
			</div>
			<div class="col-12 pageHeader">
				<h2>환불 규정 안내</h2>
			</div>							
			
			<div class="col-12 pageContent">
				<span>
					<h5><p>
					- 공연 컨텐츠 전일까지 환불이 가능합니다.<br> 
					- 공연당일은 환불이 불가능합니다.<br>
					- 공연 관람시 시작 시간 이후에는 입장이 제한됩니다. <br><br>
					- 발권된 티켓은 상영시간 전까지  취소가 가능합니다.<br>
					- 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다. <br>
					- 인터넷 예매하신 내역은 상영시간 전까지는  현장에서 환불이 가능합니다.	<br>		
					- 스토어용권은 구매하신 날부터 1년까지 사용 가능합니다.<br>
					- 스토어 상품을 구매하신 후 7일 동안만 환불이 가능합니다.
					</p></h5>
				</span>
			</div>	
		</div><!-- end of row -->
	
		<hr>	
		
	</div><!-- end of container --> 		

	<script language="JavaScript">
	$(function(){
		
		// 갯수 변경 시 가격 변경
		$("#quantity").on('change',function(){
			
			var price =parseInt('${product.prodPrice}')
			var quantity= parseInt( $("#quantity").val() );
			$("#price").val( price * quantity );
		});
		
		$("#addCart").on("click",function(){
			
			
		});
		
		//바로 구매하기 클릭
		$("#addPurchase").on('click',function(){
			$("form").attr("method","post").attr("action","/payment/preparePayment").submit();
		});
		
		//장바구니 추가 클릭
		$("#addCart").on("click",function(){
			
			var quantity= parseInt( $("#quantity").val() );
			var timestamp= new Date().getTime();
			var userNo = '${user.userNo}'
			var prodNo = '${product.prodNo}'
			//console.log(userNo)
			//console.log(prodNo)
			//console.log(quantity)
			//console.log(timestamp);
			var datas = JSON.stringify({
				cartUserNo : userNo,
				cartProdNo : prodNo,
				cartProdQuantity : quantity,
				cartRegDate : timestamp,
			 		 })
			 		 
			ajaxPromise("/product/json/addCart",datas).then(
				x => {
					alert("장바구니 추가 완료했습니다")
				}// end of inner function		
			);//end of then 
		});//end of click
		
	});//end of function  
	
	
	function ajaxPromise(urls,datas){
		return new Promise(function (resolve, reject){
		  $.ajax({
			  type: "POST",
			  url: urls,
			  data: datas,
			  dataType : "json",
			      headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
			      },
			      success : function(result,status){
			    	  // 데이터를 받으면 resolve() 호출
				      resolve(result);			      		
			    	  
			      }//end of success	
		
		  })//end of ajax
		})//end of Promise
	}//end of function-ajaxPromise	
	</script>		
</body>
</html>