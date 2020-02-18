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


	function Pagination(currentPage) {
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
	
		span.round.on.red {
		text-align: center;
	    border: 2px solid #e71a0f;
	    background-color: #e71a0f;
	    color: #ffffff;
	}
	
</style>
</head>
<body>


<div class="container">

	<div class="page-header text-dark">
	       <h3>관리자 문의내역</h3>
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
	<div><p class="text-dark">
	전체  ${resultPage.totalCount} 건 </p>
	</div>
<!-- 		<div class="row"> -->
	<form>
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
      <table class="table table-hover table-bordered table-sm" >
        <thead class="table-active">
          <tr class="row">
            <th class="col-sm-1" align="center">번호</th>
            <th class="col-sm-5" align="left" >제목</th>
            <th class="col-sm-3"  align="left">등록일시</th>
            <th class="col-sm-1" align="left">상태</th>
            <th class="col-sm-2" align="left">글쓴이</th>
          </tr>
        </thead> 
        
		<tbody class="getTranInfo">
		  <c:set var="i" value="0" />
		  <c:forEach var="notice" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr class="row">
			  <td  class="col-sm-1" align="left" >${ i }
	  	    	<input type="hidden" id="articleNo" value="${notice.articleNo}"/>
			  </td>
			  <td class="col-sm-5" align="left" id="" >  ${notice.articleTitle} 
			  </td>
			  <td class="col-sm-3" align="left" id="" >  ${notice.articleDate}
				</td>
			  <td class="col-sm-1" align="center" id="" > 
			  <span class="btn btn-danger btn-sm"><small>
			  <c:if test="${notice.qnaStatus ne null && notice.qnaStatus eq 0}">답변전</c:if>
			  <c:if test="${notice.qnaStatus ne null && notice.qnaStatus eq 1}">답변완료</c:if>
			 	</small>
			 	</span>  
				</td>
				 <td class="col-sm-2" align="left" id="" >${notice.userId}
				</td>
			</tr>
          </c:forEach>
        </tbody>
      </table>
 	</form>
          </div>
<!-- 	  </div> -->

<div class="ticketingPagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4">
					  <ul class="pagination">
		   				 <!--  <<== 좌측 nav -->
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   				 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">Previous</a>
   							</li>
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
					    		<a class="page-link" href="#">Next</a>
    						</li>
					      </c:if>
					      <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					      	    <li class="page-item">
     							 <a class="page-link" href="javascript:Pagination('${resultPage.endUnitPage+1}') ">Next</a>
    							</li>
						 </c:if>	
					  </ul><!-- end of pagination -->
					 </div><!-- end of middle col --> 
					 <div class="col-4"></div>
			  </div><!-- end of ticketingPagination -->
</body>
</html>