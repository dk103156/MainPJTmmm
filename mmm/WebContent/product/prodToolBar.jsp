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
	
  



	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	
	$( function() {
		$("a[href='#' ]:contains('MovMovMov')").on("click" , function() {
			self.location = "/product/getProductMainList"
		});
	});
	
	
	
	$( function() {
			$("a[href='#' ]:contains('영화관람권')").on("click" , function() {
				self.location = "/product/getProductList?franType= ${product.franType}"
			});
		});
	 
	
	$( function() {
		$("a[href='#' ]:contains('스토어이용권')").on("click" , function() {
			self.location = "/product/getProductList?franType= ${product.franType}"
		});
	});
	
	
	$( function() {
		$("a[href='#' ]:contains('스낵')").on("click" , function() {
			self.location = "/product/getProductList?franType= ${product.franType}"
		});
	});
	
	
	
	$( function() {
		$("a[href='#' ]:contains('상품 등록')").on("click" , function() {
			self.location = "/product/addProduct"
		});
	}); 
	 
	
	
	$( function() {
		$("a[href='#' ]:contains('상품 수정')").on("click" , function() {
			self.location = "/product/updateProduct?prodNo=${product.prodNo}"
		});
	}); 
	
	
	$( function() {
		$("a[href='#' ]:contains('상품 삭제')").on("click" , function() {
			self.location = "/product/deleteProduct?prodNo=${product.prodNo}"
		});
	}); 
	
	
	
	$( function() {
		$("a[href='#' ]:contains('장바구니')").on("click" , function() {
			self.location = "/cart/getCartList"
		});
	}); 
	
	

		   	
		</script>
		
	</head>

<body>
	
	
			<!-- ToolBar Start /////////////////////////////////////-->
			
			<div class="navbar  navbar-inverse">
				
		        <div class="container">
		        
		        	<a class="navbar-brand" href="#">MovMovMov</a>
					
					<!-- toolBar Button Start //////////////////////// -->
					<div class="navbar-header">
					   <div class="collapse navbar-collapse"  id="target">
			             <ul class="nav navbar-nav navbar-right">
			                 <li><a href="/product/getVoucherList">MOV바우처</a></li>
			                 <li><a href="/product/getSnackProductList">스낵</a></li>
			                   <li><a href="/product/getQuickOrder">QuickOrder</a></li>
			           	</ul>
			       </div>
					</div>
					
					<!-- toolBar Button End //////////////////////// -->
					
					<div class="collapse navbar-collapse"  id="target">
			             <ul class="nav navbar-nav navbar-right">
			                 <li><a href="#">상품 등록</a></li>
			                 <li><a href="#">상품 수정</a></li>
			                 <li><a href="#">상품 삭제</a></li>
			                 <li><a href="#">장바구니</a></li>
			           	</ul>
			       </div>
		   		
		   		</div>
		   	</div>
		   	<!-- ToolBar End /////////////////////////////////////-->
			
	
	
	
 	
</body>
</html>