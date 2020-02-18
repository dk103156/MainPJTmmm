<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 
 <title>getPreviewListAd</title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script type="text/javascript">


	function fncGetList(currentPage) {
		
		console.log('fncGetList에 왔거든여');
		
		$("#currentPage").val(currentPage);
		console.log($('#currentPage').val());
		
		$("form").attr("method","POST").attr("action", "/event/getPreviewListAd").submit();
		
	}
	
	
	$(function(){
		
		
		
		
		$(".getTranInfo td:nth-child(2)").on("click",function(){
			var previewNo = $(this).children('#previewNo').val();
			console.log(previewNo);
			self.location="/event/getPreviewAd?previewNo="+previewNo;	
		});
		
	});
	
</script>



</head>
<body>

<div class="container">
 		<br>
		<div class="page-header text-secondary">
	       <h3>시사회이벤트 목록조회</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		총  ${resultPage.totalCount} 개의 시사회 이벤트가 있습니다
		    	</p>
		    </div>
	    	</div>
		<br>	
		
		<form>
		  <input type="hidden" id="currentPage" name="currentPage" value=""/>
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">번호</th>
            <th align="left" >시사회 이름</th>
            <th align="left">당첨인원수</th>
            <th align="left">당첨발표일</th>
            <th align="left">종료일자</th>
            <th align="left">진행상태</th>
          </tr>
        </thead>
       
		<tbody class="getTranInfo">
		
		  
		  <c:set var="i" value="0" />
		  <c:forEach var="preview" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr>
			 
			  <td class="col-sm-1"  align="left" id="previewNo" >${ i }
			  </td>
			  <td class="col-sm-4"  align="left" id="" >${preview.previewName}
			  	<input type="hidden" id="previewNo" value="${preview.previewNo}"/>
			  </td>
			  
			  <td class="col-sm-2" align="left" >${preview.winnerCount}
			  </td>
			  <td class="col-sm-2" align="left" id="" >${preview.winDate}
			  </td>
			  <td class="col-sm-2" align="left" id="" >${preview.preEdDate}
			  </td>
			  <td  class="col-sm-1" align="left" id="" >
				  <c:if test="${preview.previewFlag eq '진행중'}">
			     <span class="btn btn-warning btn-sm"><small>진행중</small></span></c:if>
			     
			     <c:if test="${preview.previewFlag eq '마감'}">
			     <span class="btn btn-dark btn-sm"><small>마감</small></span></c:if>
				  
				
			  </td>
			</tr>
          </c:forEach>
    
        </tbody>
      
      </table>
   		</form>
	  
 </div>

 
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