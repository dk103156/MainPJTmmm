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
		$( "button.btn.btn-info" ).on("click" , function() {
			self.location = "/product/getProductMainList";
		});
	});	

	
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "i" ).on("click" , function() {
				self.location = "/product/listProduct?prodType=${product.prodType}";
			});
		});	
	 
	 
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "img" ).on("click" , function() {
				self.location = "/product/getProduct?prodNo=${product.prodNo}";
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
 		<h2 class="bg-light text-dark" ><strong>인기있는 상품 TOP3</strong></h2>
 		<hr/>
		<br/>


			 <div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
				       <img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="250" height="250">
				       </div>
				        <div class="caption">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				        </div>
      				</div>
    		</div>
    		
    		
    		<div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
				       <img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="250" height="250">
				       </div>
				        <div class="caption">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				        </div>
      				</div>
    		</div>
    		
    		
    		<div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
				      <img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="250" height="250">
				       </div>
				        <div class="caption">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				        </div>
      				</div>
      				
      				<br/>
    		</div>
    		
    	
    	
    		<div class="col-lg-6 col-sm-6">
				<h2 class="bg-light text-dark" ><strong> 영화관람권    </strong><i class="glyphicon glyphicon-plus-sign" id="icon"></i></a></h2>
				<hr/><br/>
				
				
			<div class="col-sm-3 col-md-4">	
				<div class="thumb-wrapper">
      					<div class="img-box">
      						<div class="caption">
				      		<img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="150" height="100">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				         	 </div>
				        </div>
      				</div>
			</div>
			
			<div class="col-sm-3 col-md-4">		
				<div class="thumb-wrapper">
      					<div class="img-box">
      						<div class="caption">
				      		<img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="150" height="100">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				         	 </div>
				        </div>
      				</div>
      		</div>
      		
      		<div class="col-sm-3 col-md-4">		
      			<div class="thumb-wrapper">
      					<div class="img-box">
      						<div class="caption">
				      		<img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="150" height="100">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				         	 </div>
				        </div>
      				</div>	
			</div>	
		</div>
		
		
			<div class="col-lg-6 col-sm-6">
				<h2 class="bg-light text-dark" ><strong> 스토어이용권    </strong><i class="glyphicon glyphicon-plus-sign" id="icon"></i></a></h2>
				<hr/><br/>
			
			
			<div class="col-sm-3 col-md-4">	
				<div class="thumb-wrapper">
      					<div class="img-box">
      						<div class="caption">
				      		<img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="150" height="100">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				         	 </div>
				        </div>
      				</div>
			</div>
			
			<div class="col-sm-3 col-md-4">		
				<div class="thumb-wrapper">
      					<div class="img-box">
      						<div class="caption">
				      		<img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="150" height="100">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				         	 </div>
				        </div>
      				</div>
      		</div>
      		
      		<div class="col-sm-3 col-md-4">		
      			<div class="thumb-wrapper">
      					<div class="img-box">
      						<div class="caption">
				      		<img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="150" height="100">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				         	 </div>
				        </div>
      				</div>	
      				<br/><br/>
				</div>
			</div>	
			
		
		
		<h2 class="bg-light text-dark" ><strong> 스낵 </strong><i class="glyphicon glyphicon-plus-sign" id="icon"></i></a></h2>
 		<hr/>
		<br/>


			 <div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
				       <img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="250" height="250">
				       </div>
				        <div class="caption">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				        </div>
      				</div>
    		</div>
    		
    		
    		<div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
				       <img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="250" height="250">
				       </div>
				        <div class="caption">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				        </div>
      				</div>
    		</div>
    		
    		
    		<div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
				      <img src="/resources/image/cgv_dalcom.jpg" name="prodImage" id="prodImage" class="img-circle img-responsive" width="250" height="250">
				       </div>
				        <div class="caption">
				          	<h3>달콤팝콘L${product.prodName}</h3>
				         	 <p>내용도 넣을 수 있다.${product.prodDetail}</p>
				        </div>
      				</div>
      				
      				<br/>
    		</div>
			
			
			
				
	</div>	
</body>
</html>