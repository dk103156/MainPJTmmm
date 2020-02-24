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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
	
	<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>

	<!--     Common Css -->
    <link rel="stylesheet" href="/resources/css/product.css">
	


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//============= "수정"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn" ).on("click" , function() {
			Swal.fire({
				  icon: 'success',
				  title: '상품수정이 완료 되었습니다.',
				  timer: 3000
				}).then(function () {
					fncUpdateProduct();	
					})			
			
		});
	});	
	
	//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/product/getSnackProductList"
				
				//$("form")[0].reset();
			});
		});	

	
		function fncUpdateProduct(){
	
		$("form").attr("method" , "POST").attr("action" , "/product/updateProduct?prodNo=${product.prodNo}").submit();
		}
	
		</script>
		
	</head>

<body id="body">
	
	<jsp:include page="/product/prodToolBar.jsp"/>
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	<div class="container" id="updateProdDiv">
 	<br/><br/>
 		<h1 class=" text-center" >상 품  수 정</h1>
 		<br>
 		
 		<!-- form Start /////////////////////////////////////-->
 		<form class="form-horizontal">
 		
		<div class="form-group" id="updateProdDivGroup">
			<label class=" col-7 control-label">
 				<img src="/resources/image/${product.prodImage}" style= "width: 400px; height: 360px;" />
 					<input type="file" class="rounded" id="updateProdImage"  name="prodImage">
			</label>
			
			<br/><br/>
				
			<label for="prodNo" class=" col-6 control-label">상품번호</label>	
				<div class="col-7">
					 <input type="text" class="form-control" id="updateProdInput"  name="prodNo" value="${product.prodNo}" placeholder="수정불가"  readonly>
					 	<span id="helpBlock" class="help-block">
		      				<strong class="text-danger">${product.prodNo}</strong>
		      			</span>
				</div>
			
			<br/><br/><br/>
				
				
			  <label for="prodName" class=" col-7 control-label">상품명</label>	
				<div class="col-7">
					<input type="text" class="form-control" id="updateProdInput"   name="prodName" value="${product.prodName}" placeholder="상품명 변경">
				</div>
			
			<br/><br/><br/>
				
				
			<label for="prodPrice" class="col-7 control-label">상품가격</label>
				<div class="col-7">
					<input type="text" class="form-control" id="updateProdInput"  name="prodPrice" value="${product.prodPrice}" placeholder="상품가격 변경">
				</div>
				
			
			<br/><br/><br/>
			
				
			<label for="prodDetail" class="col-7 control-label">상품구성</label>
 				<div class="col-7">
 					 <input type="text" class="form-control" id="updateProdInput" name="prodDetail"  value="${product.prodDetail}" placeholder="상품구성 변경">
				</div>
			
			
			<br/><br/><br/>
			
				
			<label for="franType" class="col-7 control-label">프랜차이즈    </label>
			<div class="col-7">
				<select class=" form-control" name="franType"  id="updateProdInput">
					  <option selected>프랜차이즈</option>
					  <option value="0">CGV</option>
					  <option value="1">롯데시네마</option>
					  <option value="2">메가박스</option>
				</select>
			</div>
				
				<br/><br/><br/>
				
		 
			<label for="prodType" class="col-7 control-label">상품종류</label>
			<div class="col-7">
				<select class=" form-control" name="prodType" id="updateProdInput">
					  <option selected>상품종류</option>
					  <option value="0">영화관람권</option>
					  <option value="1">스토어이용권</option>
					  <option value="2">스낵</option>
				</select>
		 		</div>
				
			<br/>
		
 			</div>
 			<br><br>
 			
 			 <div class="form" id="updateProdForm">
		   		<div class="col-11 text-center">
				      <button  type="button"  id="updateProdBtn" class="btn"  >등&nbsp;록</button>
						  <a class="btn"  id="updateProdBtn"   href="#" role="button">취&nbsp;소</a>
								<br><br>		   
				 </div>
		   </div> 
		</form>
		<br/>
	</div>
</body>
</html>