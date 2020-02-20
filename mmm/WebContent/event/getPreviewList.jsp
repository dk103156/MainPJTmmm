<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<title>getPreviewAd</title> 
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" type="text/javascript" ></script>	 -->
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

 
<!-- js -->


<!-- 부트스트랩4 를 위한 것 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<!-- carousel -->
<script src="../resources/javascript/owl.carousel.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<script type="text/javascript">


		$(document).ready(function(){
		    $(".owl-carousel").owlCarousel();
		});


		$(function(){
			$('div[name="cardImg"]').on('click',function(){
				console.log('moreInfo클릭')
				var previewNo = $(this).parent().find("input[name='pn']").val();
				alert(previewNo)
				self.location = "/event/getPreview?previewNo="+previewNo;
				
			});
		})
</script>
<style>

	body{
		font-family: 'Noto Sans KR', sans-serif;
		}
	
	*{
		margin:0; 
		padding:0; 
		border:0;
		}
	
	.owl-carousel{}
	
	.owl-carousel .item{
		width: 290px;
		height: 400px;
		margin: 0px auto;
		text-align : center;
		line-height:250px; 
		margin:10px;
	}
	
	img.card-img-top{
		width: 290px;
		height:350px;
	}
	
	figure {
        width: 100%;
        position: relative;
   		}
	    
	    
	    figure img {
	        display: block;
	        width: 100%;
	        height: auto;
	    }   
	    
	    figure h4 {
	        position: absolute;
	        top: calc(100% - 50px);
	        left: 0;
	        width: 100%;
	        height: 50px;
	        color: #fff;
	        background: rgba(0, 0, 0, 0.6);
	        margin: 0;
	    }   
	    
	    figure .overlay {
	        position: absolute;
	        bottom: 0;
	        left: 0;
	        right: 0;
	        overflow: hidden;
	        width: 100%;
	        height: 0;
	        color: #fff;
	        background: rgba(0, 0, 0, 0.6);
	        -webkit-transition: .6s ease;
	        transition: .6s ease;
	    }
	    
	    figure .overlay .description {
	        font-size:13px;
	        position: relative;
	        top: 50%;
	        left: 50%;
	        padding: 0px;
	        -webkit-transform: translate(-50%, -50%);
	        -ms-transform: translate(-50%, -50%);
	        transform: translate(-50%, -50%);
	        text-align: center;
	    }
	    
	    figure:hover h4 {
	        display: none;
	    }   
	    
	    figure:hover .overlay {
	        display: block;
	        height: 100%;
	    }
	    button.btn.btn-primary {
		  display: block;
		  margin-left: 10;
		}
		
		img {
		
		}
    
	
</style>

</head> 

<body>


<div class="container">
<br/><br/>
<h5><i class="fas fa-trophy"></i>시사회 이벤트</h5>
<br/><br/><br/>

<div class="container">
	<div class="row">
	
		<div class="col-1 nav">
			<button type="button" class="btn btn-light" id="popularPrev"><i class="fa fa-angle-double-left" style="font-size:48px"></i></button>
		</div>
		
		
		
		<div class="col-10">
			<!-- owl-carousel 시작 -->
			<div class="owl-carousel owl-theme" id="owl-popular">
				<c:set var="i" value="0" />
		 <c:forEach var="preview" items="${list}">
				<div class="item">
		      <div class="card" name="cardImg">
		      <figure>
            <img name="preImg" src= "/resources/image/${preview.previewImage}" alt="" class="card-img-top" />
                  <div class="overlay">
		        	<div class="description" style="line-height:170%">
            	<c:if test="${preview.previewFlag eq 0}">
		        	${preview.previewName}<br>
		        	${preview.previewPlace}<br>
		        	${preview.preDate}<br>
		        	${preview.previewTime}
	        	</c:if>
		      <c:if test="${preview.previewFlag eq 1}">
		      <p>응모가 마감되었다</p>
		        	</c:if>
		     <input type="hidden" name="pn" value="${preview.previewNo}">
		        	</div>
		        </div>
		        
            <div name="moreInfo" class="card-body">
              <a href="#" class="btn btn-warning">More</a>
            </div>
            </figure>
          </div>
	    	
	
		  </div>
		   </c:forEach>
				
			</div>

			<!-- owl-carousel 끝 -->
		</div>
		
		<div class="col-1 nav">
			<button type="button" class="btn btn-light" id="popularNext"><i class="fa fa-angle-double-right" style="font-size:48px"></i></button>
		</div>
		
	</div>
</div>

</div>
 </body>
 
 </html>