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

	

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
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
	
	
	$( function() {
		$( "#QuickOrder" ).on("click" , function() {
			self.location = "/product/getQuickOrder"
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
	
	
	
	$( function() {
		$( "#cart" ).on("click" , function() {
			self.location = "/cart/getCartList"
		});
	}); 
	
		   	
		</script>
		
	</head>

<body>
	
			
	<hr style="background-color: #ebeadd;">
		<div class="row" style="text-align:center;">
				<div class="col-md-2" style="text-align:center;">
					<h4 id="mov">MovMovMov</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="voucher">바우처</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="snack">스낵</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="QuickOrder">QuickOrder</h4>
				</div>
				
				
				
			<!--<c:if test="${sessionScope.user.role == 'user'}">
			
				<div class="col-md-3" style="text-align:center;">
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="addProduct">상품 등록</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="updateProduct">상품 수정</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="deleteProduct">상품 삭제</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="cart">장바구니</h4>
				</div>
				
			</c:if>	
				
				<div class="col-md-5" style="text-align:center;">
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="cart">장바구니</h4>
				</div>
				
			-->	
			
				<div class="col-md-3" style="text-align:center;">
				</div>
				
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
					 상품 등록
				</button>
				<!-- 
				<div class="col-md-1" style="text-align:center;">
					<h4 id="addProduct">상품 등록</h4>
				</div>
				 -->
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="updateProduct">상품 수정</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="deleteProduct">상품 삭제</h4>
				</div>
				
				<div class="col-md-1" style="text-align:center;">
					<h4 id="cart">장바구니</h4>
				</div>
			
		</div>	
	<hr style="background-color: #ebeadd;">
	
	
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">상품 등록</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
				...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	
</body>
</html>