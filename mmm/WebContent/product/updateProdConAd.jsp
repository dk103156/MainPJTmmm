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


	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	img{
	border: 3px solid #ece1fc;
    margin-top: 10px;
	float:left;
	}
	</style>	
	
	<style>
       body {
       		background-color: #f9fad4;
            margin-top: 10px;
        }
     </style>  
   	 <style>
      hr{
        background-color:black;
        height:3px;
      }
  	 </style>
   
   

	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//============= "확인"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			self.location = "/product/getProductMainList";
		});
	});	

		</script>
		
	</head>

<body>
	
		<jsp:include page="/product/prodToolBar.jsp" />
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<!--
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	-->
	<!-- ToolBar End /////////////////////////////////////-->
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	<div class="container">
 		<h1 class="bg-light text-dark" >상 품 수 정 완 료</h1>
 		<hr>
 		<br/>
 		
 		
 		<!-- form Start /////////////////////////////////////-->
 		<form class="form-horizontal">
 		
		<div class="form-group">
			<label class=" col-sm-5 control-label">
 				<img src="/resources/image/${product.prodImage}" style= "width: 450px; height: 360px;"/>
 				<!-- ${product.prodImage} -->
			</label>
			
			<br/>
			
				<div class="col-sm-2 control-label"><strong>상품번호 </strong></div>
				<div class="col-sm-2 control-label">${product.prodNo}</div>
				
			
			<br/><br/><br/>
			
			
			
			
				<div class="col-sm-2 control-label"><strong>상품명 </strong></div>
				<div class="col-sm-2 control-label">${product.prodName}</div>
			
			
			<br/><br/><br/>
				
				
				<div class="col-sm-2 control-label"><strong>상품가격 </strong></div>
				<div class="col-sm-2 control-label">${product.prodPrice}원</div>
				
				
			
			<br/><br/><br/>
			
				
				<div class="col-sm-2 control-label"><strong>상품구성 </strong></div>
				<div class="col-sm-2 control-label">${product.prodDetail}</div>
				
			
			
			<br/><br/><br/>
			
				
				<div class="col-sm-2 control-label"><strong>프랜차이즈 </strong></div>
				<div class="col-sm-2 control-label">
					<c:if test= "${product.franType eq  0}">CGV</c:if>
					<c:if test= "${product.franType eq  1}">롯데시네마</c:if>
					<c:if test= "${product.franType eq  2}">메가박스</c:if> 
				</div>
				
		
			<br/><br/><br/>
				
		 		
		 		<div class="col-sm-2 control-label"><strong>상품종류 </strong></div>
				<div class="col-sm-2 control-label">
		 			<c:if test= "${product.prodType eq  0}">영화관람권 </c:if>
					<c:if test= "${product.prodType eq  1}">스토어이용권</c:if>
					<c:if test= "${product.prodType eq  2}">스낵</c:if> 
		 		</div>
				
			</div>
			<br/>
			
			<hr>
			
			<h2>상품 이용 안내</h2>
			
			<h4><p>영화관람권 기프트콘은 CGV모바일, 홈페이지, 오프라인 극장에서 영화를 예매할 수 있는 온라인 상품권입니다.<br>
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
				- 상기 이미지는 실제와 다를 수 있습니다.</p></h4>
				
			<br><br>
							
			<h2>환불 규정 안내</h2>
			
			<h4><p>
			- 공연 컨텐츠 전일까지 환불이 가능합니다.<br> 
			- 공연당일은 환불이 불가능합니다.<br>
			- 공연 관람시 시작 시간 이후에는 입장이 제한됩니다. <br><br>
			- 발권된 티켓은 상영시간 전까지  취소가 가능합니다.<br>
			- 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다. <br>
			- 인터넷 예매하신 내역은 상영시간 전까지는  현장에서 환불이 가능합니다.	<br>		
			- 스토어용권은 구매하신 날부터 1년까지 사용 가능합니다.<br>
			- 스토어 상품을 구매하신 후 7일 동안만 환불이 가능합니다.
			</p></h4>
				
		</div>
 			
 			<br><br>
 			
 			 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
			  <button type="button" class="btn btn-primary">확&nbsp;인</button>
			  <br><br>
		   </div>
		    </div>
			</form>
		  </div>
</body>
</html>