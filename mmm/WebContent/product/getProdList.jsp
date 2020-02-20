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

	//============= "등록"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-info" ).on("click" , function() {
			self.location = "/product/mainListProduct";
		});
	});	
	 
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".img.img-responsive" ).on("click" , function() {
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
 	
 	
 	<div class="container" id = "container">
 		<br/><br/><br/>
 		 	 <div class="row">
	    
		    <div class="col-md-6 text-left">
		    </div>
		
			
			<div class="col-md-6 text-right">
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
 			
 			
 		<hr/>
		<br/>
		
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i }" />
			<div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
 						<img src="/resources/image/${product.prodImage}" class="img img-responsive" width="400" height="400">
				       	<input type="hidden" value = "${product.prodNo}">
				       </div>
				        	<h3>${product.prodName}</h3>
				          	<h4>${product.prodDetail}</h4>
				        <hr/>
      				</div>
    		</div>
          </c:forEach>
	</div>	
</body>
</html>