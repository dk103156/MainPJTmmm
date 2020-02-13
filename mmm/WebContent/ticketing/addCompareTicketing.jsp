<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" >
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	

  <!-- font awesome -->
  <script src="https://kit.fontawesome.com/b435a047df.js" crossorigin="anonymous"></script>
  
    <title></title>

  <style>
  
	  ul li {
	    list-style-type:none;
	  }
	  
	  .sortmenu{
	  	margin-bottom: 9px;
	  }
	  
	  .steps-header p:first{  
	    width: 240px;
	    height: 35px;  
	    font-weight: bold;
	  }
	  
	  .steps-header p{
	  	font-size: 15px;	  	
	    height: 33px;
	    padding-top: 5px;	  	
	  }
	  
	  .seat{
	   padding-top: 9px;
	   padding-left: 9px;	    
	   padding-right: 9px;	  	  
	  }
	  
	  span, li{
	  	font-weight: bold;
	  }
	  
	  .steps-body {
	    background-color: #f2f0e4;    
	  }
	  
	  body > div.container > div > div.steps > div > div.col-9.px-1.h-100 > div.steps-body{
	  	padding-top: 9px;
	  	padding-bottom: 18px;	
	  }
	  
	  body > div.container > div > div.row > div.col-9.px-1.h-100 > div.steps-body.text-center{
	  	padding-top: 9px;
	  	padding-bottom: 9px;	  	
	  }
	  
	  .movie-select {
	  	padding-top: 9px;
	  	padding-left: 9px;	    
	    padding-right: 9px;	 
	    padding-bottom: 9px;	   
	  }
	  
	  .calendar{	  	
	  	padding-top: 5px;
    	padding-left: 9px;	  
    	padding-right: 9px;	 	
    	padding-bottom: 9px;	
	  }
	  
	  a {
	    color : black;
	  }
	 
	  .btn-right {
	  	background position : 0 -220px;
	  }
	  
	  .btn-right.on{
	    background position : -150px -220px;
	  }
	
	  li.off {
	  	background-color: black;
	  	pointer-events   : none;
	  	opacity : 0.7;
	  }	
	
	  .list-group{
	    line-height: 33px;
	  }
	  
	  .list-group-item.py-2{
	  	padding-left: 10px;
	  }

	  a span.text {
		color: #333;
		font-weight: bold;
		padding-right: 5px;
	  }
	
	  a{
	    display: block;
    	white-space: nowrap;
    	text-overflow: ellipsis;
    	overflow: hidden;
    	vertical-align: middle;
	  } 
	   
	   div > span.font-weight-bold > kbd {
	    font-size: inherit;	   
	   }
	   
	   .likeTheater.first > kbd {
	    font-size: inherit;
	    cursor: pointer;
	   }
	   
	   .likeTheater.second > kbd {
	    font-size: inherit;
	    cursor: pointer;
	   }
	   
	   .likeTheater.third > kbd {
	    font-size: inherit;
	    cursor: pointer;
	   }	   	   
	   
	   
	   /* 스크롤바 CSS  */
	   div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul	{
	   		height: 424px;
	   		overflow: auto;
	   }  
	   
	  div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul::-webkit-scrollbar {
	    width: 7px;
	  }
	  div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	  }
	  div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	  }
	  
	  div.franchise-list > ul {
	  	 display : none;
	  }
	  
	  span.arrow{
	  	margin : 0;
	  	padding : 0;
	  }
	  
	  /* 프랜차이즈셀렉터, 화살표에 커서 이벤트*/	  
	  div.franchise-select > ul > li > span:nth-child(1),
	  div > div:nth-child(5) > div.franchise-select > ul > li > span:nth-child(3) > span:nth-child(1) > i, 
	  div > div:nth-child(5) > div.franchise-select > ul > li > span:nth-child(3) > span:nth-child(2) > i
	  {
	  	cursor: pointer;
	  
	  }
	  
	  .franchiseImage {
	  	width: 50px;
	  	height: 50px;
	  	display: block;
	  }
	  
	  
	  img.firstHeaderImage , img.secondHeaderImage, img.thirdHeaderImage{
	  	width: 50px;
	  	height: 50px;
	  	display : none;	  
	  }
  </style>
  
  <script>
  </script>
  </head>
  <body>
    <div class="container">
      <!-- 비교 예매 -->
      <div class="compareTicketing">
        <!-- 타이틀 -->
        <div class="col navi">네비게이션바</div>

        <!-- 메인 컨텐츠  -->

        <div class="steps">
          <!-- 영화 선택-->
          <div class="row">
            <div class="col-3 px-0 h-100">
              <div class="steps-header">
                <p class="text-white text-center bg-dark mb-0">영화</p>
              </div>
              <div class="steps-body">
                <div class="movie-select h-auto">
                  <div class="sortmenu">
                    <a class="btn btn-primary btn-sm" href="#">예매율순</a>
                    <a class="btn btn-secondary btn-sm" href="#">가나다순</a>
                  </div>
                  <div class="movie-list text-md-left">
                  	<ul class="list-group">
	                  	<c:forEach var="i" items="${movieList}">
	                      <li class="list-group-item py-2">
	                      
	                       <c:if test= "${ i.rating == '전체'}">	
	                        	<a href="#">
	                        		<span class="icon rating-all">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>	                      
	                 
	                       <c:if test= "${ i.rating == '12세'}">	
	                        	<a href="#">
	                        		<span class="icon rating-12">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>
	                       
	                       <c:if test= "${ i.rating == '15세'}">	
	                        	<a href="#">
	                        		<span class="icon rating-15">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>
	                       
	                       <c:if test= "${ i.rating == '18세'}">	
	                        	<a href="#">
	                        		<span class="icon rating-18">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>
	                       	                       	                       	                       
	                      </li>
						</c:forEach>
					</ul>
                  </div>
                </div>
              </div>
            </div>

            <!-- 극장 선택 -->
            <div class="col-9 px-1 h-100">
              <div class="steps-header">
                <p class="text-white text-center  bg-dark mb-0">프랜차이즈 & 극장</p>
              </div>
              <div class="steps-body">
                <div class="row">
                    <div class="col-4 pl-4">
                   	<c:if test="${user.role eq 'user'}">
                    		<div class="row mb-3">
                    			<div class="col-12">	
		        					<span class="font-weight-bold"><kbd>자주가는 극장</kbd></span><br>
		        					<span class="font-weight-light text-sm-left" style='opacity : 0.4; line-height: 25px'>항목을 클릭하시면 자동선택됩니다.</span>
								</div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-12">
					        		<span class="likeTheater first"><kbd>${user.likeTheater1 }</kbd></span><br/><br/>
		
					        		<span class="likeTheater first"><kbd>${user.likeTheater2 }</kbd></span><br/><br/>
		
					        		<span class="likeTheater first"><kbd>${user.likeTheater3 }</kbd></span><br/><br/>
                    			</div>
                    		</div>
                    		<hr>
                    	</c:if>                    
                        <div class="row mx-0">
                          <div class="franchise-select">
	                           <ul class="list-group first">
	                           		 <li class="list-group-item first">
	                           		 <span class="firstHeaderName">프랜차이즈</span><img class="firstHeaderImage" src="" alt="" >
	                           		 <span class="arrowTotal" style="position: relative; left: 5px;">
		                           		 <span class="arrow" style="position : relative; bottom:2px"><i class="fas fa-sort-up"></i></span>
		                           		 <span class="arrow" style="position : relative; top:3px; right: 11px"><i class="fas fa-sort-down"></i></span>
	                           		 </span>
	                           		 </li>
							    </ul>
                          </div>
                          <div class="theater-select">
                            <ul class="list-group first">
                            		<li class="list-group-item first">극장</li>
                            </ul>
                          </div>
                        </div>
                        <div class="row mx-0">
                          <div class="franchise-list text-center">
	                           <ul class="list-group first">
				                  	<c:forEach var="i" items="${franchiseList}">
			   							  <li class="list-group-item first"><span class="franchiseName">${i.franchise}</span><img class="franchiseImage" src="" alt="" ></li>
									</c:forEach>     
							    </ul>
                          </div>
                          <div class="theater-list">
                            <ul class="list-group first">
                            
                            </ul>
                          </div>
                        </div>
                    </div>
                    <div class="col-4 pl-4">
                 	<c:if test="${user.role eq 'user'}">
                    		<div class="row mb-3">
                    			<div class="col-12">	
		        					<span class="font-weight-bold"><kbd>자주가는 극장</kbd></span><br>
		        					<span class="font-weight-light text-sm-left" style='opacity : 0.4; line-height: 25px'>항목을 클릭하시면 자동선택됩니다.</span>
								</div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-12">
					        		<span class="likeTheater second"><kbd>${user.likeTheater1 }</kbd></span><br/><br/>
		
					        		<span class="likeTheater second"><kbd>${user.likeTheater2 }</kbd></span><br/><br/>
		
					        		<span class="likeTheater second"><kbd>${user.likeTheater3 }</kbd></span><br/><br/>
                    			</div>
                    		</div>
                    		<hr>
                    	</c:if>                    
                        <div class="row mx-0">
                          <div class="franchise-select">
	                           <ul class="list-group second">  
	                           		 <li class="list-group-item second">
	                           		 <span class="secondHeaderName">프랜차이즈</span><img class="secondHeaderImage" src="" alt="" >
	                           		 <span class="arrowTotal"  style="position: relative; left: 5px;">
		                           		 <span class="arrow" style="position : relative; bottom:2px"><i class="fas fa-sort-up"></i></span>
		                           		 <span class="arrow" style="position : relative; top:3px; right: 11px"><i class="fas fa-sort-down"></i></span>
	                           		 </span>
	                           		 </li>
							    </ul>
                          </div>
                          <div class="theater-select">
                            <ul class="list-group second text-center">
                            		<li class="list-group-item second">극장</li>
                            </ul>
                          </div>
                        </div>
                        <div class="row mx-0">
                          <div class="franchise-list text-center">
	                           <ul class="list-group second">
				                  	<c:forEach var="i" items="${franchiseList}">
			   							  <li class="list-group-item second"><span class="franchiseName">${i.franchise}</span><img class="franchiseImage" src="" alt="" ></li>
									</c:forEach>     
							    </ul>
                          </div>
                          <div class="theater-list">
                            <ul class="list-group second">
                            
                            </ul>
                          </div>
                        </div>
                    </div>
                    <div class="col-4 pl-1">
                    	<c:if test="${user.role eq 'user'}">
                    		<div class="row mb-3">
                    			<div class="col-12">	
		        					<span class="font-weight-bold"><kbd>자주가는 극장</kbd></span><br>
		        					<span class="font-weight-light text-sm-left" style='opacity : 0.4; line-height: 25px'>항목을 클릭하시면 자동선택됩니다.</span>
								</div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-12">
					        		<span class="likeTheater third"><kbd>${user.likeTheater1 }</kbd></span><br/><br/>
		
					        		<span class="likeTheater third"><kbd>${user.likeTheater2 }</kbd></span><br/><br/>
		
					        		<span class="likeTheater third"><kbd>${user.likeTheater3 }</kbd></span><br/><br/>
                    			</div>
                    		</div>
                    		<hr>
                    	</c:if>                    
                        <div class="row mx-0">
                          <div class="franchise-select">
	                           <ul class="list-group third">  
	                           		<li class="list-group-item third">
	                           		 <span class="thirdHeaderName">프랜차이즈</span><img class="thirdHeaderImage" src="" alt="" >
	                           		 <span class="arrowTotal"  style="position: relative; left: 5px;">
		                           		 <span class="arrow" style="position : relative; bottom:2px"><i class="fas fa-sort-up"></i></span>
		                           		 <span class="arrow" style="position : relative; top:3px; right: 11px"><i class="fas fa-sort-down"></i></span>
	                           		 </span>
									</li>
							    </ul>
                          </div>
                          <div class="theater-select">
                            <ul class="list-group third">
                            		<li class="list-group-item third">극장</li>
                            </ul>
                          </div>
                        </div>
                        <div class="row mx-0">
                          <div class="franchise-list text-center">
	                           <ul class="list-group third">
				                  	<c:forEach var="i" items="${franchiseList}">
			   							  <li class="list-group-item third"><span class="franchiseName">${i.franchise}</span><img class="franchiseImage" src="" alt="" ></li>
									</c:forEach>     
							    </ul>
                          </div>
                          <div class="theater-list">
                            <ul class="list-group third">
                            
                            </ul>
                          </div>
                        </div>
                    </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <!-- 날짜 선택 -->
            <div class="col-3 px-0 h-100">
              <div class="steps-header">
                <p class="text-white text-center  bg-dark mb-0">날짜</p>
              </div>
              <div class="steps-body text-center">
                    <div class="calendar">
                      <ul class="list-group pl-0">
                      <c:forEach var="i" items="${yearMonthList }">
	                      <fmt:formatDate var="Year" value="${i }" pattern="yyyy"/>
	                      <fmt:formatDate var="Month" value="${i }" pattern="MM"/>
		                      <li class="month">
		                      	<div>
		                      		<span class="year">${Year }</span>
		                      		<span class="month">${Month }</span>
		                      	</div>
		                      </li>	     
                      </c:forEach>              	
                      </ul>
                    </div>
              </div>
            </div>

            <!-- 시간 선택 -->
            <div class="col-9 px-1 h-100">
              <div class="steps-header">
                <p class="text-white text-center bg-dark mb-0">시간</p>
              </div>
              <div class="steps-body text-center">
                  <div class="row">
                   	 <div class="col-4">
                          <div class="sortmenu">
                            <span class="morning">조조</span>
                            <span class="night">심야</span>
                          </div>
                          <hr>


                          <div class="remainingSeat">
                            	<div class="seat">
                            	                          		
                            	</div>
                          </div>
                    </div>

                  	  <div class="col-4">
                          <div class="sortmenu">
                            <span class="morning">조조</span>
                            <span class="night">심야</span>
                          </div>
                          <hr>


                          <div class="remainingSeat">
                            	<div class="seat">
                            	                          		
                            	</div>
                          </div>
                        </div>

                    <div class="col-4">
                          <div class="sortmenu">
                            <span class="morning">조조</span>
                            <span class="night">심야</span>
                          </div>
                          <hr>


                          <div class="remainingSeat">
                            	<div class="seat">
                            	                          		
                            	</div>
                          </div>
                    </div>

                  </div>
              </div>
            </div>
        	</div><!-- end of div steps -->
        	
        	<form>
        	<input type="hidden" name="movieName">
        	<input type="hidden" name="franchise">
        	<input type="hidden" name="theaterName">
        	<input type="hidden" name="screenDate">
        	<input type="hidden" name="screenTime">
        	</form>
          </div><!-- end of div compareTicketing -->
    </div><!-- end of div container -->	

