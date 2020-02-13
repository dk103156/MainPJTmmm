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
	
	
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


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

	 <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: 0;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }



        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }
        div.wrap {
            height: 100vh;
            width: 100%;
            position: relative;
        }
        div.modal {
        
            width: 100%;
            position: fixed;
            bottom: -280px;
            left: 50%;
            transform: translateX(-50%);
            transition: all 0.3s;
        }
        div.modal.on {
            bottom: 0;
        }
        div.modalHeader {
            
        }
        div.closeModal {
            
        }
        div.closeModal a {
            background: #fcc4c2;
            display: block;
            width: 150px;
            border-radius: 5px 5px 0 0;
            text-align: center;
            
            margin: 0 auto;
            
        }
        div.closeModal a i {
            
        }
        div.modalMain {
            
            
            padding: 2px;
            background: #fcc4c2;
            height: 260px;
        }
        
    </style>

	 <script>
        $(document).ready(function() {
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });

            $('#button').on('click', function() {
                $('div.modal').toggleClass('on');
            });

        });
    </script>

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
 	
 		<br/><br/>
 		 	 
 		<div class="container">
 		

	 		<div class="col-md-1" style="text-align:center;">
			</div>
			
				<img src="/resources/image/1111.png" width ="950" height="400"><br/>
				<br>
 		</div>	
 			
 		<hr/>
		<br/>
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i }" />
			<div class="col-sm-6 col-md-4">
      				<div class="thumb-wrapper">
      					<div class="img-box">
 						<img src="/resources/image/${product.prodImage}"  width="400" height="400" class="img-circle img-responsive" >
				       	<input type="hidden" value = "${product.prodNo}">
				       </div>
				        	<h3 style="text-align:center;"><strong>${product.prodName}</strong></h3>
				          	<h4 style="text-align:center;">${product.prodDetail}</h4>
				          	<h4 style="text-align:center;">${product.prodPrice}원</h4>
				          	
				          	
				          	
				       <br/> <hr/>
      				</div>
    		</div>
    		
          </c:forEach>
          
      
       <div class="wrap">
       <button type="button" id="button">modal</button>
        <div class="modal">
            <div class="modalHeader">
                <div class="closeModal">
                    <a href="#">
                        <i class="fas fa-angle-double-down"></i>
                    </a>
                </div>
            </div>
            <div class="modalMain">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque quia sapiente voluptas distinctio quae, incidunt possimus magni, consectetur, nostrum explicabo aliquid recusandae. Officia itaque dolorum, culpa laboriosam nihil ullam. Dicta.
            </div>
            
        </div>
    </div>
      

       
	</div>	
</body>
</html>