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
            margin-top: 10px;
        }
     </style>  
   	 <style>
      hr{
        background-color:black;
        height:3px;
      }
      div.group{
      	margin-left: 300px;
      	
      }
      #div{
      margin-top: 25px;
      margin-bottom: 55px;
      border: 3px solid #fee50e;
      border-radius: 50px 40px 50px 50px / 50px 40px 50px 50px;
      }
  	 </style>
   
   

	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//============= "등록"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-outline-secondary" ).on("click" , function() {
			
			Swal.fire({
				  icon: 'success',
				  title: '상품등록이 완료 되었습니다.',
				  timer: 3000
				}).then(function () {
					fncAddProduct();	
					})			
			
		});
	});	
	
	//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
				//self.location = "/index.jsp"
			});
		});	
	
	
	
	function fncAddProduct(){
	//Form 유효성 검증
 	var name = $("input[name=prodName]").val();
	var prodPrice = $("input[name=prodPrice]").val();
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(prodPrice == null || prodPrice.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}

	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype","multipart/form-data").submit();
}
	
	
	


		</script>
		
	</head>

<body>
	
		<jsp:include page="/product/prodToolBar.jsp" />
	
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	<div class="container" id="div">
 	<br/><br/><br/>
 		<h1 class=" text-center" >상 품 등 록</h1>
 		
 		
 		
 		 <!-- form Start-->
		 <form class="form-horizontal" enctype="multipart/form-data" >
				<hr>				 		
			<div class="group">
				<div class="row mx-0 mb-2">
					<label class=" col-4 control-label">
						<img src="/resources/image/no_image.jpg" style= "width: 450px; height: 360px;"/> 
							<input type="file" class="form-control"   name="prodImage" style="padding-right: 0px;  padding-left: 20px;  
							margin-top: 0px;   margin-right: 40px;border-right-width: 1px;  width: 421px;">
					</label>
				</div>
											
											<br/>
											
				<label for="prodName" class=" col-4 control-label">상품명</label>
				<div class="col-6">
					<input type="text" class="form-control"  name="prodName" placeholder="상품명을 입력해주세요." style="padding-right: 0px;  
						padding-left: 20px; margin-top: 0px;   margin-right: 40px;border-right-width: 1px;  width: 421px;">
				</div>
											
											<br/>
											
											
				<div class="col-6">
					<label for="prodPrice" class="col-6 control-label">상품가격</label>
						<input type="text" class="form-control"  name="prodPrice" placeholder="상품 가격을 입력해주세요." style="padding-right: 0px; 
						 padding-left: 20px; margin-top: 0px; margin-left: 0px;  margin-right: 40px;border-right-width: 1px;  width: 421px; ">
				</div>
										
											<br/>
											
											
											
				<label for="prodDetail" class="col-4 control-label">상품구성</label>
					<div class="col-6">
						<input type="text" class="form-control"  name="prodDetail" placeholder="상품 설명을 입력해주세요." style="padding-right: 0px; 
						padding-left: 20px; margin-top: 0px;   margin-right: 40px;border-right-width: 1px;  width: 421px;">
					</div>
											
											<br/>
											
											
										
				<label for="franType" class="col-4 control-label">프랜차이즈    </label>
					<div class="col-6">
						<select class="form-control" name="franType"style="padding-right: 0px; 
							 padding-left: 20px; margin-top: 0px;   margin-right: 40px;border-right-width: 1px;  width: 421px;">
									<option selected>프랜차이즈</option>
									<option value="0">CGV</option>
									<option value="1">롯데시네마</option>
									<option value="2">메가박스</option>
						</select>
					</div>
												
												<br/>
												
										 
				<label for="prodType" class="col-4 control-label">상품종류</label>
					<div class="col-6">
						<select class="form-control" name="prodType"style="padding-right: 0px; 
							padding-left: 20px; margin-top: 0px;   margin-right: 40px;border-right-width: 1px;  width: 421px;">
									<option selected>상품종류</option>
									<option value="0">영화관람권</option>
									<option value="1">스토어이용권</option>
									<option value="2">스낵</option>
						</select>
												
												<br>
												
					</div>
					
					<div class="form-group">
					    <div class="col-7 text-center">
					      <button  type="button" class="btn btn-outline-secondary"  >등&nbsp;록</button>
							  <a class="btn btn-outline-secondary" href="#" role="button">취&nbsp;소</a>
								<br><br>		   
					   </div>
				    </div>
					
			</div>
		</form><!-- form end ///////////////////////////////////// -->
		
		<br/>
 			 
	 </div>
</body>
</html>