<!-- 하단 진행 바  --> 
    <jsp:include page="/ticketing/progressBar.jsp" />	 
<!-- 하단 진행 바  -->     

     <!-- 변수 모음 -->
     <script>
     //첫번째
	 var movieFirstCheck="";
	 var franchiseFirstCheck="";
	 var theaterFirstCheck="";
	 var dateFirstCheck="";
	 var screenFirstArray = new Array();
	 
	 //두번째
	 var movieSecondCheck="";
	 var franchiseSecondCheck="";
	 var theaterSecondCheck="";
	 var dateSecondCheck="";
	 var screenSecondArray = new Array();
	 
	 //세번째
	 var movieThirdCheck="";
	 var franchiseThirdCheck="";
	 var theaterThirdCheck="";
	 var dateThirdCheck="";	 
     var screenThirdArray = new Array();
     
     //시간체크 & 최종 변수
     var finalMovieName="";
     var finalFranchise="";
     var finalTheaterName="";
     var finalYear="";
     var finalScreenDate="";
     var finalScreenTime="";
     </script>
     
     <!-- 함수 모음 --> 
     <script>
     //날짜 포맷
      function formatToDate(x){
   		 var returnArray = new Array();
   		 var month="";

   		 for(var i in x){
   			 month=x[i].substr(5,6)
   			 returnArray.push(month);
   		 }
   		 //클로저 활용 예제.. 안에 내부함수를 만들어서 함수 실행이 끝나도 로컬 변수 참조가능
   		 //개잘짠듯 ㅎㅎ;
   		 return function() {
   			return returnArray;
   		 }
     }
     //시간 포맷
     function formatTime(time) {
		var d = new Date(time);
		var hr = d.getHours();
		var min = d.getMinutes();
		if( hr <5 ){
			hr = hr+24;
		}
		if( hr>=5 && hr<10){
			hr = "0"+hr;
		}
		if( min <10) {
			min = "0" + min;
		}	
		
		var result = hr+":"+min
		return result;
	}
     


 	//1일,2일을 0을 붙여 출력
 	function formatDates(x){
 		if(x<10){
 			x = "0"+x;
 		}
 		
 		return String(x);
 	}    

     //프랜차이즈 선택 관련
     function franchiseSelect(index){
	     $("div.franchise-list > ul > li.list-group-item."+index).on("click",function(){
	    	 //$("div.theater-select ul.list-group."+index).empty()
	    	 $("div.franchise-list > ul > li.list-group-item."+index).removeClass("active");
	    	 
	    	 $(this).addClass("active");
	    	 
	 		// 좌석 선택 버튼 "빨간불" 해제하기!
	 	    $(".btn-right").removeClass("on");
	 	  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	    	
	 	  	if(index=="first"){
	    		 theaterFirstCheck=""
	    		 franchiseFirstCheck=$.trim($(this).text());
	    		 $("div.franchise-select > ul.first > li > span:nth-child(1)").text(franchiseFirstCheck)
	    		 $("img.firstHeaderImage").attr("src",$(this).children().next().attr("src")).css("display","inline");
	    		 $("div:nth-child(1) > div:nth-child(5) > div.franchise-select > ul > li > span.arrowTotal").css("top","8px");
	    		 $("span.firstHeaderName").css("position","relative").css("top","8px");
	    	}else if(index=="second"){
	    		 theaterSecondCheck=""
	    		 franchiseSecondCheck=$.trim($(this).text());
	    		 $("div.franchise-select > ul.second > li > span:nth-child(1)").text(franchiseSecondCheck)
	    		 $("img.secondHeaderImage").attr("src",$(this).children().next().attr("src")).css("display","inline");
	    		 $("div:nth-child(2) > div:nth-child(5) > div.franchise-select > ul > li > span.arrowTotal").css("top","8px");
	    		 $("span.secondHeaderName").css("position","relative").css("top","8px");
	    	}else if(index=="third"){
	    		 theaterThirdCheck=""
	    		 franchiseThirdCheck=$.trim($(this).text());
	    		 $("div.franchise-select > ul.third > li > span:nth-child(1)").text(franchiseThirdCheck)
	    		 $("img.thirdHeaderImage").attr("src",$(this).children().next().attr("src")).css("display","inline");
	    		 $("div:nth-child(3) > div:nth-child(5) > div.franchise-select > ul > li > span.arrowTotal").css("top","8px");
	    		 $("span.thirdHeaderName").css("position","relative").css("top","8px");
	    	 }
	    	 
	    	  
	    	 //$("div.franchise-select > ul.list-group."+index).empty()
	    	 //$("div.franchise-select > ul.list-group."+index).append($(this)[0].outerHTML)
	    	 
	    	 if(index=="first"){
	    		 checkFirst();
	    	 }else if(index=="second"){
	    		 checkSecond();
	    	 }else if(index=="third"){
	    		 checkThird();
	    	 }	    	 
	    	 console.log("프렌차이즈 선택 인덱스 : "+index)
	    	 theaterSelect($(this),index);
	    	 

	    	 
	     });
     }
     
     //극장 선택 관련
     function theaterSelect(element,index){
    	 
	    	 $.ajax({
	    		  type: "POST",
	    		  url: "/ticketing/json/getTheaterList",
	    		  data: JSON.stringify({
	    			 	franchise : element.text(), 
	    		  }),
	    		  dataType : "json",
    		      headers: { 
	    		        "Accept" : "application/json",
	    		        "Content-Type": "application/json"
    		      },
    		      success : function(result){
    		    	  $("div.theater-list ul.list-group."+index).empty();
    		    	  console.log("index 몇번쨰니 :"+index);
    			    	 if(index=="first"){
       			    		 checkFirst();
       			    	 }else if(index=="second"){
       			    		 checkSecond();
       			    	 }else if(index=="third"){
       			    		 checkThird();
       			    	 }	     		    	  
    		    	  for( var i in result){ 
        		    	  $("div.theater-list ul.list-group."+index).append("<li class='list-group-item "+index+"'>"+result[i].theaterName+"</li>")
        		      }
			    	  $("div.theater-list > ul > li.list-group-item."+index).on("click",function(){
			    		  
			    		  $("div.theater-list > ul > li.list-group-item."+index).removeClass("active");
			    		  $(this).addClass("active");
			    		  
				 	    	 //극장 선택 div 없애기 
				 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
				 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
				 	    	 $("#theater").css("display","block");
				 	         $("#date").css("display","block");
				 	         $("#screen").css("display","block");
				 	         $("#number").css("display","block");
				 	    	
			    			// 좌석 선택 버튼 "빨간불" 해제하기!
			    		    $(".btn-right").removeClass("on");
			    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
			    		  	
					        // 상태바 "극장" 찍기! 
					        $("#theater").children().first().next().text($.trim($(this).text()));
			    		  	// 상태바 "극장" 타이틀 찍기!
			    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
			    		  	
			    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
			    			$("#screen").children().first().next().text("");
			    			
			    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
			    			var origin_date = $("#date").children().first().next().text();
			    			var update_date = origin_date.substring(0,13)
			    			$("#date").children().first().next().text(update_date)
			    		  	
			 	    	  if(index=="first"){
			 	    		  theaterFirstCheck=$.trim($(this).text());
			 	    		 $("div.theater-select ul.list-group."+index).children().first().text(theaterFirstCheck);
				    	  }else if(index=="second"){
				    		  theaterSecondCheck=$.trim($(this).text());
				    		  $("div.theater-select ul.list-group."+index).children().first().text(theaterSecondCheck);
				    	  }else if(index=="third"){
				    		  theaterThirdCheck=$.trim($(this).text());
				    		  $("div.theater-select ul.list-group."+index).children().first().text(theaterThirdCheck);
				    	  }
			    		  
			    		  //$("div.theater-select ul.list-group."+index).empty()
			    		  //$("div.theater-select ul.list-group."+index).append($(this)[0].outerHTML);
			    		  
			 	    	 if(index=="first"){
				    		 console.log("극장 클릭 첫번쨰 체크 실행")
			 	    		 checkFirst();
				    	 }else if(index=="second"){
				    		 console.log("극장 클릭 두번째 체크 실행")
				    		 checkSecond();
				    	 }else if(index=="third"){
				    		 console.log("극장 클릭 세번째 체크 실행")
				    		 checkThird();
				    	 }
			    		  
    		    	  });//end of click
    		      }//end of success
					  
    		      
	    		}); //end of ajax
	    		
	    		
     }//end of theater Select
     
     //시간 조건 관련
     function checkFirst(){
    	 var movieName =$("div.movie-list > ul > li").hasClass("active")
    	 var franchise =$("div.franchise-list > ul > li.list-group-item.first").hasClass("active");
    	 var theaterName = $("div.theater-list > ul > li.list-group-item.first").hasClass("active");
    	 var screenTime = $("div.calendar > ul > li").hasClass("active");
    	 
    	 console.log("첫번째  movieName :"+movieName);
    	 console.log("첫번째 franchise :"+franchise);
    	 console.log("첫번째 theaterName : "+theaterName);
    	 console.log("첫번째 screenTime : "+screenTime);    	 
    	//영화 정렬  
    	 var func;    	 
    	 try{
    		 	func =getMovieList(dateFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck);
    			 func.then(function (data) {
    				 // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].movieName);
    				  }
    				 //console.log(searchArray);
    				  
    				  var movieArray =document.querySelectorAll("div.movie-list > ul > li");
    				  //for(var i in movieArray){ var i in을 하면 native code도 가져온다 뭐지 ㅡㅡ; 원인파악불가
    				  $(movieArray).removeClass("off")
    				  for(var i=0; i<movieArray.length; i++){
    					  if(searchArray.indexOf($.trim(movieArray[i].innerText))==-1){
    						 $(movieArray[i]).addClass("off")
    					  }
    				  }
    				  
    				  var array = new Array();
    				  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
    				  array = document.querySelectorAll("div.movie-list > ul > li");
    				  
    				  
    				  var newArray = Array.prototype.slice.call(array,0);

    				  newArray =newArray.sort(function(a,b){
    				      
    				      return a.classList.contains("off") - b.classList.contains("off");
    				  });
    				  //console.log(newArray);
    				  
    				  $("div.movie-list > ul").empty();
    				  for(var i=0; i<newArray.length; i++){
    					  $("div.movie-list > ul").append(newArray[i])
    				  }
    				  movieClick();
    				  
    				  //$("div.movie-list > ul > li").trigger("click"); //
    				  //movieClick()
    			});
    		 }catch(e){
    		 }
    		 
    		 //(프렌차이즈 정렬)
    		 try{
    		 	func =getFranchiseList(movieFirstCheck,dateFirstCheck);
    			 func.then(function (data) { 
    				 // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].franchise);
    				  }			
    				  
    				  var franchiseArray =document.querySelectorAll("div.franchise-list > ul.first > li > span");
    				  $(franchiseArray).removeClass("off")
    				  
    				  for(var i=0; i<franchiseArray.length; i++){
    					  if(searchArray.indexOf(franchiseArray[i].innerText)==-1){
    						  
    						  $(franchiseArray[i]).addClass("off")
    					  }
    				  }//end of for			  
    			 })//end of then
    		 }catch(e){
    			 console.log("프렌차이즈 정렬 조건이 없습니다")
    		 }
    		 
    		 
    		 //(극장 정렬)
    		 try{
    			 func=getTheaterFirstList(movieFirstCheck,franchiseFirstCheck,dateFirstCheck);
    			 func.then(function(data){
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].theaterName);
    				  }
    				  var theaterArray =document.querySelectorAll("div.theater-list > ul > li.first");
    				  $(theaterArray).removeClass("off")
    				  for(var i=0; i<theaterArray.length; i++){
    					  if(searchArray.indexOf(theaterArray[i].innerText)==-1){
    						 $(theaterArray[i]).addClass("off")
    					  }//end of if
    				  }//end of for
    				  
    				  var array = new Array();
    				  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
    				  array = document.querySelectorAll("div.theater-list > ul > li.first");
    				  
    				  
    				  var newArray = Array.prototype.slice.call(array,0);

    				  newArray =newArray.sort(function(a,b){
    				      
    				      return a.classList.contains("off") - b.classList.contains("off");
    				  });
    				  //console.log(newArray);
    				  $("div.theater-list > ul.first").empty();
    				 
    				  for(var i=0; i<newArray.length; i++){
    					  	  $("div.theater-list > ul.first").append(newArray[i]) 				  	  
    				  }//end of for
    				  
    				
		  			  $("div.theater-list > ul.first > li.list-group-item").on("click",function(){

				  		  
 				  		  $("div.theater-list > ul.first > li.list-group-item").removeClass("active");
 				  		  $(this).addClass("active");
 		  		  			
 				  		  theaterFirstCheck = $.trim($(this).text())
 		   			 	  checkFirst();
		
					  });//end of click
 
    				  				  
    			 })//end of then
    		 }catch(e){
    			 console.log("극장 정렬조건이 없습니다")
    		 }
    		 
    		 
    		 //(시간 정렬)
    		 try{
    			 func=getDateList(movieFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck);
    			 func.then(function(data){
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(formatDates(new Date(data[j].screenDate).getDate()));
    				  }
    				  
    				  
    				  var timeArray =document.querySelectorAll("div.steps-body.text-center > div > ul > li > div > span.date");
    				  $(timeArray).parent().parent().removeClass("off")
    				  for(var i=0; i<timeArray.length; i++){
    					  if(searchArray.indexOf(timeArray[i].innerText)==-1){
    						 $(timeArray[i]).parent().parent().addClass("off")
    					  }//end of if
    				  }//end of for
    				  
    			 })//end of then	 
    		 }catch(e){
    			console.log("날짜 정렬조건이 없습니다")
    		 } 
    	 
    	 //모두 선택됐다면..
    	 if( movieName==true && franchise==true && theaterName==true && screenTime == true){
    		
	    	 $.ajax({
	    		  type: "POST",
	    		  url: "/ticketing/json/getTimeList",
	    		  data: JSON.stringify({
	    			  	movieName : movieFirstCheck,
	    			 	franchise : franchiseFirstCheck,
	    			 	theaterName : theaterFirstCheck,
	    			 	screenDate : dateFirstCheck,
	    		  }),
	    		  dataType : "json",
    		      headers: { 
	    		        "Accept" : "application/json",
	    		        "Content-Type": "application/json"
    		      },
    		      success : function(result,status){
    		    	  screenFirstArray= [];//빈 배열 할당
    		    	  $("div:nth-child(1) > div.remainingSeat > div").empty()
    		    	  for( var i in result){
    		    		  if(screenFirstArray.indexOf(result[i].screenName)==-1){
    		    			  screenFirstArray.push(result[i].screenName);
    		    		  }
    		    	  }
    		    	  //1관 .. 2관 Element 추가 
    		    	  for( var i in screenFirstArray){
    		    		  var str ="<div><span class='screen'>"+$.trim(screenFirstArray[i])+"</span><ul class=list-group></ul></div>"
    		    		  $("div:nth-child(1) > div.remainingSeat > div").append(str);
    		    	  }
    		    	  
    		    	  var Elements =$("div:nth-child(1) > div.remainingSeat > div > div > ul.list-group");
    		    	  
    		    	  // 남은 좌석 수 및 시간추가
    		    	  for( var i=0; i<result.length; i++){ 
    		    		  var str="<li class='list-group-item time'><span>"+formatTime(result[i].screenTime)+"</span>";
    		    		  	  str+="<br><span class='seatcount'>남은 좌석 "+result[i].remainingSeat+"</span></li>";  
    		    		  	
    		    		  	  
        		   	  		for(var j=0; j<Elements.length; j++){
           		   	   			 if($.trim(result[i].screenName)==$.trim($(Elements[j]).prev().text())){
           		   	   				$(Elements[j]).append(str);
           		   	   		 	}//end of second if
    		    			  }//end of second for
    		     	}//end of for
    		     	firstTimeSelect(); // <-- 추가된 시간에 이벤트 
    		      }//end of success
    		      
	    		}); //end of ajax    		 
    		 
    	 }else{
    		 console.log("first 실패")
    	 }
     }
     
     function checkSecond(){
    	 var movieName =$("div.movie-list > ul > li").hasClass("active")
    	 var franchise =$("div.franchise-list > ul > li.list-group-item.second").hasClass("active");
    	 var theaterName = $("div.theater-list > ul > li.list-group-item.second").hasClass("active");
    	 var screenTime = $("div.calendar > ul > li").hasClass("active");
    	 
    	 console.log("두번째  movieName :"+movieName);
    	 console.log("두번째  franchise :"+franchise);
    	 console.log("두번째  theaterName : "+theaterName);
    	 console.log("두번째  screenTime : "+screenTime);
    	//영화 정렬   	 
    	 var func;
    	 try{
    		 	func =getMovieList(dateFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck);
    			 func.then(function (data) {
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].movieName);
    				  }
    		
    				  
    				  var movieArray =document.querySelectorAll("div.movie-list > ul > li");
    				  //for(var i in movieArray){ var i in을 하면 native code도 가져온다 뭐지 ㅡㅡ; 원인파악불가
    				  $(movieArray).removeClass("off")
    				  for(var i=0; i<movieArray.length; i++){
    					  if(searchArray.indexOf($.trim(movieArray[i].innerText))==-1){
    						 $(movieArray[i]).addClass("off")
    					  }
    				  }
    				  
    				  var array = new Array();
    				  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
    				  array = document.querySelectorAll("div.movie-list > ul > li");
    				  
    				  
    				  var newArray = Array.prototype.slice.call(array,0);

    				  newArray =newArray.sort(function(a,b){
    				      
    				      return a.classList.contains("off") - b.classList.contains("off");
    				  });
    				  //console.log(newArray);
    				  
    				  $("div.movie-list > ul").empty();
    				  for(var i=0; i<newArray.length; i++){
    					  $("div.movie-list > ul").append(newArray[i])
    				  }
    				  movieClick();
    				  
    				  //$("div.movie-list > ul > li").trigger("click"); //
    				  //movieClick()
    			});
    		 }catch(e){
    		 }
    		 
       		 //(프렌차이즈 정렬)
    		 try{
    		 	func =getFranchiseList(movieFirstCheck,dateFirstCheck);
    			 func.then(function (data) { 
    				 // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].franchise);
    				  }			
    				  
    				  var franchiseArray =document.querySelectorAll("div.franchise-list > ul > li");
    				  $(franchiseArray).removeClass("off")
       				  for(var i=0; i<franchiseArray.length; i++){
    					  if(searchArray.indexOf(franchiseArray[i].innerText)==-1){
    						 $(franchiseArray[i]).addClass("off")
    					  }
    				  }//end of for			  
    			 })//end of then
    		 }catch(e){
    			 console.log("프렌차이즈 정렬 조건이 없습니다")
    		 }
    		 
    		 //(극장 정렬)
    		 try{
    			 func=getTheaterSecondList(movieFirstCheck,franchiseSecondCheck,dateFirstCheck);
    			 func.then(function(data){
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].theaterName);
    				  }
    				  var theaterArray =document.querySelectorAll("div.theater-list > ul > li.second");
    				  $(theaterArray).removeClass("off")
    				  for(var i=0; i<theaterArray.length; i++){
    					  if(searchArray.indexOf(theaterArray[i].innerText)==-1){
    						 $(theaterArray[i]).addClass("off")
    					  }//end of if
    				  }//end of for
    				  
    				  var array = new Array();
    				  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
    				  array = document.querySelectorAll("div.theater-list > ul > li.second");
    				  
    				  
    				  var newArray = Array.prototype.slice.call(array,0);

    				  newArray =newArray.sort(function(a,b){
    				      
    				      return a.classList.contains("off") - b.classList.contains("off");
    				  });
    				  //console.log(newArray);
    				  $("div.theater-list > ul.second").empty();
    				 
    				  for(var i=0; i<newArray.length; i++){
    					  	  $("div.theater-list > ul.second").append(newArray[i]) 				  	  
    				  }//end of for
    				  
    				
		  			  $("div.theater-list > ul.second > li.list-group-item").on("click",function(){

				  		  
 				  		  $("div.theater-list > ul.second > li.list-group-item").removeClass("active");
 				  		  $(this).addClass("active");
 		  		  			
 				  		  theaterSecondCheck = $.trim($(this).text())
 		   			 	  checkSecond();
		
					  });//end of click
					  
					  
    			 })//end of then
    		 }catch(e){
    			 console.log("극장 정렬조건이 없습니다")
    		 }    		     		 
    		 
    		 //(시간 정렬)
    		 try{
    			 func=getDateList(movieFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck);
    			 func.then(function(data){
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(formatDates(new Date(data[j].screenDate).getDate()));
    				  }
    				  //console.log(searchArray)
    				  
				  var timeArray =document.querySelectorAll("div.steps-body.text-center > div > ul > li > div > span.date");
				  $(timeArray).parent().parent().removeClass("off")
				  for(var i=0; i<timeArray.length; i++){
					  if(searchArray.indexOf(timeArray[i].innerText)==-1){
						 $(timeArray[i]).parent().parent().addClass("off")
    					  }//end of if
    				  }//end of for
    				  
    			 })//end of then	 
    		 }catch(e){
    			console.log("날짜 정렬조건이 없습니다")
    		 } 
    	 		
    		 
    		 if( movieName==true && franchise==true && theaterName==true && screenTime == true){
    		
	    	 $.ajax({
	    		  type: "POST",
	    		  url: "/ticketing/json/getTimeList",
	    		  data: JSON.stringify({
	    			  	movieName : movieSecondCheck,
	    			 	franchise : franchiseSecondCheck,
	    			 	theaterName : theaterSecondCheck,
	    			 	screenDate : dateSecondCheck,
	    		  }),
	    		  dataType : "json",
    		      headers: { 
	    		        "Accept" : "application/json",
	    		        "Content-Type": "application/json"
    		      },
    		      success : function(result,status){
    		    	 	console.log("2번째 성공 !!!")
    		    	  screenSecondArray= [];//빈 배열 할당
    		    	  $("div:nth-child(2) > div.remainingSeat > div").empty()
    		    	  for( var i in result){
    		    		  if(screenSecondArray.indexOf(result[i].screenName)==-1){
    		    			  screenSecondArray.push(result[i].screenName);
    		    		  }
    		    	  }
    		    	  // 1관 ...2관 추가
    		    	  for( var i in screenSecondArray){
    		    		  var str ="<div><span class='screen'>"+$.trim(screenSecondArray[i])+"</span><ul class=list-group></ul></div>"
    		    		  $("div:nth-child(2) > div.remainingSeat > div").append(str);
    		    	  }
    		    	  
    		    	  var Elements =$("div:nth-child(2) > div.remainingSeat > div > div > ul.list-group");
    		    	  
    		    	  // 남은 좌석 수 및 시간추가
    		    	  for( var i=0; i<result.length; i++){
    		    		  var str="<li class='list-group-item time'><span>"+formatTime(result[i].screenTime)+"</span>";
    		    		  	  str+="<br><span class='seatcount'>남은 좌석 "+result[i].remainingSeat+"</span></li>";  
    		    		  	
    		    		  	  
        		   	  		for(var j=0; j<Elements.length; j++){
        		   	  			
           		   	   			 if($.trim(result[i].screenName)==$.trim($(Elements[j]).prev().text())){
           		   	   				$(Elements[j]).append(str);
           		   	   		 	}//end of third if
    		    			  }//end of third for
    		     		}//end of for
    		     		secondTimeSelect(); // <-- 추가된 시간에 이벤트 
    		    	  }//end of success
    		      });//end of ajax    
    		 
    	 }else{
    		 console.log("second 실패")
    	 }
     }
     
     function checkThird(){
    	 var movieName =$("div.movie-list > ul > li").hasClass("active")
    	 var franchise =$("div.franchise-list > ul > li.list-group-item.third").hasClass("active");
    	 var theaterName = $("div.theater-list > ul > li.list-group-item.third").hasClass("active");
    	 var screenTime = $("div.calendar > ul > li").hasClass("active");
    	 
    	 console.log("세번째  movieName :"+movieName);
    	 console.log("세번째  franchise :"+franchise);
    	 console.log("세번째  theaterName : "+theaterName);
    	 console.log("세번째  screenTime : "+screenTime);    	 
    	 //영화 정렬   	
    	 var func;    	 
    	 try{
    		 	func =getMovieList(dateFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck);
    			 func.then(function (data) {
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].movieName);
    				  }
    		
    				  
    				  var movieArray =document.querySelectorAll("div.movie-list > ul > li");
    				  //for(var i in movieArray){ var i in을 하면 native code도 가져온다 뭐지 ㅡㅡ; 원인파악불가
    				  $(movieArray).removeClass("off")
    				  for(var i=0; i<movieArray.length; i++){
    					  if(searchArray.indexOf($.trim(movieArray[i].innerText))==-1){
    						 $(movieArray[i]).addClass("off")
    					  }
    				  }
    				  
    				  var array = new Array();
    				  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
    				  array = document.querySelectorAll("div.movie-list > ul > li");
    				  
    				  
    				  var newArray = Array.prototype.slice.call(array,0);

    				  newArray =newArray.sort(function(a,b){
    				      
    				      return a.classList.contains("off") - b.classList.contains("off");
    				  });
    				  //console.log(newArray);
    				  
    				  $("div.movie-list > ul").empty();
    				  for(var i=0; i<newArray.length; i++){
    					  $("div.movie-list > ul").append(newArray[i])
    				  }
    				  movieClick();
    				  
    				  //$("div.movie-list > ul > li").trigger("click"); //
    				  //movieClick()
    			});
    		 }catch(e){
    		 }
    		 
       		 //(프렌차이즈 정렬)
    		 try{
    		 	func =getFranchiseList(movieFirstCheck,dateFirstCheck);
    			 func.then(function (data) { 
    				 // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].franchise);
    				  }			
    				  
    				  var franchiseArray =document.querySelectorAll("div.franchise-list > ul > li");
    				  $(franchiseArray).removeClass("off")
       				  for(var i=0; i<franchiseArray.length; i++){
    					  if(searchArray.indexOf(franchiseArray[i].innerText)==-1){
    						 $(franchiseArray[i]).addClass("off")
    					  }
    				  }//end of for			  
    			 })//end of then
    		 }catch(e){
    			 console.log("프렌차이즈 정렬 조건이 없습니다")
    		 }
    		 
    		 //(극장 정렬)
    		 try{
    			 func=getTheaterThirdList(movieFirstCheck,franchiseThirdCheck,dateFirstCheck);
    			 func.then(function(data){
    				  // resolve()의 결과 값이 여기로 전달됨
    				  var searchArray = new Array();	
    				  
    				  for(var j in data){
    					  searchArray.push(data[j].theaterName);
    				  }
    				  var theaterArray =document.querySelectorAll("div.theater-list > ul > li.third");
    				  $(theaterArray).removeClass("off")
    				  for(var i=0; i<theaterArray.length; i++){
    					  if(searchArray.indexOf(theaterArray[i].innerText)==-1){
    						 $(theaterArray[i]).addClass("off")
    					  }//end of if
    				  }//end of for	
    				  
    				  var array = new Array();
    				  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
    				  array = document.querySelectorAll("div.theater-list > ul > li.third");
    				  
    				  
    				  var newArray = Array.prototype.slice.call(array,0);

    				  newArray =newArray.sort(function(a,b){
    				      
    				      return a.classList.contains("off") - b.classList.contains("off");
    				  });
    				  //console.log(newArray);
    				  $("div.theater-list > ul.third").empty();
    				 
    				  for(var i=0; i<newArray.length; i++){
    					  	  $("div.theater-list > ul.third").append(newArray[i]) 				  	  
    				  }//end of for
    				  
    				
		  			  $("div.theater-list > ul.third > li.list-group-item").on("click",function(){

				  		  
 				  		  $("div.theater-list > ul.third > li.list-group-item").removeClass("active");
 				  		  $(this).addClass("active");
 		  		  			
 				  		  theaterThirdCheck = $.trim($(this).text())
 		   			 	  checkThird();
		
					  });//end of click
					  
					  
    			 })//end of then
    		 }catch(e){
    			 console.log("극장 정렬조건이 없습니다")
    		 }
		 

    	 //전부 클릭했을 때
    	 if( movieName==true && franchise==true && theaterName==true && screenTime == true){
    		
	    	 $.ajax({
	    		  type: "POST",
	    		  url: "/ticketing/json/getTimeList",
	    		  data: JSON.stringify({
	    			  	movieName : movieThirdCheck,
	    			 	franchise : franchiseThirdCheck,
	    			 	theaterName : theaterThirdCheck,
	    			 	screenDate : dateThirdCheck,
	    		  }),
	    		  dataType : "json",
    		      headers: { 
	    		        "Accept" : "application/json",
	    		        "Content-Type": "application/json"
    		      },
    		      success : function(result,status){
    		    	  screenThirdArray= [];//빈 배열 할당
    		    	  $("div:nth-child(3) > div.remainingSeat > div").empty()
    		    	  for( var i in result){
    		    		  if(screenThirdArray.indexOf(result[i].screenName)==-1){
    		    			  screenThirdArray.push(result[i].screenName);
    		    		  }
    		    	  }
    		    	  // 1관... 2관 추가
    		    	  for( var i in screenThirdArray){
    		    		  var str ="<div><span class='screen'>"+$.trim(screenThirdArray[i])+"</span><ul class=list-group></ul></div>"
    		    		  $("div:nth-child(3) > div.remainingSeat > div").append(str);
    		    	  }
    		    	  
    		    	  var Elements =$("div:nth-child(3) > div.remainingSeat > div > div > ul.list-group");
    		    	  
    		    	  // 남은 좌석 수 및 시간추가
    		    	  for(  var i=0; i<result.length; i++){
    		    		  var str="<li class='list-group-item time'><span>"+formatTime(result[i].screenTime)+"</span>";
    		    		  	  str+="<br><span class='seatcount'>남은 좌석 "+result[i].remainingSeat+"</span></li>";  
    		    		  	
    		    		  	  
        		   	  		for(var j=0; j<Elements.length; j++){
        		   	  			
           		   	   			 if($.trim(result[i].screenName)==$.trim($(Elements[j]).prev().text())){
           		   	   				$(Elements[j]).append(str);
           		   	   		 	}//end of third if
    		    			  }//end of third for
    		     		}//end of for
    		     		thirdTimeSelect(); // <-- 추가된 시간에 이벤트 
    		    	  }//end of success
    		      });//end of ajax      		 
    		 
    	 }else{
    		 console.log("third 실패")
    	 }
     }     
     
     //좌석선택 단계로 넘어가기
	 function addSeatSelect(){
		 
		 // 실제 유효성 체크
    	 var movieNam =$("div.movie-list > ul > li").hasClass("active")
    	 var franchis =$("div.franchise-list > ul > li.list-group-item.first").hasClass("active");
    	 var theaterNam = $("div.theater-list > ul > li.list-group-item.first").hasClass("active");
    	 var screenDat = $("div.calendar > ul > li").hasClass("active");
    	 var screenTim = $("div.remainingSeat > div > div > ul > li").hasClass("active");
    	 
    	 //모두 선택안됐다면...
    	 if( movieNam !=true && franchis!=true && theaterNam!=true && screenDat != true && screenTim != true){
    		 alert("영화를 선택해 주세요.")
    		 return;   		 
    	 }

    	 if( movieNam !=true){
    		 alert("영화를 선택해 주세요.")
    		 return;   		 
    	 }
    	 
    	 if( franchis !=true){
    		 alert("프랜차이즈를 선택해 주세요.")
    		 return;   		 
    	 }    	 
    	 
    	 if( theaterNam !=true){
    		 alert("극장을 선택해 주세요.")
    		 return;   		 
    	 } 
    	 
    	 if( screenDat !=true){
    		 alert("날짜를 선택해 주세요.")
    		 return;   		 
    	 }    	 
    	 
    	 if( screenTim !=true){
    		 alert("시간을 선택해 주세요.")
    		 return;   		 
    	 }    	 
		 
		 $("form").attr("method" , "POST").attr("action" , "/ticketing/addSeatSelect").submit();
	 }
     </script>
     
     <!-- 영화선택 스크립트 -->
     <script>
     //영화 제목 클릭
     movieClick();
     function movieClick(){
	     $("div.movie-list > ul > li").on("click",function(){
	    	 
	    	 $("div.movie-list > ul > li").removeClass("active");
	    	 
	    	 $(this).addClass("active");
	    	 
	    	 //영화 선택 div 없애기 
	    	 $("#ticket_tnb > div > div.info.movie > div.placeholder").css("display","none");
	    	 //영화 선택 div 없앤 후 영화 제목 띄워주기!
	    	 $("#movieTitle").css("display","block");
	    	 $(".movie_poster > img").css("display","inline");
	    	 
	 		// 좌석 선택 버튼 "빨간불" 해제하기!
	 	    $(".btn-right").removeClass("on");
	 	  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	    	 
	    	 movieFirstCheck = $.trim($(this).text());
	    	 movieSecondCheck = $.trim($(this).text());
	    	 movieThirdCheck = $.trim($(this).text());
	    	 
	    	 
	    		 checkFirst();
	    		 checkSecond();
	    		 checkThird();
	    		 
	    	 // 상태바 "영화제목" 찍기! 
	    	 $("#movieTitle span").text($.trim($(this).text()));
	    	 
	  	  	// 상태바 "영화" 타이틀 찍기!
	  	  	$("#movieTitle").children().first().attr("title", $.trim($(this).text()));
	  	  	
			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
			$("#screen").children().first().next().text("");
			
			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
			var origin_date = $("#date").children().first().next().text();
			var update_date = origin_date.substring(0,13)
			$("#date").children().first().next().text(update_date)
	    	 
	    	console.log($.trim($(this).text()))
			$.getJSON( "/ticketing/json/getDateTimeByMovieName/"+$.trim($(this).text()), function( data ) {
				    $("#ticket_tnb > div > div.info.movie > span > img").attr("src",data.poster)
				    $("#movieRating > span").text(data.rating+" 관람가")
				});
	     });//end of movie Click
     }
     </script>
     <!-- 영화선택 스크립트 -->
     
     
     <!-- 프렌차이즈 & 극장 선택 스크립트 -->
     <script>
	   	//첫번째 프렌차이즈 선택
	    franchiseSelect("first");
	     	
	    //두번째 프렌차이즈 선택
	    franchiseSelect("second");  	
	     
	    //세번째 프렌차이즈 선택
	    franchiseSelect("third");
     	
     </script>
     <!-- 프렌차이즈선택 스크립트 -->
     
     <!-- 날짜선택 스크립트 -->
     <script>
  // 서버가 동작하는 순서 JAVA -> JSTL -> HTML -> JAVASCRIPT
     //이기때문에 JSTL의 EL에서는 JAVASCRIPT접근이 불가하나, 반대는 가능 
     //날짜 변수만 저장;
  	 var week = ['일', '월', '화', '수', '목', '금', '토'];
  	 
     var array = new Array();
     var original = new Array();
   	 <c:forEach var ="i" items="${dateList}">
   	 	array.push("${i.screenDate}");
   	 </c:forEach>
   	 original = array;
   	 array = formatToDate(array);
   	 array = array();
   	 var Elements = $("div.steps-body.text-center > div > ul > li.month");
   	 
   	 for(var i in array){  		
      	  var yoil="<li class='list-group-item py-2 date'>"
   	  		yoil+="<div>"
   	  		yoil+="<span class='day'>"+week[new Date(original[i]).getDay()]+"</span>&nbsp;"
   	  		yoil+="<span class='date'>"+array[i].substring(3,5)+"</span>"
   	  		yoil+="</div>"
   	  		yoil+="</li>"
   	  		for(var j=0; j<Elements.length; j++){
	   		 if(parseInt(array[i].substring(0,2))==j+parseInt(array[i].substring(0,2))){
	   			$(Elements[j]).after(yoil);
	   		 }
   	  		}
   	 }
   	 
	$("div.steps-body.text-center > div.calendar > ul > li.list-group-item.date").on("click",function(){
		$("div.steps-body.text-center > div.calendar > ul > li.list-group-item.date").removeClass("active");
		
		$(this).addClass("active");
		finalYear=$(this).siblings().first().children().children().first().text();
		var date=$.trim($(this).children().children().first().next().text())//일 
		var Month=$(this).siblings().first().children().children().first().next().text()//월
		
    	 //극장 선택 div 없애기 
    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
    	 //극장 선택 div 없앤 후 날짜(일시) 띄워주기!
    	 $("#date").css("display","block");
	     $("#theater").css("display","block");
 	     $("#screen").css("display","block");
 	     $("#number").css("display","block");
    	 
    	 
    	 
		// 좌석 선택 버튼 "빨간불" 해제하기!
	    $(".btn-right").removeClass("on");
	  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	  	
		// 상태바 "날짜(일시)" 찍기! 
		yearrr = $("div > ul > li.month > div > span.year").text()
		monthhh = $("div > ul > li.month > div > span.month").text()
		dateee = $("div > ul > li.list-group-item.py-2.date.active > div > span.date").text()
		dayyy = $("div > ul > li.list-group-item.py-2.date.active > div > span.day").text()
		
		$("#date").children().first().next().text(yearrr+"."+monthhh+"."+dateee+"("+dayyy+")");
		// 상태바 "날짜(일시)" 타이틀 찍기!
		$("#date").children().first().next().attr("title", yearrr+"."+monthhh+"."+dateee+"("+dayyy+")");	  
		
		// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		$("#screen").children().first().next().text("");
		
		dateFirstCheck=Month+"-"+date;
		dateSecondCheck=Month+"-"+date;
		dateThirdCheck=Month+"-"+date;
		
		 checkFirst();
		 checkSecond();
		 checkThird();
	});

     
     </script>

     
      <!-- 날짜선택 스크립트 -->
      
      
      <!-- 시간선택 스크립트 -->
      <script>
      //첫째열 시간 선택
      function firstTimeSelect(){
	      $("div:nth-child(1) > div.remainingSeat > div > div > ul > li.time").on("click",function(){
	    	  $("div > div.remainingSeat > div > div > ul > li.time").removeClass("active");
	    	  $(this).addClass("active")
	    	  
	    	  finalMovieName=movieFirstCheck;
	    	  finalFranchise=franchiseFirstCheck;
	    	  finalTheaterName=theaterFirstCheck;
	    	  finalScreenDate=finalYear+"-"+dateFirstCheck;
	    	  finalScreenTime=$(this).text().substr(0,5);    
	    	  
	    	  // 좌석 선택 버튼 "빨간불" 들어오게!
	    	  $(".btn-right").addClass("on");
	    	  $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	    	  

	    	  // 상태바 "날짜(일시) 의 시간" 찍기!
	    	  timeee = $("div > div > ul > li.list-group-item.time.active > span:nth-child(1)").text()
	    	  $("#date").children().first().next().text(yearrr+"."+monthhh+"."+dateee+"("+dayyy+")"+" "+timeee);
			  // 상태바 "날짜(일시)" 타이틀 찍기!
			  $("#date").children().first().next().attr("title", yearrr+"."+monthhh+"."+dateee+"("+dayyy+")"+" "+timeee);	  
			  
			  
		      //극장 선택 div 없앤 후 상영관 띄워주기!
		      $("#screen").css("display","block");			  
	    	  // 상태바 "상영관" 찍기!
	    	  screennn = $("div > div > ul > li.list-group-item.time.active").parent().prev().text()
	    	  $("#screen").children().first().next().text(screennn);	    	
			  // 상태바 "상영관" 타이틀 찍기!
			  $("#screen").children().first().next().attr("title", screennn);	  
	    	  
	 		  $("input[name='movieName']").val(finalMovieName);
			  $("input[name='franchise']").val(finalFranchise);
			  $("input[name='theaterName']").val(finalTheaterName);
			  $("input[name='screenDate']").val(finalScreenDate);
			  $("input[name='screenTime']").val(finalScreenTime);	    	  
	    	  
	    	  // "극장명" 변경
	    	  $("#theater").children().first().next().text(finalTheaterName);
	    	  
	    	  console.log("첫번째열을 선택했군요..")
	    	  console.log("영화 제목 :"+finalMovieName)
	    	  console.log("프렌차이즈 : "+finalFranchise)
	    	  console.log("극장명 : "+finalTheaterName)
	    	  console.log("날짜는 : "+finalScreenDate)
	    	  console.log("시간은 : "+finalScreenTime)
	    	  console.log("요일은 : "+$("div > ul > li.list-group-item.py-2.date.active > div > span.day").text())
	    	  console.log("상영관은 : "+$("div > div > ul > li.list-group-item.time.active").parent().prev().text())
	    	  
	      });
      }
      
      //두째열 시간 선택
      function secondTimeSelect(){
	      $("div:nth-child(2) > div.remainingSeat > div > div > ul > li.time").on("click",function(){
	    	  $("div > div.remainingSeat > div > div > ul > li.time").removeClass("active");
	    	  $(this).addClass("active")
	    	  
	    	  // 좌석 선택 버튼 "빨간불" 들어오게!
	    	  $(".btn-right").addClass("on");
	    	  $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	    	  

	    	  // 상태바 "날짜(일시) 의 시간" 찍기!
	    	  timeee = $("div > div > ul > li.list-group-item.time.active > span:nth-child(1)").text()
	    	  $("#date").children().first().next().text(yearrr+"."+monthhh+"."+dateee+"("+dayyy+")"+" "+timeee);
			  // 상태바 "날짜(일시)" 타이틀 찍기!
			  $("#date").children().first().next().attr("title", yearrr+"."+monthhh+"."+dateee+"("+dayyy+")"+" "+timeee);	  
			  
			  
			  //극장 선택 div 없앤 후 상영관 띄워주기!
		      $("#screen").css("display","block");			  
	    	  // 상태바 "상영관" 찍기!
	    	  screennn = $("div > div > ul > li.list-group-item.time.active").parent().prev().text()
	    	  $("#screen").children().first().next().text(screennn);	    	
			  // 상태바 "상영관" 타이틀 찍기!
			  $("#screen").children().first().next().attr("title", screennn);	      	  
	    	  
	    	  finalMovieName=movieSecondCheck;
	    	  finalFranchise=franchiseSecondCheck;
	    	  finalTheaterName=theaterSecondCheck;
	    	  finalScreenDate=finalYear+"-"+dateSecondCheck;
	    	  finalScreenTime=$(this).text().substr(0,5);  

	 		 $("input[name='movieName']").val(finalMovieName);
			 $("input[name='franchise']").val(finalFranchise);
			 $("input[name='theaterName']").val(finalTheaterName);
			 $("input[name='screenDate']").val(finalScreenDate);
			 $("input[name='screenTime']").val(finalScreenTime);	 	    	  
	    	  
	    	  // "극장명" 변경
	    	  $("#theater").children().first().next().text(finalTheaterName);
	    	  
	    	  console.log("두번째열을 선택했군요..")
	    	  console.log("영화 제목 :"+finalMovieName)
	    	  console.log("프렌차이즈 : "+finalFranchise)
	    	  console.log("극장명 : "+finalTheaterName)
	    	  console.log("날짜는 : "+finalScreenDate)
	    	  console.log("시간은 : "+finalScreenTime)	    
	    	  console.log("요일은 : "+$("div > ul > li.list-group-item.py-2.date.active > div > span.day").text())
	    	  console.log("상영관은 : "+$("div > div > ul > li.list-group-item.time.active").parent().prev().text())	    	  
	      });
      }
      
      //셋째열 시간 선택
      function thirdTimeSelect(){
	      $("div:nth-child(3) > div.remainingSeat > div > div > ul > li.time").on("click",function(){
	    	  $("div > div.remainingSeat > div > div > ul > li.time").removeClass("active");
	    	  $(this).addClass("active")
	    	  
	    	  // 좌석 선택 버튼 "빨간불" 들어오게!
	    	  $(".btn-right").addClass("on");
	    	  $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	    	  
	    	  // 상태바 "날짜(일시) 의 시간" 찍기!
	    	  timeee = $("div > div > ul > li.list-group-item.time.active > span:nth-child(1)").text()
	    	  $("#date").children().first().next().text(yearrr+"."+monthhh+"."+dateee+"("+dayyy+")"+" "+timeee);
			  // 상태바 "날짜(일시)" 타이틀 찍기!
			  $("#date").children().first().next().attr("title", yearrr+"."+monthhh+"."+dateee+"("+dayyy+")"+" "+timeee);	  
			  
			  
			  //극장 선택 div 없앤 후 상영관 띄워주기!
		      $("#screen").css("display","block");			  
	    	  // 상태바 "상영관" 찍기!
	    	  screennn = $("div > div > ul > li.list-group-item.time.active").parent().prev().text()
	    	  $("#screen").children().first().next().text(screennn);	    	
			  // 상태바 "상영관" 타이틀 찍기!
			  $("#screen").children().first().next().attr("title", screennn);	      	  

	    	  finalMovieName=movieThirdCheck;
	    	  finalFranchise=franchiseThirdCheck;
	    	  finalTheaterName=theaterThirdCheck;
	    	  finalScreenDate=finalYear+"-"+dateThirdCheck;
	    	  finalScreenTime=$(this).text().substr(0,5);  

	 		 $("input[name='movieName']").val(finalMovieName);
			 $("input[name='franchise']").val(finalFranchise);
			 $("input[name='theaterName']").val(finalTheaterName);
			 $("input[name='screenDate']").val(finalScreenDate);
			 $("input[name='screenTime']").val(finalScreenTime);		    
			 
	    	  // "극장명" 변경
	    	  $("#theater").children().first().next().text(finalTheaterName);
	    	  
	    	  console.log("세번째열을 선택했군요..")
	    	  console.log("영화 제목 :"+finalMovieName)
	    	  console.log("프렌차이즈 : "+finalFranchise)
	    	  console.log("극장명 : "+finalTheaterName)
	    	  console.log("날짜는 : "+finalScreenDate)
	    	  console.log("시간은 : "+finalScreenTime)	    	  
	    	  console.log("요일은 : "+$("div > ul > li.list-group-item.py-2.date.active > div > span.day").text())
	    	  console.log("상영관은 : "+$("div > div > ul > li.list-group-item.time.active").parent().prev().text())	    	  
	      });
      }
      </script>
      <!-- 시간선택 스크립트 -->
      
