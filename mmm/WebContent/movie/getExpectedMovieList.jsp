<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <!-- fontawesome CDN -->
    <script src="https://kit.fontawesome.com/e464a52b8d.js" crossorigin="anonymous"></script>
     
<!--      jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<!--     daum icon css -->
    <link rel="stylesheet" href="/resources/css/movieIcon.css">
       
    <style type="text/css">
    	img { max-width: 100%; height: auto; }
    	
    	.border-1 {
		    border-width:10px !important;
		}
    	
    </style>
    
	<script type="text/javascript">
	
	
// 	좋아요 활성화 / 비활성화 함수 __________wishUserFlag로 처리한다.	
	function fncDoWish(wish_btn) {
// 		console.log(wish_btn);
		var movieNo = wish_btn.parent().children('input[name="movieNo"]').val();
		var wishUserFlag = wish_btn.parent().children('input[name=wishUserFlag]').val();

		console.log(movieNo);
		console.log(wishUserFlag);
		
		var url;
		
		if (wishUserFlag ==0) {
			url = "/movie/json/addWish";
		}if (wishUserFlag != 0) {
			url = "/movie/json/deleteWish";
			
		}
		
		$.ajax(
			{
				url : url,
				method : "POST",
				data : JSON.stringify({
					movieNo : movieNo,
					userNo : $("#userNo").val() // 이후에 고쳐야할  가능성이 다분하다 다분해!!
				}),
				dataType : "json",	//data를 json으로 받았으면 좋겠다.
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}
			}		
		).done(function(responseJSON){
			console.log(wish_btn.parent().children("input[name='wishUserFlag']").val());	//기존의 flag
			console.log(responseJSON.movie.wishUserFlag);	//결과로 받는 flag
			
			if (wishUserFlag == 0) {		//좋아요 활성화시킬 경우 하트모양 변경
				$(wish_btn).html("<i class='fas fa-heart text-danger'></i> "+ responseJSON.movie.wishCnt);
			}if (wishUserFlag != 0) {		//좋아요 비활성화시킬 경우 하트모양 변경
				$(wish_btn).html("<i class='far fa-heart text-muted'></i> "+ responseJSON.movie.wishCnt)
			}
			
			
			$(wish_btn).parent().children("input[name='wishUserFlag']").val(responseJSON.movie.wishUserFlag);
			console.log(wish_btn.parent().children("input[name='wishUserFlag']").val());	//바뀐 flag
		}).fail(function(result, status){
			console.log(result, status);
		});
	};// end of fncDoWish()
	
// 	예매하기로 넘어가는 함수
	function fncTicketing(){
		
	};
	
	$(function(){
// 		console.log('movNo' + fncMovieNo())
		
// 		영화 상세페이지로 이동 이벤트
		$("img[name='poster']").on("click", function(){
			var movieNo = $(this).parent().find('input[name="movieNo"]').val();
			
			self.location = "getMovie/"+movieNo;
		});
		
// 		좋아요 버튼 이벤트
		$("button[name='wish-btn']").on("click", function(){
			var wish_btn = $(this);
			console.log(userNo);
// 			console.log( wish_btn );
			
// 			if (wishUserFlag == 0) {
// 				fncAddWish(wish_btn);	
// 			}if (wishUserFlag == 1) {
// 				fncDeleteWish(wish_btn);
// 			}

			fncDoWish(wish_btn);
		});
		
// 		예매 버튼 이벤트
		$("button[name='ticketing-btn']").on("click", function(){
			var wish_btn = $(this);		
			console.log(userNo);
			
			fncTikecting();
			
		});
		
// 		위에 박스오피스,  상영예정작 버튼 이벤트
		$("#boxOfficePage").on("click", function(){
			self.location = "/movie/getBoxOfficeList"
		});
		$("#expectedMoviePage").on("click", function(){
			self.location = "/movie/getExpectedMovieList"
		});
	});
		
	</script>
    
    <title>ExpectedMovieList</title>
  </head>
  <body>
    <h1>ExpectedMovieList</h1>
    
		  <div align="right">
		  	<span id="boxOfficePage" class="p-2 ">박스오피스</span> <span id="expectedMoviePage" class="p-2 border-bottom border-danger border-1 text-danger">상영예정작</span>
		  </div>
		  
		  <div class="album py-5 bg-light">
		    <div class="container">
		
		      <c:set var="i" value="0"/>
		      <div class="row">
				<c:forEach var="movie" items="${list}">
				<c:set var="i" value="${i+1}"/>
					<div class="col-sm-6 col-md-3 mb-4">
			          <div class="card mb-4 shadow-sm h-100" >
	                    <div class="card-header text-center bg-danger text-white" >
	                       <!--                 	       D-day 구하기 위해 날짜 계산... 오늘날짜 - 개봉일자 -->
                	       <jsp:useBean id="toDay" class="java.util.Date" />
						   <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
						   <fmt:parseDate value="${movie.releaseDate }" var="endPlanDate" pattern="yyyy-MM-dd"/>
						   <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
								
                	       <h4 class="mb-0">D - ${endDate - strDate+1}</h4>
						</div>
						 <c:if test="${movie.poster != null }">
	                	    <img name="poster" class="img-thumbnail card-img-top"  src="${movie.poster}"  height="225" alt="">
			             </c:if>
			             <c:if test="${movie.poster == null }">
	                	    <img name="poster" class="img-thumbnail card-img-top"  src="http://placehold.it/163x225/E8117F/ffffff?text=sample"  height="225" alt="">
			             </c:if> 
                	    <div class="card-body">
							<h5 name="movieTitle" class="card-title font-weight-bold d-inline">
						          ${movie.movieTitle} 
	 					       </h5> 
	 					       
	<!--  					       관람등급 -->
									<c:choose>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='전체관람가'}">
											<em class = "ico_movie allrating">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='12세이상관람가'}">
											<em class = "ico_movie rating12">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='15세이상관람가'}">
											<em class = "ico_movie rating15">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='청소년관람불가'}">
											<em class = "ico_movie rating19">${movie.movieRating}</em>
										</c:when>
									</c:choose>
								
						       <p class="card-text text-muted">
								 <p class="mb-1 text-muted">개봉일 ${movie.releaseDate}</p>
						       </p>
					       <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <input name="movieNo" type="hidden" value="${movie.movieNo}"/>
			                  <input name="wishUserFlag" type="hidden" value="${movie.wishUserFlag}"/>
			                  <button type="button"  name="ticketing-btn" class="btn btn-sm btn-outline-secondary"><i class="fas fa-ticket-alt"></i>예매</button>
