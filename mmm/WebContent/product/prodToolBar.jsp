<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 	jQuery...  -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    <!-- Bootstrap CSS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	
	
	<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	
<style>
	header {
    background-color: #242424;
    height: 3.0rem;
    font-family: 'Noto Sans KR', sans-serif;
	}
</style>

<script type="text/javascript">

	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( function() {
		$( "#mov" ).on("click" , function() {
			self.location = "/product/getVoucherList";
		});
	});
	
	
	
	$( function() {
		$( "#voucher" ).on("click" , function() {
			self.location = "/product/getVoucherList";
			});
		});
	 
	
	$( function() {
		$( "#snack" ).on("click" , function() {
			self.location = "/product/getSnackProductList"
		});
	});
	
	
	
	
	<!--  /////////////////////////////////////////////////// -->
	
	$( function() {
		$( "#addProduct" ).on("click" , function() {
			self.location = "/product/addProduct"
		});
	});
	
	
	
	
	$( function() {
		$( "#updateProduct" ).on("click" , function() {
			self.location = "/product/updateProduct?prodNo=${product.prodNo}"
		});
	}); 
	
	
	$( function() {
		$( "#deleteProduct" ).on("click" , function() {
			self.location = "/product/deleteProduct?prodNo=${product.prodNo}"
		});
	}); 
	
	
	
		   	
		</script>
		
	</head>

<body>
	
	<header>
		<div class="row mx-0" >
				<div class="col-2">
					<h3 id="mov" style="color: #ffffff;  margin: 10px 5px; ">스토어</h3>
				</div>
				
				<div class="col-1" style="text-align:left;">
					<h6 id="voucher" style="color: #ffffff;margin: 15px 0px;"><strong>바우처</strong></h6>
				</div>
				
				<div class="col-1" style="text-align:left;">
					<h6 id="snack" style="color: #ffffff; margin: 15px 0px;"><strong>스낵</strong></h6>
				</div>
				
				
				
				
			<!--<c:if test="${sessionScope.user.role == 'user'}">
			
				<div class="col-4" style="text-align:center;">
				</div>
				
				
				<div class="col-1" style="text-align:center;">
					<h6 id="addProduct"  style="color: #ffffff; margin: 15px 0px;"><strong>등록</strong></h6>
				</div>
				
				<div class="col-1" style="text-align:center;">
					<h6 id="updateProduct"  style="color: #ffffff; margin: 15px 0px;"><strong>수정</strong></h6>
				</div>
				
				<div class="col-1" style="text-align:center;">
					<h6 id="deleteProduct"  style="color: #ffffff; margin: 15px 0px;"><strong>삭제</strong></h6>
				</div>
				
			</c:if>	
				
			-->	
			
				<div class="col-4" style="text-align:center;">
				</div>
				
				
				<div class="col-1" style="text-align:center;">
					<h6 id="addProduct"  style="color: #ffffff; margin: 15px 0px;"><strong>등록</strong></h6>
				</div>
				
				<div class="col-1" style="text-align:center;">
					<h6 id="updateProduct"  style="color: #ffffff; margin: 15px 0px;"><strong>수정</strong></h6>
				</div>
				
				<div class="col-1" style="text-align:center;">
					<h6 id="deleteProduct"  style="color: #ffffff; margin: 15px 0px;"><strong>삭제</strong></h6>
				</div>
			
		</div>	
	</header>
</body>
</html>