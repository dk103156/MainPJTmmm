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
		$("#currentPage").val(currentPage);
		console.log($("#currentPage").val());
		$("form").attr("method","POST").attr("action", "/customer/getAskList").submit();
	}
	
	
	$(function(){
	
		$(document).on("click",".getTranInfo td:nth-child(2)" ,function() { //로드 당시에 없었던 요소들도 이벤트 걸어줌
		
			console.log("눌렀어");
			console.log($($($(this).parent().parent()).find('.row')).last().html());
			var articleNo = $(this).parent().find('#articleNo').val();
			getAsk(articleNo)
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

	<div class="page-header text-secondary">
	       <h3>고객센터</h3>
	       <hr>
	    </div>
	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
		<button type="button" name="ask" class="btn btn-outline-secondary active">자주찾는질문</button>
	    <button type="button" name="contact" class="btn btn-outline-secondary">일대일문의</button>
	    <button type="button" name="notice" class="btn btn-outline-secondary">공지사항</button>
	  </div>
	</div>


	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
	    <button type="button" class="btn btn-default all">전체</button>
	    <button type="button" class="btn btn-default tick" name="">예매&매표</button>
	    <button type="button" class="btn btn-default store">스토어</button>
	    <button type="button" class="btn btn-default pay">결제</button>
	    <button type="button" class="btn btn-default disc">할인혜택</button>
	    <button type="button" class="btn btn-default home">홈페이지</button>
	    <button type="button" class="btn btn-default event">이벤트</button>
	  </div>
	</div>
	
	
</div>


<br>

<div class="container bb">
	<div><p class="text-dark">
	전체  ${resultPage.totalCount} 건 </p>
	</div>
      <table class="table table-hover table-bordered table-sm" >
        <thead class="table-active">
          <tr class="row">
            <th  class="col-sm-2"align="center">구분</th>
            <th  class="col-sm-10" align="left" >질문</th>
          </tr>
        </thead>
		<tbody class="getTranInfo">
		  <c:set var="i" value="0" />
		  <c:forEach var="ask" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr class="row">
			 
			  <td class="col-sm-2" align="left" >
			  <c:if test="${ask.category==1}">예매/매표</c:if>
			  <c:if test="${ask.category==2}">스토어</c:if>
			  <c:if test="${ask.category==3}">결제</c:if>
			  <c:if test="${ask.category==4}">할인혜택</c:if>
			  <c:if test="${ask.category==5}">홈페이지</c:if>
			  <c:if test="${ask.category==6}">이벤트</c:if>
			  
	  	    	<input type="hidden" id="articleNo" value="${ask.articleNo}"/>
			  </td>
			  <td class="col-sm-10" align="left" id="" >  ${ask.articleTitle} 
			  </td>
			</tr>
			<tr class="row" id="${ask.articleNo}">
			</tr>
          </c:forEach>
        </tbody>
      </table>
			  <div class="hee"></div>
       </div>


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
					 <form>
					 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
					 	<input type="hidden" id="category" name="category" value="${search.category}"/></form>
			  </div><!-- end of ticketingPagination -->
			  

<script>

	$(function(){
		
		$("div > div> div > button.all").on("click", function(){
			$("#category").val(0);  //예매/매표 카테고리
			category(0)
		}); 
		
		$("div > div> div > button.tick").on("click", function(){
			$("#category").val(1);  //예매/매표 카테고리
			category(1)
		}); 

		$("div > div> div > button.store").on("click", function(){
			$("#category").val(2); //스토어
			category(2);
		});
		
		$("div > div> div > button.pay").on("click", function(){

			$("#category").val(3); //결제
			category(3);
		});
		
		$("div > div> div > button.disc").on("click", function(){

			$("#category").val(4); //할인혜택
			category(4);
		});
		
		$("div > div> div > button.home").on("click", function(){

			$("#category").val(5); //홈페이지
			category(5);
		});
		
		$("div > div> div > button.event").on("click", function(){

			$("#category").val(6); //이벤트
			category(6);
		});
		
		
		
	}); //end of function

	function getAsk(data) {
		
		var datas = JSON.stringify ({
			articleNo : new String(data) //articleNo는 숫자니까..
		})
			console.log(datas)
		
		
		ajaxPromise("/customer/json/getAsk", datas).then(
			data=> {
				
				var resultData = data;
				
				console.log(resultData) //
				console.log(data.article.articleNo) //
				console.log(data.article.articleTitle)
				console.log(data.article.content)
			
				$(".hee").empty();
				
				var html ="<div>"+ data.article.content+"</div>"
			
				//$(".hee").append(html);
				$("#"+data.article.articleNo).html(html)
				
				
			}
		
		
		)
		
	}
	
	function category(data) {
		
		var datas = JSON.stringify({
			currentPage : "1",
			category : new String(data),
		})
		
		ajaxPromise("/customer/json/getAskList", datas).then(
			data=> {
				console.log(data)
				$(".bb").empty();
				
				if(data.askList.length!=0){
					
					var html ="	<div><p class='text-dark'>전체  "+ data.resultPage.totalCount+" 건 </p></div>"
						html +="<div class='row'><table class='table table-hover table-bordered table-sm'>"
			        	html +="<thead class='table-active'><tr class='row'>"		
			         	html +="<th class='col-sm-2' align='center'>구분</th><th class='col-sm-10' align='left'>질문</th></tr></thead>"
						html +="<tbody class='getTranInfo'>"
				
					for (var i = 0; i < data.askList.length; i++) {
						   
						html +="<tr class='row'><td class='col-sm-2' align='left'>";
						
						if (data.askList[i].category==1) {
							html += "예매/매표";
						}else if (data.askList[i].category==2) {
							html += "스토어";
						}else if (data.askList[i].category==3) {
							html += "결제";
						}else if (data.askList[i].category==4) {
							html += "할인혜택";
						}else if (data.askList[i].category==5) {
							html += "홈페이지";
						}else if (data.askList[i].category==6) {
							html += "이벤트";
						}
						
						html +="<input type='hidden' id='articleNo' value='"+data.askList[i].articleNo+"'/>"
						html +="</td><td class='col-sm-10' align='left'>"+data.askList[i].articleTitle  
						html +="</td></tr>"
					
					}
					
					html += "</tbody></table></div>"
					
							$(".bb").append(html);
					
					
							
				} //end of for
				
				
				//페이지네이션 추가
				$("div.ticketingPagination.row").empty();
				
				Element = "<div class='col-4'></div>"
		  		Element +="<div class='col-4'>"
				Element +="<ul class='pagination'>"
	   			if(data.resultPage.currentPage <= data.resultPage.pageUnit){
	   				Element +="<li class='page-item disabled'>"
	   				Element +="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>Previous</a>"
	   				Element +="</li>"
	   			}else if(data.resultPage.currentPage > data.resultPage.pageUnit){
	   				Element +="<li class='page-item'>"
	   				Element +="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.beginUnitPage)-1)+")' tabindex='-1' aria-disabled='true'>Previous</a>"
	   				Element +="</li>"
	   			}
				
	  			for(var i=data.resultPage.beginUnitPage; i<=data.resultPage.endUnitPage; i++){
	  				if(data.resultPage.currentPage==i){
	  					Element+="<li class='page-item active' aria-current='page'>"
	  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"<span class='sr-only'>(current)</span></a>"
	  					Element+="</li>"
	  				}else{
	  					Element+="<li class='page-item'>";
	  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"</a>"
	  					Element+="</li>"
	  				}
	  				
	  			}//end of for
				
	  			if(data.resultPage.endUnitPage >= data.resultPage.maxPage){
	  				Element+="<li class='page-item disabled'>"
	  				Element+="<a class='page-link' href='#'>Next</a>"
	  				Element+="</li>"
	  			}else if(data.resultPage.endUnitPage < data.resultPage.maxPage){
	  				Element+="<li class='page-item'>"
	  				Element+="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.endUnitPage)+1)+") '>Next</a>"
	  				Element+="</li>"
	  			}
				
	  			Element+= "</ul>"
				Element+= "</div>"
				Element+= "<div class='col-4'></div>"
				Element+= "<form>"
				Element+= "<input type='hidden' id='currentPage' name='currentPage' value=''/>"
				Element+= "<input type='hidden' id='category' name='category' value='"+data.search.category+"'/>"
				Element+= "</form>"
				
				$("div.ticketingPagination").append(Element);
				
				$("#searchCondition").val(data.search.category);
				
				
			} //end of arrow function	
		
		); //end of then
		
		
	} 
	
	function ajaxPromise(url, datas) {
		return new Promise(function (resolve, reject) {
			
			$.ajax({
				type: "POST",
				url: url,				
				data: datas,
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json",
				},
				success : function(result, status) {
					//데이터를 받으면 resolve()호출
					resolve(result);
					console.log(status)
				}//end of success
			
			})//end of ajax
			
		}) //end of Promise
		
	}//end of function - ajaxPromise

</script>
</body>



</html>