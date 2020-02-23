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
  
	
<style>
    body {
        margin-top: 10px;
    }
    hr{
	    border: 0;
       background-color:#fee50e;
     }
	#productList{
	margin-top: 10px;
	float:left;
	margin: 10px 38px;
	}
	#img{
	width: 250px;
	height: 250px;
	}
	#prodName{
	margin: 0px 35px;
	}
	#prodPrice{
	margin: 0px 30px;
	}
</style>
  

	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

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
 		 	
 			
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	
 	
 	<div class="container" id = "container">
 		<br/><br/><br/>
 		 	 <div class="row mx-0">
	    
			<div class="col-6">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
	    		
	    		<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    </div>
 		<!-- table 위쪽 검색 Start /////////////////////////////////////-->	
 			
 			
 		<hr>
		<br/>
		
	<div class="productListContent row">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i }" />
      				<div class="thumb-wrapper" id="productList">
      					<div class="img-box text-center">
 						<img src="/resources/image/${product.prodImage}" id="img"class="img-circle img-responsive">
				       	<input type="hidden" value = "${product.prodNo}">
				       </div>
				       	<div class="prodName col-12" id="prodName"><h4><span>${product.prodName}</span></h4>
				       	<div class="prodPrice col-10" id="prodPrice"><h4>${product.prodPrice}원</h4>
				       	</div>	
      				</div>
      				</div>
    		
    	
          </c:forEach>
        </div>	 
	</div>	
</body>
</html>