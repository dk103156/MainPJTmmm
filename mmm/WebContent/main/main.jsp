<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
<title>Insert title here</title>
<style>
 html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }
 
 
 body {
 	height : 3000px;
 	font-family: 'Noto Sans KR', sans-serif !important;
 
 }
 
 
 .carousel-inner > .item > img {
  width:640px;
  height:360px;
}

 div#trailer{
 	width : 620px;
 
 }
 
 h3.mainPage {
 	height: 41px;
    background: url(../resources/image/mainPage/bg_h3_line.jpg) repeat-x 0 50%;
    line-height: 41px;
    text-align: center;
    font-weight: 500;
 
 }
 
 div#movieInfo{
 	width : 190px;
 
 }
 
 a.more {
 	float : right;
 
 }
 
 div.postContent p {
 	 white-space: nowrap; 
 	 overflow: hidden;
 	 text-overflow: ellipsis; 
 	 word-wrap: break-word; 
 	 -webkit-box-orient: vertical;
 }
 
/* 슬라이더 */
 	
    
    .clearfix:after { content: ''; display: block; clear: both; float: none; }
    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
    .link:hover, .link:focus { color: #9fd6c2; }
	 #movieSelectList { width: 1000px; margin: auto; }
	.slide_wrap { position: relative; width: 1000px; margin: auto; padding-bottom: 30px; }
	.slide_box { width: 100%; margin: auto; overflow-x: hidden; }
	.slide_content { display: table; float: left; width: 184px; height: 200px; }
													/* mr-3 값이 16px임*/
	.slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
	/*
	.slide_content.slide01 { background: #ddbdff; }
	.slide_content.slide02 { background: #9fd6c2; }
	.slide_content.slide03 { background: #abe2f7; }
	.slide_content.slide04 { background: #f08c78; }
	.slide_content.slide05 { background: #fbdb65; }
	*/
	.slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px; color: #999; background: none; border: 1px solid #ddd; cursor: pointer; }
	.slide_btn_box > .slide_btn_prev { left: -100px; }
	.slide_btn_box > .slide_btn_next { right: -100px; }
	.slide_pagination { position: relative; left: 75%; bottom: 150px; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
	.slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
	.slide_pagination .dot.dot_active { background: #333; }
	.slide_pagination .dot a { display: block; width: 100%; height: 100%; }
 


</style>
</head>
<body>

	<jsp:include page="/layout/header.jsp"></jsp:include>

	
	<div class="container-fluid px-0 mb-5">
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="../resources/image/mainPage/first.jpg" class="d-block w-100" alt="..." width=1048 height=518 >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../resources/image/mainPage/second.jpg" class="d-block w-100" alt="..." width=1048 height=518 >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../resources/image/mainPage/third.jpg" class="d-block w-100" alt="..." width=1048 height=518 >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
		      </div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	<div class="mb-5 mx-5">
		<h3 class="mainPage"><img class="introTag" src="http://img.cgv.co.kr/R2014/images/title/h3_movie_selection.gif" alt="MOVIE SELECTION"></h3>
	</div>
	
	<div class="container-fluid">
		<div class="pageContent row">
			<div class="col-12 movieSelection row mx-3">
				<div id="movieSelected" class="col-12 row mb-5">
					<div class="col-1"></div>
					<div class="col-5 pr-0" id="movieInfo">
						 <img name="poster" class="img-thumbnail"  src="../resources/image/mainPage/gog.jpg"  width="500" alt="">
					</div>
					<div class="col-5 pl-0" id='trailer'>
						<div class="row mx-0 mb-5">
							<div id='trailer' class="col-12 embed-responsive embed-responsive-16by9">
					  			<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/JNlnQwHWSYw" allowfullscreen></iframe>
							</div>
						</div>
						<div class="row mx-0">					
							<div id='movieInfo' class="col-12">
								<div class="card">
								  <div class="card-body">
								    <h5 class="card-title">가디언즈 오브 갤럭시</h5>
								    <h6 class="card-subtitle mb-3 text-muted"><span>평점</span></h6>
								    <h6 class="card-subtitle mb-3 text-muted"><span>개봉일</span></h6>
								    <p class="card-text">자칭 전설의 무법자 스타로드, 그러나 현실은 우주를 떠도는 그저그런 좀도둑에 불과한 피터 퀼(크리스 프랫). 뜻하지 않게 갤럭시의 절대악 타노스와 로난의 타겟이 된 그는 감옥에서 만난 암살자 가모라(조 샐다나), 거구의 파이터 드랙스(데이브 바티스타), 현상금 사냥꾼 로켓(브래들리 쿠퍼)과 그루트(빈 디젤) 콤비와 불편한 동맹을 맺고 일명 ‘가디언즈 오브 갤럭시’를 결성한다. 범상치 않은 화려한 과거를 지닌 이들이 과연 120억 명의 운명을 구할 유일한 희망이 될 수 있을까?흩어지면 무법자, 뭉치면 히어로차원이 다른 마블의 새로운 세계를 목격하라!</p>
								  </div>
								</div>
							</div><!-- end of movieInfo -->
						</div>
					</div><!-- end of trailer -->
					<div class="col-1"></div>
				</div><!-- end of movieSelected -->
				<div id="movieSelectList" class="col-12 row mb-5">
				    <div class="slide_wrap">
				      <div class="slide_box">
				        <div class="slide_list clearfix">
				        <!-- 
				          <div class="slide_content slide01 mr-3">
				            <p>1</p>  
				          </div>
				          <div class="slide_content slide02 mr-3">
				            <p>2</p>
				          </div>
				          <div class="slide_content slide03 mr-3">
				            <p>3</p>
				          </div>
				          <div class="slide_content slide04 mr-3">
				            <p>4</p>
				          </div>
				          <div class="slide_content slide05 mr-3">
				            <p>5</p>
				          </div>
				         -->
				        </div>
				        <!-- end of slide_list -->
				      </div>
				      <!-- end of slide_box -->
				      <div class="slide_btn_box">
				        <button type="button" class="slide_btn_prev">Prev</button>
				        <button type="button" class="slide_btn_next">Next</button>
				      </div>
				      <!-- end of slide_btn_box -->
				      <ul class="slide_pagination"></ul>
				      <!-- end of slide_pagination -->
				    </div> <!-- end of slide_wrap -->
				</div>
				<div id="movieList" class="col-12 row">
					<div class="col-1"></div>
					<div class="col-10">
					
					</div>
					<div class="col-1"></div>				
				</div><!-- end of movieList -->
			</div><!-- end of movieSelection -->
		</div> <!-- end of pageContent -->
	</div> <!-- end of container-fluid -->
	
	<div class="mb-5 mx-5">
	<h3 class="mainPage"><img class="introTag" src="http://img.cgv.co.kr/R2014/images/title/h3_event.gif" alt="EVENT"></h3>
	</div>
	
	<div class="container-fluid">
		<div class="pageContent row">
			<div class="col-12 row mx-3">
				<div class="col-12 row mb-5">
					<div class="col-1"></div>
					<div id="issueContent" class="col-5">
						<h5>이슈 정보<a href="#" class="more">더 보기</a></h5>
						
						<hr>
						<div class="row mx-0">
							<div class="col-12 row">
								<div class="postImage col-12 mb-2 text-center">
									<img width="430" height="345" src="/resources/image/para.jpg" class="attachment-omb-news-list size-omb-news-list wp-post-image" alt="">
								</div>
								
								<div class="postHeader col-12 mb-2 text-center">
									<h4>
										<a style="color:black;" href="/event/getQuizList">클릭 영화퀴즈 </a>
									</h4>
								</div>
								
								<div class="postContent col-12 mb-2">
									<p>퀴즈 풀고 포인트 받자</p>
								</div>
							</div>
							<br><br>
							<div class="col-12 row">
								<div class="postImage col-12 mb-2 text-center">
									<img width="430" height="345" src="/resources/image/attend.jpg" class="attachment-omb-news-list size-omb-news-list wp-post-image" alt="">
								</div>
								
								<div class="postHeader col-12 mb-2 text-center">
									<h4>
										<a style="color:black;"href="/event/addAttendance">출첵 이벤트</a>
									</h4>
								</div>
								
								<div class="postContent col-12 mb-2">
									<p>매일매일 뭅뭅뭅 출첵하면 포인트가 왕창</p>
								</div>
							</div>							
						</div>	
						
					</div><!-- end of issueContent -->
					
					<div id="eventContent" class="col-5">
						<h5><a href="/event/getPreviewList" class="more">이벤트 페이지로 가기</a></h5>
						
						<hr>
						<div class="col-12">
							<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img src="/resources/image/mainPage/preview/www.PNG" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img src="/resources/image/mainPage/preview/ccc.PNG" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img src="/resources/image/mainPage/preview/www.PNG" class="d-block w-100" alt="...">
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div><!-- end of carousel -->
						</div>
					</div><!-- end of eventContent -->
					<div class="col-1"></div>
				</div>
			</div>
		</div> <!-- end of pageContent -->
	</div> <!-- end of container-fluid -->	
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
<jsp:include page="/layout/sideBar.jsp"></jsp:include>


<!-- 슬라이더 -->
  <script>
  function slider(){
    (function () {
      var slideList = document.querySelector('.slide_list');  // Slide parent dom
      var slideContents = document.querySelectorAll('.slide_content');  // each slide dom
      var slideBtnNext = document.querySelector('.slide_btn_next'); // next button
      var slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
      var pagination = document.querySelector('.slide_pagination');
      var slideLen = slideContents.length;  // slide length
      var slideWidth = 200; // slide width
      var slideSpeed = 300; // slide speed
      var startNum = 0; // initial slide index (0 ~ 4)
      
      slideList.style.width = slideWidth * (slideLen + 8) + "px";
      
      // Copy first and last slide
      let firstChild = slideList.firstElementChild;
      let secondChild = slideList.firstElementChild.nextElementSibling; 
      let thirdChild = secondChild.nextElementSibling;
      let fouthChild = thirdChild.nextElementSibling;
      
      let lastChild = slideList.lastElementChild;
      let lastChildB4 = slideList.lastElementChild.previousElementSibling; 
      let lastChildB4B4 = lastChildB4.previousElementSibling; 
      let lastChildB4B4B4 = lastChildB4B4.previousElementSibling;
      
      let clonedFirst = firstChild.cloneNode(true);
      let clonedSecond = secondChild.cloneNode(true);
      let clonedThird = thirdChild.cloneNode(true);
      let clonedFouth = fouthChild.cloneNode(true);
      
      let clonedLast = lastChild.cloneNode(true);
      let clonedLastB4 = lastChildB4.cloneNode(true);
      let clonedLastB4B4 = lastChildB4B4.cloneNode(true);
      let clonedLastB4B4B4 = lastChildB4B4B4.cloneNode(true);
      
      // Add copied Slides
      slideList.appendChild(clonedFirst);  
      slideList.insertBefore(clonedLast, slideList.firstElementChild);
        
      slideList = document.querySelector('.slide_list')
        
      slideList.appendChild(clonedSecond);  
      slideList.insertBefore(clonedLastB4, slideList.firstElementChild);  
      
      slideList = document.querySelector('.slide_list')
      
      slideList.appendChild(clonedThird);  
      slideList.insertBefore(clonedLastB4B4, slideList.firstElementChild); 
      
      slideList = document.querySelector('.slide_list')
      
      slideList.appendChild(clonedFouth);  
      slideList.insertBefore(clonedLastB4B4B4, slideList.firstElementChild);       
        
      // Add pagination dynamically
      let pageChild = '';
      for (var i = 0; i < slideLen; i++) {
        pageChild += '<li class="dot';
        pageChild += (i === startNum) ? ' dot_active' : '';
        pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
      }
      pagination.innerHTML = pageChild;
      const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

      slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

      let curIndex = startNum; // current slide index (except copied slide)
      let curSlide = slideContents[curIndex]; // current slide dom
      curSlide.classList.add('slide_active');

      /** Next Button Event */
      slideBtnNext.addEventListener('click', function() {
        if (curIndex <= slideLen - 1) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
        }
        if (curIndex === slideLen - 1) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
          }, 300);
          curIndex = -1;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[++curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Prev Button Event */
      slideBtnPrev.addEventListener('click', function() {
        if (curIndex >= 0) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
        }
        if (curIndex === 0) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
          }, 10);
          curIndex = slideLen;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[--curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Pagination Button Event */
      let curDot;
      Array.prototype.forEach.call(pageDots, function (dot, i) {
        dot.addEventListener('click', function (e) {
          e.preventDefault();
          curDot = document.querySelector('.dot_active');
          curDot.classList.remove('dot_active');
          
          curDot = this;
          this.classList.add('dot_active');

          curSlide.classList.remove('slide_active');
          curIndex = Number(this.getAttribute('data-index'));
          curSlide = slideContents[curIndex];
          curSlide.classList.add('slide_active');
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
        });
      });
    })();
  }
  </script>
  
  <script>
  function ajaxPromise(urls,datas){
		return new Promise(function (resolve, reject){
		  $.ajax({
			  type: "POST",
			  url: urls,
			  data: JSON.stringify(datas),
			  dataType : "json",
			      headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
			      },
			      success : function(result,status){
			    	  // 데이터를 받으면 resolve() 호출
				      resolve(result);			      		
			    	  
			      }//end of success	
		
		  })//end of ajax
		})//end of Promise
	}//end of function-ajaxPromise
	
	
  
  getMovieInfo();

	
  async function getMovieInfo(){
	  <!-- 여길바꾸렴 지행아 --><!-- 여길바꾸렴 지행아 --><!-- 여길바꾸렴 지행아 --><!-- 여길바꾸렴 지행아 -->
	   var result =await ajaxPromise("/ticketing/json/getMovieList",{ } );
	  
	   result.forEach( (value,index)=> {
		   
		   var Element= "<div class='slide_content slide01 mr-3'>"
			   Element+="<p><img src='"+value.poster+"' width=184 height=200></p>"
			   Element+="</div>"
		   
		   $("div.slide_list").append(Element)
		   
		   
	   });
	   
	   slider();
  }
  
  </script>
  

</body>
</html>