<!-- ajax 모음 -->
<script>

$(function(){
	<c:if test="${user.role eq 'user'}">
		franchiseSelector('first')
		franchiseSelector('second')
		franchiseSelector('third')
	</c:if>
		
	<c:if test="${user.role ne 'user'}">
		franchiseSelectorUnUser('first')
		franchiseSelectorUnUser('second')
		franchiseSelectorUnUser('third')
	</c:if>		
		
   /* 프랜차이즈 셀렉트 바 이미지 삽입 - 프랜차이즈 이벤트 */	
   function franchiseSelector(sequence){
		$("div.franchise-select > ul."+sequence+" > li > span:nth-child(1)").on("click",function(){
			if(sequence=='first'){
				$("div:nth-child(1) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(1) > img").attr("src","../resources/image/logo/CGV.png")
				$("div:nth-child(1) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(2) > img").attr("src","../resources/image/logo/LotteCinema.png")
				$("div:nth-child(1) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(3) > img").attr("src","../resources/image/logo/MegaBox.png")
				
			}else if(sequence=='second'){	
				$("div:nth-child(2) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(1) > img").attr("src","../resources/image/logo/CGV.png")
				$("div:nth-child(2) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(2) > img").attr("src","../resources/image/logo/LotteCinema.png")
				$("div:nth-child(2) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(3) > img").attr("src","../resources/image/logo/MegaBox.png")
				
			}else if(sequence=='third'){
				$("div:nth-child(3) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(1) > img").attr("src","../resources/image/logo/CGV.png")
				$("div:nth-child(3) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(2) > img").attr("src","../resources/image/logo/LotteCinema.png")
				$("div:nth-child(3) > div:nth-child(6) > div.franchise-list > ul."+sequence+" > li:nth-child(3) > img").attr("src","../resources/image/logo/MegaBox.png")
				
			}
			
			var display =$("div.franchise-list > ul."+sequence).css("display");
			if(display == 'none'){
				$("div.franchise-list > ul."+sequence).css("display","contents");
				//$("div.franchise-list > ul."+sequence+" > li:nth-child(1)").trigger("click");
			}else{
				$("div.franchise-list > ul."+sequence).css("display","none");
				$("div.theater-list ul.list-group."+sequence).empty();
			}
			
		});//end of franchise-select click 
   }
   
   function franchiseSelectorUnUser(sequence){
		$("div.franchise-select > ul."+sequence+" > li > span:nth-child(1)").on("click",function(){
			if(sequence=='first'){
				$("div:nth-child(1) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(1) > img").attr("src","../resources/image/logo/CGV.png")
				$("div:nth-child(1) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(2) > img").attr("src","../resources/image/logo/LotteCinema.png")
				$("div:nth-child(1) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(3) > img").attr("src","../resources/image/logo/MegaBox.png")
				
			}else if(sequence=='second'){	
				$("div:nth-child(2) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(1) > img").attr("src","../resources/image/logo/CGV.png")
				$("div:nth-child(2) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(2) > img").attr("src","../resources/image/logo/LotteCinema.png")
				$("div:nth-child(2) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(3) > img").attr("src","../resources/image/logo/MegaBox.png")
				
			}else if(sequence=='third'){
				$("div:nth-child(3) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(1) > img").attr("src","../resources/image/logo/CGV.png")
				$("div:nth-child(3) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(2) > img").attr("src","../resources/image/logo/LotteCinema.png")
				$("div:nth-child(3) > div:nth-child(2) > div.franchise-list > ul."+sequence+" > li:nth-child(3) > img").attr("src","../resources/image/logo/MegaBox.png")
				
			}
			
			var display =$("div.franchise-list > ul."+sequence).css("display");
			if(display == 'none'){
				$("div.franchise-list > ul."+sequence).css("display","contents");
				//$("div.franchise-list > ul."+sequence+" > li:nth-child(1)").trigger("click");
			}else{
				$("div.franchise-list > ul."+sequence).css("display","none");
				$("div.theater-list ul.list-group."+sequence).empty();
			}
			
		});//end of franchise-select click 
  }   
	
	arrowEvent('first')
	arrowEvent('second')
	arrowEvent('third')
	
	/* 프랜차이즈 셀렉트 바 - 화살표 이벤트 */
	function arrowEvent(sequence){
		//위쪽 화살표 
		var number="";
		if(sequence=='first'){
			number="1";
			theaterFirstCheck="";
		}else if(sequence=='second'){
			number="2";
			theaterSecondCheck="";
		}else if(sequence=='third'){
			number="3";
			theaterThirdCheck="";
		}
		$("div:nth-child("+number+") > div:nth-child(5) > div.franchise-select > ul > li > span:nth-child(3) > span:nth-child(1) > i").off("click")
		$("div:nth-child("+number+") > div:nth-child(5) > div.franchise-select > ul > li > span:nth-child(3) > span:nth-child(1) > i").on("click",function(){
				var nodeList = $("div.franchise-list > ul."+sequence+" > li.list-group-item");
				var newArray = Array.prototype.slice.call(nodeList,0);
				//console.log(newArray)
				
				if($(newArray[0]).hasClass("active")){
					$(newArray[0]).removeClass("active")
					$(newArray[2]).trigger("click");
				}else if($(newArray[1]).hasClass("active")){
					$(newArray[1]).removeClass("active")
					$(newArray[0]).trigger("click");
				}else if ($(newArray[2]).hasClass("active")){
					$(newArray[2]).removeClass("active")
					$(newArray[1]).trigger("click");
				}
				
				if(sequence=='first'){
					arrowEvent('first')
				}else if(sequence=='second'){
					arrowEvent('second')
				}else if(sequence=='third'){
					arrowEvent('third')
				}			
		});
		
		//아래쪽 화살표
		$("div:nth-child("+number+") > div:nth-child(5) > div.franchise-select > ul > li > span:nth-child(3) > span:nth-child(2) > i").off("click")
		$("div:nth-child("+number+") > div:nth-child(5) > div.franchise-select > ul > li > span:nth-child(3) > span:nth-child(2) > i").on("click",function(){
			var nodeList = $("div.franchise-list > ul."+sequence+" > li.list-group-item");
			var newArray = Array.prototype.slice.call(nodeList,0);
			//console.log(newArray)
			
			if($(newArray[0]).hasClass("active")){
				$(newArray[0]).removeClass("active")
				$(newArray[1]).trigger("click");
			}else if($(newArray[1]).hasClass("active")){
				$(newArray[1]).removeClass("active")
				$(newArray[2]).trigger("click");
			}else if ($(newArray[2]).hasClass("active")){
				$(newArray[2]).removeClass("active")
				$(newArray[0]).trigger("click");
			}
			
			if(sequence=='first'){
				arrowEvent('first')
			}else if(sequence=='second'){
				arrowEvent('second')
			}else if(sequence=='third'){
				arrowEvent('third')
			}					
		});		
	}//end of arrowEvent
});//end of function



