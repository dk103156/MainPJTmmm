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
 
 <title>getQuizList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>



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
			
			//이미참여했을때
			if(JSONData.result==2){
				
				alert('이미 참여했다 얘야...');
				self.location = "/event/getQuizList?userNo="+userNo;
				
			}else{
				
				if(JSONData.result==0){
					alert('정답이다')
					$("form").attr("method","POST").attr("action", "/event/addWinQuiz").submit();
				}else if(JSONData.result==1){
					alert('정답이 아니다');
					$("form").attr("method","POST").attr("action", "/event/addLoseQuiz").submit();				
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


 	function fncGetList(currentPage) {
 		console.log('fncGetList에 왔거든여');
 		$("#currentPage").val(currentPage);
		console.log($('#currentPage').val());

	$("form").attr("method","POST").attr("action", "/event/getQuizList").submit();
	}
	
	
// 	$(function(){
		
			
// 			$('button[name="qBtn"]').on("click", function(){
				
// 				alert('qBtn버튼이 클릭됨');
				
// 				var choice = $('input[name="option"]:checked').val();
				
// 				if(choice==null){
// 					alert('답을 체크하세요!')
// 					return;
// 				}
				
// 				var answer = $(this).prev().val();
// // 				rent().find('.answer').eq().val();

// 				console.log('choice'+choice);
// 		        console.log('answer'+answer);
			
				
// 			$.ajax({
					
// 					url: "/event/json/checkQuiz",
// 					method: "POST",
// 					data: JSON.stringify({
// 						userNo  :  $("#un").val(),
// 						quizNo : $("#qn").val(),
// 						}),
// 					dataType : "json",
// 					headers : {
// 						"Accept" : "application/json",
// 						"Content-Type" : "application/json"
// 					},
// 					success : function(JSONData, status){
						
// 						console.log(status);
						
						
// 						console.log(JSONData.result);
// 						if(JSONData.result==0){
// 							if(choice==answer){
// 							 alert('정답입니다')	
// 							$("form").attr("method","POST").attr("action", "/event/addWinQuiz").submit();

// 							}else{
// 							alert('틀렸거든요')
// 							$("form").attr("method","POST").attr("action", "/event/addLoseQuiz").submit();
// 							}
// 						}else{
// 							alert('이미 참여한 퀴즈입니다')
// 						}
// 					}	
					
					
// 				})
// 			});
	
		
// 	});
	
</script>

<style>
     #header{ 
      	width:808px;
      	height:267px;
      	padding: 20px;
        margin: 10px auto;
        border: 1px solid #bcbcbc;
        }
        
       .qLogin ul{
   		 position: absolute;
	  	 right: 14px;
	   	 top: 11px;
		}
		
		.qLogin ul li {
	  	  float: left;
	 	  padding-left: 12px;  
         }
         
		.qLogin ul li P{
	 	 padding: 25px 56px 22px;
	     background: #fff;
	     text-align: center;
	     line-height: 19px;
	     font-size: 14px;
		}
		
		.qLogin ul li p span{
	    display: block;
    	padding-bottom: 11px;
    	font-weight: 650;
		}
		
        p{
        display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
        }
        
        ul, ol{
        list-style: none;
        } 
        
          .qLogin{
      	 width:808px;
     	 height: 119px;
     	 background: #f7dfdc;
         margin: 10px auto;
         position: relative;
         border: 1px solid #bcbcbc;
	   }
    
       .qLogin .qltx{
        padding-top: 37px;
	    padding-left: 29px;
	    font-size: 18px;
	    color: #454545;
	    line-height: 20px;
	    font-weight: 650;
	  }
	  
</style>
</head>
<body>

<div class="container">
 		<br>
		<div class="page-header text-secondary">
	       <h3>퀴즈 목록조회</h3>
	    </div>
		<br>	
		
		
   		<div class="qLogin">
		<p class="qltx">
		<span>${user.userId}님의 응모내역</span>
		<br>
		</p>
		<ul>
			<li><p>참여수:${totalCount}</p></li>
			<li><p>정답수: ${winCount}</p></li>
			<li><p>정답률:  <fmt:formatNumber value="${winRate}" pattern=".00" /></p></li>
		</ul>
		  
		
	</div>		
	<form>
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
	  
	  	<c:set var="i" value="0" />
		 <c:forEach var="quiz" items="${list}">
		 <c:set var="i" value="${ i+1 }"/>
		<div id="header"> 
		  <div><p>
		${quiz.quizStDate}의 퀴즈
		</p>
		</div>
		  
		<div><p>${quiz.question}</p>
		<ul class="mqli">
		<li><input type="radio"  name="option" value="1" /><label for="quiz_2020010031_1">${quiz.optionFirst}</label></li>
		<li><input type="radio"  name="option" value="2" /><label for="quiz_2020010031_2">${quiz.optionSecond}</label></li>
		<li><input type="radio"  name="option" value="3" /><label for="quiz_2020010031_3">${quiz.optionThird}</label></li>
		<li><input type="radio"  name="option" value="4" /><label for="quiz_2020010031_4">${quiz.optionFourth}</label></li>
		</ul>

		<div class="text-center">
		<input type="hidden" name="quizNo" value="${quiz.quizNo}"/> 
		<input type="hidden" name="userNo" value="${user.userNo}"/> 
		<button name="qBtn" type="button" class="btn btn-outline-primary" >퀴즈풀기</button>

		</div>
		</div>
	 	</div>
		<br>
          </c:forEach>
	 	</form>
		

 
<div class="container text-center">
		 
		 <nav>
		  <!-- 크기조절 :  pagination-lg pagination-sm-->
		  <ul class="pagination" >
		    
		    <!--  <<== 좌측 nav -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li>
			</c:if>
			<li>
		      <a href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <!--  중앙  -->
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				
				<c:if test="${ resultPage.currentPage == i }">
					<!--  현재 page 가르킬경우 : active -->
				    <li class="active">
				    	<a href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ resultPage.currentPage != i}">	
					<li>
						<a href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <!--  우측 nav==>> -->
		     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		  		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li>
			</c:if>
			<li>
		      <a href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
</div>
</div>
	
	
</body>
</html>