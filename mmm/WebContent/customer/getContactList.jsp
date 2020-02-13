<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


<script type="text/javascript">


	function fncGetList(currentPage) {
		console.log('fncGetList에 왔거든여');
		$("#currentPage").val(currentPage);
		console.log($("#currentPage").val());
		$("form").attr("method","POST").attr("action", "/customer/getContactList").submit();
	
		
	}
	
	
	$(function(){
	
		$(".getTranInfo td:nth-child(2)").on("click",function(){
			alert("눌렀어");
			var articleNo = $(this).parent().find('#articleNo').val();
			console.log(articleNo);
			self.location="/customer/getContact?articleNo="+articleNo;	
		});
		
		$("button[name='ask']").on("click", function(){
			self.location="/customer/getAskList";
		});
		
		$("button[name='notice']").on("click", function(){
			self.location="/customer/getNoticeList";
		});
		
		$("button[name='contact']").on("click", function(){
			self.location="/customer/addContact";
		});
	});
	
</script>

<style type="text/css">
	
		@media (min-width: 768px) {
	 	 .container {
	     width: 750px;
	  }
	}
	
		@media (min-width: 992px) {
		 .container {
	     width: 940px;
	  }
	}
	
</style>
</head>
<body>


<div class="container">

	<div class="page-header text-dark">
	       <h3>문의내역</h3>
	       <hr>
	    </div>
	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
	     <button type="button" name="ask" class="btn btn-outline-secondary">자주찾는질문</button>
	    <button type="button" name="contact" class="btn btn-outline-secondary active">일대일문의</button>
	    <button type="button" name="notice" class="btn btn-outline-secondary ">공지사항</button>
	  </div>
	</div>

</div>
<br>

<div class="container">
<!-- 		<div class="row"> -->
	<div><p class="text-dark">
	전체  ${resultPage.totalCount} 건 </p>
	</div>
	<form>
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
      <table class="table table-hover table-bordered table-sm" >
        <thead class="table-active">
          <tr>
            <th align="center">번호</th>
            <th align="left" >제목</th>
            <th  align="left">등록일시</th>
            <th align="left">상태</th>
          </tr>
        </thead>
       
		<tbody class="getTranInfo">
		  <c:set var="i" value="0" />
		  <c:forEach var="notice" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr>
			 
			  <td class="" align="left" >${ i }
	  	    	<input type="hidden" id="articleNo" value="${notice.articleNo}"/>
			  </td>
			  <td  align="left" id="" >  ${notice.articleTitle} 
			  </td>
			  <td  align="left" id="" >  ${notice.articleDate}
				</td>
			  <td align="left" id="" > 
			  <c:if test=" ${notice.qnaStatus==0}">답변전</c:if>
			  <c:if test=" ${notice.qnaStatus==1}">답변완료</c:if>
				</td>
			</tr>
          </c:forEach>
        </tbody>
      </table>
 	</form>
          </div>
<!-- 	  </div> -->

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
</body>
</html>