likeTheater('first');
likeTheater('second');
likeTheater('third');

//자주가는 극장 클릭
function likeTheater(sequence){
	$("span.likeTheater."+sequence).click("on",function(){
		var number="";
		if(sequence=='first'){
			number="1";
		}else if(sequence=='second'){
			number="2";
		}else if(sequence=='third'){
			number="3";
		}
		var check = $("div:nth-child("+number+") > div:nth-child(6) > div.franchise-list.text-center > ul").css("display");
		
		if(check=='none'){
			$("div.franchise-select > ul."+sequence+" > li > span:nth-child(1)").trigger("click");
		}
		
		var franchise = $(this).text();
		$("div.franchise-list > ul."+sequence).find("li:contains('"+franchise.split(" ")[0]+"')").trigger("click").promise().done(
			    function(){
			    	setTimeout(function(){
			    		 $("div.theater-list > ul."+sequence+" > li.list-group-item").each(function(index, item){
			    			 //console.log(item.innerText)	//break 는 return false, continue는 return true
			    			 if(item.innerText==franchise){
			    				 $(item).trigger("click");
			    				 return false;
			    			 }
			    			 
			    		 })
			    	},100);
			    	}//end of function
			);//end of done
	}); // end of eventHandler
}


function getMovieList(dateFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck){

	var datas;
	//프랜차이즈 첫번째만 클릭했을 경우(1),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 첫번째만 클릭했을 경우(1)-1");
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck,		  
		 		 })
	//프렌차이즈 두번째만 클릭했을 경우(1),			 		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 두번째만 클릭했을 경우(1)-2");
		datas = JSON.stringify({
			franchise : franchiseSecondCheck,	  
		 		 })
	//프렌차이즈 세번째만 클릭했을 경우(1),
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 세번째만 클릭했을 경우(1)-3");		
		datas = JSON.stringify({
			franchise : franchiseThirdCheck,	  
		 		 })
  	 		 
	}
	//날짜만 클릭했을 경우(1),		 		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-날짜만 클릭했을 경우(1)-4");		
		datas = JSON.stringify({
			screenDate : dateFirstCheck,    
		 		 })
	//프렌차이즈 첫번째, 두번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째 클릭했을 경우(2)-5");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck+","+franchiseSecondCheck 
		 		 }) 	
	//프렌차이즈 첫번째, 세번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 세번째 클릭했을 경우(2)-6");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck+","+franchiseThirdCheck
		 		 }) 
	//프렌차이즈 첫번째, 극장 첫번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 극장 첫번째 클릭했을 경우(2)-7");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck,
			 theaterName : theaterFirstCheck, 
		})
			 
	}
	//프렌차이즈 첫번째, 날짜를 클릭했을 경우(2),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 날짜를 클릭했을 경우(2)-8");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck,
			 screenDate : dateFirstCheck,  
		}) 	
	//프렌차이즈 두번째, 세번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 두번째, 세번째 클릭했을 경우(2)-9");			
		datas = JSON.stringify({
			 franchise : franchiseSecondCheck+","+franchiseThirdCheck 
		 		 }) 	
	
	}	
	//프렌차이즈 두번째, 극장 두번째 클릭했을 경우(2),		 
	
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 두번째, 극장 두번째 클릭했을 경우(2)-10");			
		datas = JSON.stringify({
			 franchise : franchiseSecondCheck,
			 theaterName : theaterSecondCheck, 
		 		 })
		 
	}
	//프렌차이즈 두번째, 날짜 클릭했을 경우(2),		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 두번째, 날짜 클릭했을 경우(2)-11");			
		datas = JSON.stringify({
			 franchise : franchiseSecondCheck,
			 screenDate : dateFirstCheck, 
		 		 })
		 
	}
	//프렌차이즈 세번째, 극장 세번째 클릭했을 경우(2),		
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 세번째, 극장 세번째 클릭했을 경우(2)-12");			
		datas = JSON.stringify({
			 franchise : franchiseThirdCheck,
			 theaterName : theaterThirdCheck, 
		 		 })
	//프렌차이즈 세번째, 날짜 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 세번째, 날짜 클릭했을 경우(2)-13");			
		datas = JSON.stringify({
			 franchise : franchiseThirdCheck,
			 screenDate : dateFirstCheck, 
		 		 })
	
	}
	//극장세번째, 날짜 클릭했을 경우(2),		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-극장세번째, 날짜 클릭했을 경우(2)-14");			
		datas = JSON.stringify({
			theaterName : theaterThirdCheck, 
			screenDate : dateFirstCheck,
		 		 })
	//프랜차이즈 첫번째,두번째,세번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 첫번째,두번째,세번째 클릭했을 경우(3)-15");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
		 		 })
	//프랜차이즈 첫번째,두번째, 극장 첫번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 첫번째,두번째, 극장 첫번째 클릭했을 경우(3)-16");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck,
		 		 })
	//프랜차이즈 첫번째,두번째, 극장 두번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 첫번째,두번째, 극장 두번째 클릭했을 경우(3)-17");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterSecondCheck,
		 		 })
			 
	}
	//프랜차이즈 첫번째,두번째, 날짜를 클릭했을 경우(3),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프랜차이즈 첫번째,두번째, 날짜를 클릭했을 경우(3)-18");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
	//프랜차이즈 첫번째,세번째, 극장 첫번째를 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 첫번째,세번째, 극장 첫번째를 클릭했을 경우(3)-19");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
		 		 })
		 
	}
	//프랜차이즈 첫번째,세번째, 극장 세번째 를 클릭했을 경우(3),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 첫번째,세번째, 극장 세번째 를 클릭했을 경우(3)-20");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
		 		 })
	//프랜차이즈 첫번째,세번째, 날짜를 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프랜차이즈 첫번째,세번째, 날짜를 클릭했을 경우(3)-21");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			screenDate : dateFirstCheck,
		 		 })	
			 
	}
	//프랜차이즈 첫번째, 극장 첫번째,날짜를 클릭했을 경우(3),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프랜차이즈 첫번째, 극장 첫번째,날짜를 클릭했을 경우(3)-22");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck,
			theaterName : theaterFirstCheck,
			screenDate : dateFirstCheck
		 		 })
	 
	}
	//프랜차이즈 두번째,세번째 극장 두번째 클릭했을 경우(3),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 두번째,세번째, 극장 두번째 클릭했을 경우(3)-23");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
		 		 })
	//프랜차이즈 두번째,세번째 극장 세번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프랜차이즈 두번째,세번째, 극장 세번째 클릭했을 경우(3)-24");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
		 		 })
	//프랜차이즈 두번째,세번째 , 날짜를 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프랜차이즈 두번째,세번째, 극장 세번째 클릭했을 경우(3)-25");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
		 
	}
	//프랜차이즈 두번째, 극장 두번째, 날짜를  클릭했을 경우(3),		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프랜차이즈 두번째, 극장 두번째, 날짜를  클릭했을 경우(3)-26");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck,
			theaterName : theaterSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
		 
	}
	//프랜차이즈 세번째, 극장 세번째, 날짜를  클릭했을 경우(3),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프랜차이즈 세번째, 극장 세번째, 날짜를  클릭했을 경우(3)-27");			
		datas = JSON.stringify({
			franchise : franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	
	}
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 극장 첫번째 클릭했을 경우(4),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째,두번째,세번쨰 , 극장 첫번째 클릭했을 경우(4)-28");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 극장 두번째 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째,두번째,세번쨰 , 극장 두번째 클릭했을 경우(4)-29");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 극장 세번째 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째,두번째,세번쨰 , 극장 세번째 클릭했을 경우(4)-30");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 날짜를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째,두번째,세번쨰 , 날짜를 클릭했을 경우(4)-31");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 극장 첫번째,두번쨰를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째, 극장 첫번째,두번쨰를 클릭했을 경우(4)-32");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
		 		 })
		 
	}
	//프렌차이즈 첫번째, 두번째, 극장 첫번째, 날짜를 클릭했을 경우(4),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째, 극장 첫번째, 날짜를 클릭했을 경우(4)-33");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck,
			screenDate : dateFirstCheck,
		 		 })
			 
	}
	//프렌차이즈 첫번째, 두번째, 극장 두번째, 날짜를 클릭했을 경우(4),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째, 극장 두번째, 날짜를 클릭했을 경우(4)-34");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
		 
	}
	//프렌차이즈 첫번째, 세번째, 극장 첫번째, 세번째를 클릭했을 경우(4),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 세번째, 극장 첫번째, 세번째를 클릭했을 경우(4)-35");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterThirdCheck,
		 		 })
	//프렌차이즈 첫번째, 세번째, 극장 첫번째, 날짜를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 세번째, 극장 첫번째, 날짜를 클릭했을 경우(4)-36");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
			screenDate : dateFirstCheck,
		 		 })
		 
	}
	//프렌차이즈 첫번째, 세번째, 극장 세번째,날짜를 클릭했을 경우(4),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 세번째, 극장 세번째,날짜를 클릭했을 경우(4)-37");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	
	}
	//프렌차이즈 두번째,세번째, 극장 두번째,세번쨰를 클릭했을 경우(4),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 두번째,세번째, 극장 두번째,세번쨰를 클릭했을 경우(4)-38");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
		 		 })
	//프렌차이즈 두번째,세번째, 극장 두번째,날짜를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 두번째,세번째, 극장 두번째,날짜를 클릭했을 경우(4)-39");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
	//프렌차이즈 두번째,세번째, 극장 세번째,날짜를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 두번째,세번째, 극장 세번째,날짜를 클릭했을 경우(4)-40");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
			 
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,두번쨰를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,두번쨰를 클릭했을 경우(5)-41");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,세번쨰를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,두번쨰를 클릭했을 경우(5)-42");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterThirdCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,날짜를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,날짜를 클릭했을 경우(5)-43");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 두번째,세번째를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,날짜를 클릭했을 경우(5)-44");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
		 		 })
	} 
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 두번째,날짜를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,날짜를 클릭했을 경우(5)-45");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 세번째,날짜를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 세번째,날짜를 클릭했을 경우(5)-46");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째, 극장 첫번째, 두번째 ,날짜를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째, 극장 첫번째, 두번째 ,날짜를 클릭했을 경우(5)-47");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 세번째, 극장 첫번째,세번째 ,날짜를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째,세번째, 극장 첫번째,세번째 ,날짜를 클릭했을 경우(5)-48");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 두번째, 세번째, 극장 두번째,세번째 ,날짜를 클릭했을 경우(5),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 두번째, 세번째, 극장 두번째,세번째 ,날짜를 클릭했을 경우(5)-49");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번쨰를 클릭했을 경우(6),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번쨰를 클릭했을 경우(6)-50");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck+","+theaterThirdCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째, 날짜를 클릭했을 경우(6),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째, 날짜를 클릭했을 경우(6)-51");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
			screenDate : dateFirstCheck,
		 		 })
	}	
	//프렌차이즈 첫번째, 두번째,세번째, 극장 두번째,세번째, 날짜를 클릭했을 경우(6),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 두번째,세번째, 날짜를 클릭했을 경우(6)-52");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번째, 날짜를 클릭했을 경우(7),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && dateFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번째, 날짜를 클릭했을 경우(7)-53");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck+","+theaterThirdCheck,
			screenDate : dateFirstCheck,
		 		 })	 		 
	}
	
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && dateFirstCheck.length==0){
		return null;
	}
	
	return new Promise(function (resolve, reject) { 
		$.ajax({
		  		  type: "POST",
		  		  url: "/ticketing/json/getMovieList",
		  		  data: datas,
		  		  dataType : "json",
				      headers: { 
		  		        "Accept" : "application/json",
		  		        "Content-Type": "application/json"
				      },
				      success : function(result,status){
				    	  // 데이터를 받으면 resolve() 호출
					      resolve(result);
				      }//end of success
			 });//end of ajax
			})//end of promise
}//end of function	

