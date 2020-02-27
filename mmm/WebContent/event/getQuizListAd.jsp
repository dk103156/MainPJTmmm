<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MMM</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


 <!-- google Fonts -->
 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



<script type="text/javascript">


	function fncGetList(currentPage) {
		console.log('fncGetList에 왔거든여');
		$("#currentPage").val(currentPage);
		console.log($("#currentPage").val());
		$("form").attr("method","POST").attr("action", "/event/getQuizListAd").submit();
	
		
	}
	
	
	$(function(){
	
		$(".getTranInfo td:nth-child(2)").on("click",function(){
			//alert("1번째 자식");
			var quizNo = $(this).children('#quizNo').val();
			console.log(quizNo);
			self.location="/event/getQuizAd?quizNo="+quizNo;	
		});
		
		
		$('#delBtn').on("click", function(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val){
				
				var checkArr = new Array();
				 $("input[class='chBox']:checked").each(function(){
					    checkArr.push($(this).attr("data-quizNo"));
					   });

				 console.log(checkArr)
				 
				 $.ajax({
					    url : "/event/json/deleteQuiz",
					    type : "post",
					    data : { chbox : checkArr },
					    success : function(result){
					    	if(result==1){
					    		alert('삭제완료')
					    	}else{
					    		alert('삭제실패')
					    	}
					     location.href = "/event/getQuizListAd";
					    }
					  });
			}
		
			
// 			var articleNo = ${article.articleNo};
// 			console.log(articleNo)
// 			self.location="/customer/deleteNotice?articleNo="+articleNo;
		});
		
	});
	
	
	
</script>

<style type="text/css">
		
		
	.table{
			font-size: 13px;
			float: none;
			margin: 0 auto;
		}		
	.checkBox {float:left; width:30px;}
	.checkBox input{width:16px; height:16px;}

	.container {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 1.2rem;
	}
	</style>
</head>

<body>
<jsp:include page="/layout/header.jsp" />
<div class="container">
 		<br>
		<div class="page-header" style="margin-top:30px;">
	      <span style="font-size:25px; font-weight:bold;"> <i class="far fa-check-square"></i> 퀴즈 관리</span>
	    </div>
		<br>	
	    
		    	<p class="text-primary">
		    		총  ${resultPage.totalCount} 개의 퀴즈가 있습니다
		    	
		    	</p>
		<br>	
     
	<form>
	
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
	  <input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두선택</label>
	  <button id="delBtn" class="btn btn-secondary write float:right" type="button">삭 &nbsp;제</button>
	  <script>
	  
	  $("#allCheck").click(function(){
		  var chk = $("#allCheck").prop("checked");
		  if(chk){
			  $(".chBox").prop("checked", true);
		  }else {
			  $(".chBox").prop("checked", false);
		  }
		  
	  });
	  
	  </script>
	  
	  
      <table class="table table-hover" >
        <thead>
          <tr>
            <th scope="col" align="center" style="width:25px;">번호</th>
            <th scope="col" align="left" style="width:25px;">문제</th>
            <th scope="col" align="left" style="width:25px;">정답</th>
            <th scope="col" align="left"  style="width:25px;">등록일시</th>
          </tr>
        </thead>
       
		<tbody class="getTranInfo">
		
		  <c:set var="i" value="0" />
		  <c:forEach var="quiz" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			
			<tr>
			
			 
			  <td align="left" id="quizNo" >
			  <input type="checkBox" class="chBox" name="chBox" data-quizNo = "${quiz.quizNo}" id="" />${ i }
			  <script>
			  $(".chBox").click(function(){
				  $("#allCheck").prop("checked", false);
			  });
			  </script>
			  </td>
			  <td align="left" id="" >${quiz.question}
			  	<input type="hidden" id="quizNo" value="${quiz.quizNo}"/>
			  </td>
			  
			  <td align="left" id="" >${quiz.answer}
			    <input type="hidden" id="answer" value="${quiz.answer}"/>
			  </td>
			  <td align="left" id="" >${quiz.qDate}
			  </td>
			
			</tr>
          </c:forEach>
        </tbody>
      </table>
 	</form>
	  

 
 
 
<div class="text-center">
		 
		 <nav>
		  <!-- 크기조절 :  pagination-lg pagination-sm-->
		  <ul class="pagination justify-content-center" >
		    
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
<jsp:include page="/layout/footer.jsp" />
</body>
</html>