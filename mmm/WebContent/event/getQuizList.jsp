<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>

<!-- fontawesome-->
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
<script type="text/javascript">

	
	
	function checkAnswer(qBtn){
		
		var quizNo =qBtn.parent().children('input[name="quizNo"]').val();
		var userNo =qBtn.parent().children('input[name="userNo"]').val();
		var choice = qBtn.parent().parent().find('input[name="option"]:checked').val();
		console.log($("input[name='quizNo']").val(quizNo));
		
		console.log("quizNo>>"+quizNo);
		console.log("userNo>>"+userNo);
		console.log("choice>>"+choice);

		$.ajax(
				{
			
				url: "/event/json/checkQuiz",
				method: "POST",
				data: JSON.stringify({
					userNo  :  userNo,
					quizNo  :  quizNo,
					choice : choice
					}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
			}
				
		).done(function(JSONData){
			
			//alert(JSONData.partCnt)
			//이미참여했을때
			if(JSONData.result==2){
				
				Swal.fire({
					text: '이미 참여하셨습니다.',
					icon: 'error',
					confirmButtonText: "confirm"
				}).then((confirm)=>{
					self.location="/event/getQuizList?userNo="+userNo;
				})
				
			}else{
				
				if(JSONData.result==0){
					
					Swal.fire({
						text: '정답입니다',
						icon: 'success',
						confirmButtonText: "confirm"
					}).then((confirm)=>{
						$("form").attr("method","POST").attr("action", "/event/addWinQuiz").submit();
					})
					
					
				}else if(JSONData.result==1){
					
					
					Swal.fire({ 
						text: '정답이 아닙니다.',
						icon: 'error',
						confirmButtonText: "confirm"
					}).then((confirm)=>{
						$("form").attr("method","POST").attr("action", "/event/addLoseQuiz").submit();
					})
			
				}
			
		}
			
		
		
	});

	}

	$(function(){
		
		
		$("button[name='qBtn']").on("click", function(){
			
			console.log("퀴즈풀기 버튼 클릭됨");
			var qBtn = $(this);
			checkAnswer(qBtn);
		});
		
		
	})


 	function Pagination(currentPage) {
 		console.log('fncGetList에 왔거든여');
 		$("#currentPage").val(currentPage);
		console.log($('#currentPage').val());

	$("form").attr("method","POST").attr("action", "/event/getQuizList").submit();
	}
	
	
</script>

<style>

		a.crtPage{
		background-color: black;
		}

   		#header{ 
      	width:750px;
      	height:auto;
      	padding: 20px;
      	background-color:white;
        margin: 10px auto;
        border: 1px solid black;
        color:  black;
        }
        
       .qLogin ul{
   		 position: absolute;
	  	 right: 18px;
	   	 top: 11px;
		}
		
		.qLogin ul li {
	  	  float: left;
	 	  padding-left: 18px;  
         }
         
		.qLogin ul li P{
	 	 padding: 15px 40px 22px;
	     background: #fff;
	     text-align: center;
	     line-height: 19px;
	     font-size: 16px;
		}
		
		.qLogin ul li p span{
	    display: block;
    	padding-bottom: 11px;
    	font-weight: 650;
    	 border: 1px solid #bcbcbc;
		}
   
        ul, ol{
        list-style: none;
        } 
        
         .qLogin{
      	 width:808px;
     	 height: 119px;
     	 background:#fee00e;
         margin: 10px auto;
         position: relative;
         border: 1px solid #bcbcbc;
	   }
    
       .qLogin .qltx{
        padding-top: 30px;
	    padding-left: 45px;
	    pqeeint-bottom: 28px;
	    font-size: 18px;
	    color: black;
	    line-height: 20px;
	    font-weight: 650;
	    background-color: #fee00e;
	  }
  
		  
		.btn{ 
		width:70px;
	    background-color: #cecfc6;
	    border: none;
	    color:#000000;
	    padding: 10px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px !important;
	    margin: 6px;
	    cursor: pointer;
		border-radius:40px;
		}
		
		.btn:hover {
	    background-color: #fee50e;
		}
		
		.page-item.active .page-link {
	    z-index: 1;
	    color: #4e4c4c;
	    background-color: #fee00e;
	    border-color: #d6cece;
</style>
</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">
 		<br>
		<div class="page-header">
	       <h2><i class="far fa-check-square"></i> 영화퀴즈</h2>
	    </div>
		<br>	
		
		
   		<div class="qLogin">
		<p class="qltx">
		<span>${user.userId}님의 응모내역</span>
		<br>
		</p>
		<ul>
		
			<li><p>참여수<br>${totalCount}</p></li>
			<li><p>정답수<br>${winCount}</p></li>
			<li><p>정답률<br><fmt:formatNumber value="${winRate}" pattern=".00" /></p></li>
			<li><p>남은퀴즈<br>${leftQuiz}</p></li>
		</ul>
		  
		
	</div>		
	<form>
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
	  
	  	<c:set var="i" value="0" />
		 <c:forEach var="quiz" items="${list}">
		 <c:set var="i" value="${ i+1 }"/>
		<div id="header" name="headBox"> 
		<script type="text/javascript">
		var partFlag = ${quiz.partFlag}
		
		
			
		
		</script>
		<div class="jj"></div> 
		
		<div>
		<c:if test="${quiz.partFlag eq 1}">
		<span style="color: red;"> <i class="far fa-smile"></i> 참여완료 </span>
		</c:if>
		<p>
		<span style="font-weight: 600;">${quiz.quizStDate}의 퀴즈</span>
		</p>
		</div>
		<div><p style="font-weight: bold; font-size:18px; background-color:white;">${quiz.question}</p>
		<ul class="mqli" style="font-size:18px;">
		<li><input type="radio"  name="option" value="1" /><label for="quiz_2020010031_1">${quiz.optionFirst}</label></li>
		<li><input type="radio"  name="option" value="2" /><label for="quiz_2020010031_2">${quiz.optionSecond}</label></li>
		<li><input type="radio"  name="option" value="3" /><label for="quiz_2020010031_3">${quiz.optionThird}</label></li>
		<li><input type="radio"  name="option" value="4" /><label for="quiz_2020010031_4">${quiz.optionFourth}</label></li>
		</ul>

		<div class="text-center">
		<input type="hidden" name="quizNo" value="${quiz.quizNo}"/> 
		<input type="hidden" name="userNo" value="${user.userNo}"/> 
		<button name="qBtn" type="button" class="btn" >채점하기</button>

		</div>
		</div>
	 	</div>
		<br>
          </c:forEach>
	 	</form>
		

 
<div class="container text-center">
		 
		<c:if test="${!empty list}">
	<!-- pagination -->
	<div class="ticketingPagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4 ">
					  <ul class="pagination d-flex justify-content-center ">
		   				 <!--  <<== 좌측 nav -->
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><i class='fas fa-angle-left'></i></a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   				 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true"><i class='fas fa-angle-left'></i>   							</li>
						</c:if>
						
					    <!--  중앙  -->
						<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
							<c:if test="${ resultPage.currentPage == i }">
								<!--  현재 page 가르킬경우 : active -->
							    <li class="page-item active" aria-current="page">
      								<a class="page-link" href="javascript:Pagination('${ i }')">${ i }<span class="sr-only">(current)</span></a>
   								 </li>
							</c:if>	
							
							<c:if test="${ resultPage.currentPage != i}">	
								<li class="page-item">
									<a class="page-link" href="javascript:Pagination('${ i }')">${ i }</a>
								</li>
							</c:if>
						</c:forEach>
					     <!--  우측 nav==>> -->
					     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">						
					    	<li class="page-item disabled">
					    		<a class="page-link" href="#"><i class='fas fa-angle-right'></i></a>
    						</li>
					      </c:if>
					      <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					      	    <li class="page-item">
     							 <a class="page-link" href="javascript:Pagination('${resultPage.endUnitPage+1}') "><i class='fas fa-angle-right'></i></a>
    							</li>
						 </c:if>	
					  </ul><!-- end of pagination -->
					 </div><!-- end of middle col --> 
					 <div class="col-4"></div>
			  </div><!-- end of ticketingPagination -->
	<!--// pagination -->
</c:if>
		
</div>
</div>
	
	
</body>
</html>