function getFranchiseList(movieFirstCheck,dateFirstCheck){
	var datas;
	//영화만 클릭했을 경우,
	if(movieFirstCheck.length!=0 && dateFirstCheck.length==0){
		console.log("프랜차이즈정렬-영화만 클릭했을 경우(1)-1");			
		datas = JSON.stringify({
			  	movieName : movieFirstCheck,
		 		 })
				 		 
	}else if(movieFirstCheck.length!=0 && dateFirstCheck.length!=0){ //영화, 날짜 클릭했을 경우,
		console.log("프랜차이즈정렬-영화,날짜 클릭했을 경우(2)-2");		
		datas = JSON.stringify({
		  	movieName : movieFirstCheck,	
			screenDate : dateFirstCheck,  
		 		 })
	}else if(movieFirstCheck.length==0 && dateFirstCheck.length!=0){ //날짜만 클릭했을 경우,
		console.log("프랜차이즈정렬-영화,날짜 클릭했을 경우(1)-3");		
		datas = JSON.stringify({
			screenDate : dateFirstCheck,  
		 		 })
	}else if(movieFirstCheck.length==0 && dateFirstCheck.length==0){
		return null;
	}
	console.log("프랜차이즈 정렬 프라미즈 작동 시작")	
	return new Promise(function (resolve, reject) {

	 $.ajax({
 		  type: "POST",
 		  url: "/ticketing/json/getFranchiseList",
 		  data: datas,
 		  dataType : "json",
		      headers: { 
 		        "Accept" : "application/json",
 		        "Content-Type": "application/json"
		      },
		      success : function(result,status){
		    	  // 데이터를 받으면 resolve() 호출
			      resolve(result);		      
		      }
	 });//end of ajax
	})//end of Promise
}//end of getFranchiseList()