<!-- 			                  	좋아요 버튼 --------------------------------------------------------------->
<!-- 								wishUserFlag 가 1인 경우==> 좋아요가 눌린 상태 -->
<!-- 								wishUserFlag 가 0인 경우==> 좋아요가 눌리지 않은 상태 -->
								
			                  <button type="button" name="wish-btn" class="btn btn-sm btn-outline-secondary">
			                 	 <c:if test="${movie.wishUserFlag ne null}">
				                 	 <c:choose>
				                 	 	<c:when test="${movie.wishUserFlag eq 1}">
				                 	 		<i class="fas fa-heart text-danger"></i> ${movie.wishCnt}
				                 	 	</c:when>
				                 	 	<c:otherwise><i class="far fa-heart text-muted"></i> ${movie.wishCnt}</c:otherwise>
				                 	 </c:choose>
			                 	 </c:if>
			                  </button>
			                </div>
			              </div>
					     </div>
			          </div>
			        </div>
				
				<c:if test="i%4==0"><br/><br/></c:if>
				</c:forEach>

<!-- 	추천 영화 -->
					<div class="col-sm-6 col-md-3">
			          <div class="card mb-4 shadow-sm h-100 card text-white bg-dark" >
	                    <div class="card-header text-center" >
						   userName님이 좋아할만한 상영작
						</div>
                	    <img name="poster"  class="img-thumbnail card-img-top"  src="${preferMovie.poster}"  height="225" alt="">
                	    <div class="card-body">
                	    
					      
					      
					       <h5 name="movieTitle" class="card-title font-weight-bold d-inline">
					          ${movie.movieTitle} 
 					       </h5> 
 					       
<!--  					       관람등급 -->
								<c:choose>
									<c:when test="${movie.movieRating ne null && movie.movieRating=='전체관람가'}">
										<em class = "ico_movie allrating">${movie.movieRating}</em>
									</c:when>
									<c:when test="${movie.movieRating ne null && movie.movieRating=='12세이상관람가'}">
										<em class = "ico_movie rating12">${movie.movieRating}</em>
									</c:when>
									<c:when test="${movie.movieRating ne null && movie.movieRating=='15세이상관람가'}">
										<em class = "ico_movie rating15">${movie.movieRating}</em>
									</c:when>
									<c:when test="${movie.movieRating ne null && movie.movieRating=='청소년관람불가'}">
										<em class = "ico_movie rating19">${movie.movieRating}</em>
									</c:when>
								</c:choose>
							
					       <p class="card-text text-white">
					         <p>장르 : 
  					       	 <c:forEach var="genre" items="${genreList}">
					       	 	${genre} 
					       	 </c:forEach>
					       	 </p>
  							 <p class="mb-1 text-white">평점 ${preferMovie.starRating}</p>
							 <p class="mb-1 text-white">개봉일 ${preferMovie.releaseDate}</p>
					       </p>
					      
					       <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <input name="movieNo" type="hidden" value="${preferMovie.movieNo}"/>
			                  <input name="wishUserFlag" type="hidden" value="${preferMovie.wishUserFlag}"/>
			                  <button type="button" class="btn btn-sm btn-outline-light"><i class="fas fa-ticket-alt"></i>예매</button>
<!-- 			                  	좋아요 버튼 --------------------------------------------------------------->
<!-- 								wishUserFlag 가 1인 경우==> 좋아요가 눌린 상태 -->
<!-- 								wishUserFlag 가 0인 경우==> 좋아요가 눌리지 않은 상태 -->
								
			                  <button type="button" name="wish-btn" class="btn btn-sm btn btn-outline-light">
			                 	 <c:if test="${preferMovie.wishUserFlag ne null}">
				                 	 <c:choose>
				                 	 	<c:when test="${preferMovie.wishUserFlag eq 1}">
				                 	 		<i class="fas fa-heart text-danger"></i> ${preferMovie.wishCnt}
				                 	 	</c:when>
				                 	 	<c:otherwise><i class="far fa-heart text-muted"></i> ${preferMovie.wishCnt}</c:otherwise>
				                 	 </c:choose>
			                 	 </c:if>
			                  </button>
			                </div>
			              </div>
					     </div>
			          </div>
			        </div>

		      
		        
		        
<!-- 		      row   -->
		      </div>
		    </div>
		  </div>
		

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
  </body>
</html>