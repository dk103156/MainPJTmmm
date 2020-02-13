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
	
// 	무한 스크롤 밀림 방지를 위해..
	var scrollTimer = true;
	
// 	처음에 2로 시작해서 밑에서 부터 ++
	var currentPage = 2;
	

	
	
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
					userNo : '${user.userNo}' // 이후에 고쳐야할  가능성이 다분하다 다분해!!
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
	function fncTicketing(ticketing_btn){
		var movieName = $.trim(ticketing_btn.parent().parent().parent().children('h5[name="movieTitle"]').text());
		self.location = "/ticketing/addTicketing?movieName="+movieName
	};
	
	
// 	무한스크롤 실행 함수
	function fncAutoScroll(){
	
// 		실행될 때는 false 상태
		scrollTimer = false;
			
			$.ajax(
				{
					url : "/movie/json/getBoxOfficeList",
					method : "POST",
					data : JSON.stringify({
						currentPage : currentPage,
// 						searchKeyword : $().val(),
// 						searchCondition : $().val(),
// 						viewCondition : $().val
					}),
					
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}
				}
			).done(function(responseJSON){
//					console.log("responseJSON  : "+JSON.stringify(responseJSON));	
				
// 				실행될 때 currentPage 를 하나 올려준다
				currentPage += 1;
				
// 				일정 간격 이후에 함수가 실행.. 스케쥴러 개념 for 중복방지 타이머
// 				0.5초 뒤에 scrollerTimer 를 true로 바꾸는 함수 실행
				setTimeout(function(){scrollTimer = true;}, 500);
				
// 				화면에 뿌려줄 elements
				var display ='';
				
// 				한페이지 당 하나의 row 담기 위해..
				display += "<div class='row mb-3'>";
				for (var i = 0; i < responseJSON.list.length; i++) {
					display += "<div class='col-sm-6 col-md-3 mb-4'>";
					display += "<div class='card mb-4 shadow-sm h-100' >";
					display += "<div class='card-header text-center bg-dark text-white' >";
					display += "<h4 class='mb-0'>rank.0000바꿔라</h4></div>";
					display += "<img name='poster' class='img-thumbnail card-img-top'  src='"+responseJSON.list[i].poster+"'  height='225' alt=''>";
					display += "<div class='card-body'>";
					display += "<h5 name='movieTitle' class='card-title font-weight-bold d-inline'>";
					display += responseJSON.list[i].movieTitle+"</h5>";
					
// 					관람등급
					if(responseJSON.list[i].movieRating != null && responseJSON.list[i].movieRating =='전체관람가'){
						display += "<em class = 'ico_movie allrating'>"+responseJSON.list[i].movieRating+"</em>";
					}else if(responseJSON.list[i].movieRating != null && responseJSON.list[i].movieRating =='12세이상관람가'){
						display += "<em class = 'ico_movie rating12'>"+responseJSON.list[i].movieRating+"</em>";
					}else if(responseJSON.list[i].movieRating != null && responseJSON.list[i].movieRating =='15세이상관람가'){
						display += "<em class = 'ico_movie rating15'>"+responseJSON.list[i].movieRating+"</em>";
					}else if(responseJSON.list[i].movieRating != null && responseJSON.list[i].movieRating =='청소년관람불가'){
						display += "<em class = 'ico_movie rating19'>"+responseJSON.list[i].movieRating+"</em>";
					}
					
					display += "<p class='card-text text-muted'>";
					display += "<p class='mb-1 text-muted'>평점 "+responseJSON.list[i].starRating +"</p>";
					display += "<p class='mb-1 text-muted'>개봉일 "+responseJSON.list[i].releaseDate +"</p></p>";
					display += "<div class='d-flex justify-content-between align-items-center'>";
					display += "<div class='btn-group'>";
					display += "<input name='movieNo' type='hidden' value='"+responseJSON.list[i].movieNo +"'/>";
					display += "<input name='wishUserFlag' type='hidden' value='"+responseJSON.list[i].wishUserFlag +"'/>";
					display += "<button type='button'  name='ticketing-btn' class='btn btn-sm btn-outline-secondary'><i class='fas fa-ticket-alt'></i>예매</button>";
					display += "<button type='button' name='wish-btn' class='btn btn-sm btn-outline-secondary'>";
					
					if (responseJSON.list[i].wishUserFlag != null && responseJSON.list[i].wishUserFlag == 1) {
					display += "<i class='fas fa-heart text-danger'></i> ";
					}
					if (responseJSON.list[i].wishUserFlag != null && responseJSON.list[i].wishUserFlag == 0) {
					display += "<i class='far fa-heart text-muted'></i> ";
					}
					
					display += responseJSON.list[i].wishCnt;
					display += "</button>";
					display += "</div>";
					display += "</div>";
					display += "</div>";
					display += "</div>";
					display += "</div>";
				};
				display += "</div><span class='pageLast'/> ";
				
				$('span.pageLast:last').append(display);
		                  
			}).fail(function(result, status){
				console.log(result, status);
			});
	};
	
	
	//무한 스크롤
	$(window).scroll(function(){
		if(scrollTimer){
        	if( currentPage <= ${resultPage.maxPage}){

				if  ($(window).scrollTop() == $(document).height() - $(window).height()){
					fncAutoScroll();
				}
        	}
		}
	});
	
	
	
	
	
	
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
// 			console.log(userNo);
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
			var ticketing_btn = $(this);		
			
			fncTicketing(ticketing_btn);
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
    
    <title>boxOfficeList</title>
  </head>
  <body>
    <h1>BoxOfficeList</h1>
    
    	<input type="hidden" id="currentPage" value=""/>
    
		  <div align="right">
		  	<span id="boxOfficePage" class="p-2 border-bottom border-danger border-1 text-danger">박스오피스</span> <span id="expectedMoviePage" class="p-2">상영예정작</span>
		  </div>
		   
		  
		  <div class="album py-5 bg-light">
		    <div class="container">
		
		      <c:set var="i" value="0"/>
		      <div class="row mb-3">
				<c:forEach var="movie" items="${list}">
				<c:set var="i" value="${i+1}"/>
					<div class="col-sm-6 col-md-3 mb-4">
			          <div class="card mb-4 shadow-sm h-100" >
	                    <div class="card-header text-center bg-dark text-white" >
						   <h4 class="mb-0">rank.${i}</h4>
						</div>
                	    <img name="poster" class="img-thumbnail card-img-top"  src="${movie.poster}"  height="225" alt="">
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
  							 <p class="mb-1 text-muted">평점 ${movie.starRating}</p>
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
<!-- span.pageLast : 무한 스크롤이 붙는 곳 -->
		      </div><span class='pageLast'></span>
		    </div>
		  </div>
		

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
  </body>
</html>