//극장 첫번째열 정렬
function getTheaterFirstList(movieFirstCheck,franchiseFirstCheck,dateFirstCheck){
	var datas;
	//영화, 프렌차이즈 클릭했을 경우,
	if(movieFirstCheck.length!=0 && franchiseFirstCheck.length!=0 && dateFirstCheck.length==0){
		console.log("극장 첫번째열 정렬-영화,프랜차이즈 클릭했을 경우(2)-1");	
		datas = JSON.stringify({
			  	movieName : movieFirstCheck,
				franchise : franchiseFirstCheck,			  	
		 		 }) 
	//프렌차이즈, 날짜 클릭했을경우		 		 
	}else if(movieFirstCheck.length==0 && franchiseFirstCheck.length!=0 && dateFirstCheck.length!=0){ 
		console.log("극장 첫번째열 정렬-프랜차이즈,날짜 클릭했을 경우(2)-2");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck,
			screenDate : dateFirstCheck,  
		 		 })
	 //영화제목,프렌차이즈, 날짜 클릭했을경우,		 		 
	}else if(movieFirstCheck.length!=0 && franchiseFirstCheck.length!=0 && dateFirstCheck.length!=0){
		console.log("극장 첫번째열 정렬-영화, 프랜차이즈,날짜 클릭했을 경우(3)-2");			
		datas = JSON.stringify({
		  	movieName : movieFirstCheck,	
			franchise : franchiseFirstCheck,		  	
		  	screenDate : dateFirstCheck,  
		 		 })
	}else{
		return null;
	}	
	
	return new Promise(function (resolve, reject) {
	 $.ajax({
		  type: "POST",
		  url: "/ticketing/json/getTheaterList",
		  data: datas,
		  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		      success : function(result,status){;
			      // 데이터를 받으면 resolve() 호출
			      resolve(result);	
		    	  
		      }//end of success
	 });//end of ajax
	})//end of Promise
}//end of getTheaterFirstList()

//극장 두번째열 정렬
function getTheaterSecondList(movieFirstCheck,franchiseSecondCheck,dateFirstCheck){
	var datas;
	//영화, 프렌차이즈 클릭했을 경우,
	if(movieFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && dateFirstCheck.length==0){
		console.log("극장 두번째열 정렬-영화,프랜차이즈 클릭했을 경우(2)-1");		
		datas = JSON.stringify({
			  	movieName : movieFirstCheck,
				franchise : franchiseSecondCheck,			  	
		 		 }) 
	//프렌차이즈, 날짜 클릭했을경우		 		 
	}else if(movieFirstCheck.length==0 && franchiseSecondCheck.length!=0 && dateFirstCheck.length!=0){ 
		console.log("극장 두번째열 정렬-프랜차이즈,날짜 클릭했을 경우(2)-2");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck,
			screenDate : dateFirstCheck,  
		 		 })
	 //영화제목,프렌차이즈, 날짜 클릭했을경우,		 		 
	}else if(movieFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && dateFirstCheck.length!=0){
		console.log("극장 두번째열 정렬-영화, 프랜차이즈,날짜 클릭했을 경우(3)-2");
		datas = JSON.stringify({
		  	movieName : movieFirstCheck,	
			franchise : franchiseSecondCheck,		  	
		  	screenDate : dateFirstCheck,  
		 		 })
	}else{
		return null;
	}	
	
	return new Promise(function (resolve, reject) {
	 $.ajax({
		  type: "POST",
		  url: "/ticketing/json/getTheaterList",
		  data: datas,
		  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		      success : function(result,status){;
			      // 데이터를 받으면 resolve() 호출
			      resolve(result);	
		    	  
		      }//end of success
	 });//end of ajax
	})//end of Promise
}//end of getTheaterSecondList()

//극장 세번째열 정렬
function getTheaterThirdList(movieFirstCheck,franchiseThirdCheck,dateFirstCheck){
	var datas;
	//영화, 프렌차이즈 클릭했을 경우,
	if(movieFirstCheck.length!=0 && franchiseThirdCheck.length!=0 && dateFirstCheck.length==0){
		console.log("극장 세번째열 정렬-영화,프랜차이즈 클릭했을 경우(2)-1");		
		datas = JSON.stringify({
			  	movieName : movieFirstCheck,
				franchise : franchiseThirdCheck,			  	
		 		 }) 
	//프렌차이즈, 날짜 클릭했을경우		 		 
	}else if(movieFirstCheck.length==0 && franchiseThirdCheck.length!=0 && dateFirstCheck.length!=0){ 
		console.log("극장 세번째열 정렬-프랜차이즈,날짜 클릭했을 경우(2)-2");			
		datas = JSON.stringify({
			franchise : franchiseThirdCheck,
			screenDate : dateFirstCheck,  
		 		 })
	 //영화제목,프렌차이즈, 날짜 클릭했을경우,		 		 
	}else if(movieFirstCheck.length!=0 && franchiseThirdCheck.length!=0 && dateFirstCheck.length!=0){
		console.log("극장 세번째열 정렬-영화, 프랜차이즈,날짜 클릭했을 경우(3)-2");			
		datas = JSON.stringify({
		  	movieName : movieFirstCheck,	
			franchise : franchiseThirdCheck,		  	
		  	screenDate : dateFirstCheck,  
		 		 })
	}else if(movieFirstCheck.length==0 && franchiseThirdCheck.length==0 && dateFirstCheck.length==0){
		return null;
	}	
	
	return new Promise(function (resolve, reject) {
	 $.ajax({
		  type: "POST",
		  url: "/ticketing/json/getTheaterList",
		  data: datas,
		  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		      success : function(result,status){;
			      // 데이터를 받으면 resolve() 호출
			      resolve(result);	
		    	  
		      }//end of success
	 });//end of ajax
	})//end of Promise
}//end of getTheaterSecondList()



function getDateList(movieFirstCheck,franchiseFirstCheck,franchiseSecondCheck,franchiseThirdCheck,theaterFirstCheck,theaterSecondCheck,theaterThirdCheck){

	var datas;
	//프랜차이즈 첫번째만 클릭했을 경우(1),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 첫번째만 클릭했을 경우(1)-1");
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck,		  
		 		 })
	//프렌차이즈 두번째만 클릭했을 경우(1),			 		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 두번째만 클릭했을 경우(1)-2");
		datas = JSON.stringify({
			franchise : franchiseSecondCheck,	  
		 		 })
	//프렌차이즈 세번째만 클릭했을 경우(1),
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 세번째만 클릭했을 경우(1)-3");		
		datas = JSON.stringify({
			franchise : franchiseThirdCheck,	  
		 		 })
  	 		 
	}
	//영화만 클릭했을 경우(1),		 		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-영화만 클릭했을 경우(1)-4");		
		datas = JSON.stringify({
			movieName : movieFirstCheck,    
		 		 })
	//프렌차이즈 첫번째, 두번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째 클릭했을 경우(2)-5");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck+","+franchiseSecondCheck 
		 		 }) 	
	//프렌차이즈 첫번째, 세번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 세번째 클릭했을 경우(2)-6");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck+","+franchiseThirdCheck
		 		 }) 
	//프렌차이즈 첫번째, 극장 첫번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 극장 첫번째 클릭했을 경우(2)-7");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck,
			 theaterName : theaterFirstCheck, 
		})
			 
	}
	//프렌차이즈 첫번째, 영화를 클릭했을 경우(2),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 날짜를 클릭했을 경우(2)-8");			
		datas = JSON.stringify({
			 franchise : franchiseFirstCheck,
			 movieName : movieFirstCheck,  
		}) 	
	//프렌차이즈 두번째, 세번째 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 두번째, 세번째 클릭했을 경우(2)-9");			
		datas = JSON.stringify({
			 franchise : franchiseSecondCheck+","+franchiseThirdCheck 
		 		 }) 	
	
	}	
	//프렌차이즈 두번째, 극장 두번째 클릭했을 경우(2),		 
	
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 두번째, 극장 두번째 클릭했을 경우(2)-10");			
		datas = JSON.stringify({
			 franchise : franchiseSecondCheck,
			 theaterName : theaterSecondCheck, 
		 		 })
		 
	}
	//프렌차이즈 두번째, 영화 클릭했을 경우(2),		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 두번째, 영화 클릭했을 경우(2)-11");			
		datas = JSON.stringify({
			 franchise : franchiseSecondCheck,
			 movieName : movieFirstCheck, 
		 		 })
		 
	}
	//프렌차이즈 세번째, 극장 세번째 클릭했을 경우(2),		
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 세번째, 극장 세번째 클릭했을 경우(2)-12");			
		datas = JSON.stringify({
			 franchise : franchiseThirdCheck,
			 theaterName : theaterThirdCheck, 
		 		 })
	//프렌차이즈 세번째, 영화 클릭했을 경우(2),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 세번째, 영화 클릭했을 경우(2)-13");			
		datas = JSON.stringify({
			 franchise : franchiseThirdCheck,
			 movieName : movieFirstCheck, 
		 		 })
	
	}
	//극장세번째, 영화 클릭했을 경우(2),		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-극장세번째, 영화 클릭했을 경우(2)-14");			
		datas = JSON.stringify({
			theaterName : theaterThirdCheck, 
			movieName : movieFirstCheck,
		 		 })
	//프랜차이즈 첫번째,두번째,세번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 첫번째,두번째,세번째 클릭했을 경우(3)-15");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
		 		 })
	//프랜차이즈 첫번째,두번째, 극장 첫번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 첫번째,두번째, 극장 첫번째 클릭했을 경우(3)-16");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck,
		 		 })
	//프랜차이즈 첫번째,두번째, 극장 두번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 첫번째,두번째, 극장 두번째 클릭했을 경우(3)-17");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterSecondCheck,
		 		 })
			 
	}
	//프랜차이즈 첫번째,두번째, 영화를 클릭했을 경우(3),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프랜차이즈 첫번째,두번째, 영화를 클릭했을 경우(3)-18");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			movieName : movieFirstCheck,
		 		 })
	//프랜차이즈 첫번째,세번째, 극장 첫번째를 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 첫번째,세번째, 극장 첫번째를 클릭했을 경우(3)-19");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
		 		 })
		 
	}
	//프랜차이즈 첫번째,세번째, 극장 세번째 를 클릭했을 경우(3),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 첫번째,세번째, 극장 세번째 를 클릭했을 경우(3)-20");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
		 		 })
	//프랜차이즈 첫번째,세번째, 영화를 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프랜차이즈 첫번째,세번째, 영화를 클릭했을 경우(3)-21");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			movieName : movieFirstCheck,
		 		 })	
			 
	}
	//프랜차이즈 첫번째, 극장 첫번째,영화를 클릭했을 경우(3),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프랜차이즈 첫번째, 극장 첫번째,영화를 클릭했을 경우(3)-22");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck,
			theaterName : theaterFirstCheck,
			movieName : movieFirstCheck
		 		 })
	 
	}
	//프랜차이즈 두번째,세번째 극장 두번째 클릭했을 경우(3),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 두번째,세번째, 극장 두번째 클릭했을 경우(3)-23");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
		 		 })
	//프랜차이즈 두번째,세번째 극장 세번째 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프랜차이즈 두번째,세번째, 극장 세번째 클릭했을 경우(3)-24");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
		 		 })
	//프랜차이즈 두번째,세번째 , 영화를 클릭했을 경우(3),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프랜차이즈 두번째,세번째, 영화를 클릭했을 경우(3)-25");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			movieName : movieFirstCheck,
		 		 })
		 
	}
	//프랜차이즈 두번째, 극장 두번째, 영화를  클릭했을 경우(3),		 
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프랜차이즈 두번째, 극장 두번째, 영화를  클릭했을 경우(3)-26");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck,
			theaterName : theaterSecondCheck,
			movieName : movieFirstCheck,
		 		 })
		 
	}
	//프랜차이즈 세번째, 극장 세번째, 영화를  클릭했을 경우(3),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프랜차이즈 세번째, 극장 세번째, 영화를  클릭했을 경우(3)-27");			
		datas = JSON.stringify({
			franchise : franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	
	}
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 극장 첫번째 클릭했을 경우(4),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째,두번째,세번쨰 , 극장 첫번째 클릭했을 경우(4)-28");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 극장 두번째 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째,두번째,세번쨰 , 극장 두번째 클릭했을 경우(4)-29");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 극장 세번째 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째,두번째,세번쨰 , 극장 세번째 클릭했을 경우(4)-30");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 세번쨰 , 영화를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째,두번째,세번쨰 , 영화를 클릭했을 경우(4)-31");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	//프렌차이즈 첫번째, 두번째, 극장 첫번째,두번쨰를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째, 극장 첫번째,두번쨰를 클릭했을 경우(4)-32");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
		 		 })
		 
	}
	//프렌차이즈 첫번째, 두번째, 극장 첫번째, 영화를 클릭했을 경우(4),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째, 극장 첫번째, 영화를 클릭했을 경우(4)-33");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck,
			movieName : movieFirstCheck,
		 		 })
			 
	}
	//프렌차이즈 첫번째, 두번째, 극장 두번째, 영화를 클릭했을 경우(4),	
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째, 극장 두번째, 영화를 클릭했을 경우(4)-34");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterSecondCheck,
			movieName : movieFirstCheck,
		 		 })
		 
	}
	//프렌차이즈 첫번째, 세번째, 극장 첫번째, 세번째를 클릭했을 경우(4),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 세번째, 극장 첫번째, 세번째를 클릭했을 경우(4)-35");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterThirdCheck,
		 		 })
	//프렌차이즈 첫번째, 세번째, 극장 첫번째, 영화를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 세번째, 극장 첫번째, 영화를 클릭했을 경우(4)-36");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
			movieName : movieFirstCheck,
		 		 })
		 
	}
	//프렌차이즈 첫번째, 세번째, 극장 세번째,영화를 클릭했을 경우(4),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 세번째, 극장 세번째, 영화를 클릭했을 경우(4)-37");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	
	}
	//프렌차이즈 두번째,세번째, 극장 두번째,세번쨰를 클릭했을 경우(4),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 두번째,세번째, 극장 두번째,세번쨰를 클릭했을 경우(4)-38");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
		 		 })
	//프렌차이즈 두번째,세번째, 극장 두번째,영화를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 두번째,세번째, 극장 두번째, 영화를 클릭했을 경우(4)-39");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
			movieName : movieFirstCheck,
		 		 })
	//프렌차이즈 두번째,세번째, 극장 세번째,영화를 클릭했을 경우(4),		 
	}
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 두번째,세번째, 극장 세번째, 영화를 클릭했을 경우(4)-40");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
			 
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,두번쨰를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,두번쨰를 클릭했을 경우(5)-41");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,세번쨰를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,두번쨰를 클릭했을 경우(5)-42");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterThirdCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째, 영화를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째, 영화를 클릭했을 경우(5)-43");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 두번째,세번째를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("영화정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째,날짜를 클릭했을 경우(5)-44");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
		 		 })
	} 
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 두번째, 영화를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 첫번째, 영화를 클릭했을 경우(5)-45");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번쨰, 극장 세번째, 영화를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번쨰, 극장 세번째, 영화를 클릭했을 경우(5)-46");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째, 극장 첫번째, 두번째 , 영화를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째, 극장 첫번째, 두번째 , 영화를 클릭했을 경우(5)-47");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 세번째, 극장 첫번째,세번째 , 영화를 클릭했을 경우(5),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length==0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck==0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째,세번째, 극장 첫번째,세번째 ,영화를 클릭했을 경우(5)-48");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 두번째, 세번째, 극장 두번째,세번째 , 영화를 클릭했을 경우(5),
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 두번째, 세번째, 극장 두번째,세번째 , 영화를 클릭했을 경우(5)-49");			
		datas = JSON.stringify({
			franchise : franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번쨰를 클릭했을 경우(6),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length==0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번쨰를 클릭했을 경우(6)-50");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck+","+theaterThirdCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째, 영화를 클릭했을 경우(6),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck==0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째, 영화를 클릭했을 경우(6)-51");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck,
			movieName : movieFirstCheck,
		 		 })
	}	
	//프렌차이즈 첫번째, 두번째,세번째, 극장 두번째,세번째, 영화를 클릭했을 경우(6),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck==0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 두번째,세번째, 영화를 클릭했을 경우(6)-52");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterSecondCheck+","+theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })
	}
	//프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번째, 영화를 클릭했을 경우(7),
	if(franchiseFirstCheck.length!=0 && franchiseSecondCheck.length!=0 && franchiseThirdCheck!=0 && 
			theaterFirstCheck!=0 && theaterSecondCheck!=0 && theaterThirdCheck!=0  && movieFirstCheck.length!=0){
		console.log("날짜정렬-프렌차이즈 첫번째, 두번째,세번째, 극장 첫번째,두번째,세번째, 영화를 클릭했을 경우(7)-53");			
		datas = JSON.stringify({
			franchise : franchiseFirstCheck+","+franchiseSecondCheck+","+franchiseThirdCheck,
			theaterName : theaterFirstCheck+","+theaterSecondCheck+","+theaterThirdCheck,
			movieName : movieFirstCheck,
		 		 })	 		 
	}
	
	if(franchiseFirstCheck.length==0 && franchiseSecondCheck.length==0 && franchiseThirdCheck==0 && 
			theaterFirstCheck==0 && theaterSecondCheck==0 && theaterThirdCheck==0  && movieFirstCheck.length==0){
		return null;
	}
	
	return new Promise(function (resolve, reject) {
		 $.ajax({
			  type: "POST",
			  url: "/ticketing/json/getDateList",
			  data: datas,
			  dataType : "json",
			      headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
			      },
			      success : function(result,status){
			    	  // 데이터를 받으면 resolve() 호출
				      resolve(result);			      		
			    	  
			      }//end of success
		 });//end of ajax
	})//end of Promise
}//end of getDateList()

</script>        

  </body>
</html>
