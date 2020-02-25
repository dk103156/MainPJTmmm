<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">

<head>

	 <!-- Required meta tags -->
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	  
	  <!-- Bootstrap Extended Color -->
	  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
	  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
	
	    <!-- Optional JavaScript -->
	  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	  
	  <!--     Common Css -->
	  <link rel="stylesheet" href="/resources/css/product.css">
</head>
	  
<body id="body">

	<div class="container">
		<div class="row mx-0">
			<div class="purchaseHeader col-12 text-center">
			<br><br>
				<c:if test="${search.purchaseStatus eq 0 }">
				<h3  class="text-left"><span>구매 목록</span></h3>
				<hr style="background-color: #c0c0c0;">
				</c:if>
				
				<c:if test="${search.purchaseStatus eq 2 }">
				<h3  class="text-left"><span>구매 취소 목록</span></h3>
				<hr style="background-color: #c0c0c0;">
				</c:if>

			</div>
		</div>
		
		
		<div class="purchaseContentHeader row mx-0">
			<div class="purchaseNoHeader col-2">
				<span>구매번호</span>
			</div>
			<div class="purchaseListHeader col-4">
				<c:if test="${search.purchaseStatus eq 0 }">
					<span>구매한 목록</span>
				</c:if>
				
				<c:if test="${search.purchaseStatus eq 2 }">
					<span>취소 목록</span>
				</c:if>
			</div>
			<div class="purchaseStatusHeader col-1">
				<span>상태</span>
			</div>
			<div class="purchaseRegDateHeader col-3">
				<c:if test="${search.purchaseStatus eq 0 }">
					<span>구매한  날짜</span>
				</c:if>
				
				<c:if test="${search.purchaseStatus eq 2 }">
					<span>취소한 날짜</span>
				</c:if>
			</div>
			<div class="purchaseCancelHeader col-2">
			</div>
		</div>
		
		<hr>
		
		<div class="purchaseContent">
			<c:forEach var="i" items="${map.PurchaseList }">
				 <div class="row">
					<div class="purchaseNo col-2"><span><kbd>${i.purchaseNo }</kbd></span></div>
					<div class="purchaseList col-4"></div>
					<c:if test="${i.purchaseStatus eq 0 }">
						<div class="purchaseStatus col-1" style="overflow:auto; height:100px"><span>구매</span></div>
					</c:if>
					<c:if test="${i.purchaseStatus eq 2 }">
						<div class="purchaseStatus col-1" style="overflow:auto; height:100px"><span>취소</span></div>
					</c:if>	
					<c:if test="${i.purchaseStatus eq 0 }">
					 	<fmt:formatDate var="Month" value="${i.purchaseDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					 	<fmt:formatDate var="Day" value="${i.purchaseDate}" pattern="E"/>
						<div class="purchaseRegDate col-3"><span>${Month } &nbsp; (${Day })</span></div>
					</c:if>
					<c:if test="${i.purchaseStatus eq 2 }">
					 	<fmt:formatDate var="Month" value="${i.cancelDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					 	<fmt:formatDate var="Day" value="${i.cancelDate}" pattern="E"/>
						<div class="purchaseRegDate col-3"><span>${Month } &nbsp; (${Day })</span></div>					
					</c:if>
					<div class="purchaseCancel col-2">
					   	<form action="/payment/cancelPayment?purchaseNo=${i.purchaseNo}" method="post">
						</form>
					</div>
				</div>
				<hr>	
			</c:forEach>
		</div>
		
		
		<div class="purchaseContentFooter row">
			<div class="purchaseNoFooter col-2"><span></span></div>
			<div class="purchaseListFooter col-4"><span></span></div>
			<div class="purchaseStatusFooter col-1"><span></span></div>
			<div class="purchaseRegDateFooter col-3"><span></span></div>
			<div class="purchaseCancelFooter col-2"></div>
		</div>			
	

	  <br><br>
	  <div class="purchasePagination row">
	  		<div class="col-4"></div>
	  		<div class="col-4">
			  <ul class="pagination">
	  				 <!--  <<== 좌측 nav -->
	 				<c:if test="${ map.resultPage.currentPage <= map.resultPage.pageUnit }">
	 					    <li class="page-item disabled">
	  								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
									 </li>
	 				</c:if>
	 				<c:if test="${ map.resultPage.currentPage > map.resultPage.pageUnit }">
			   		<li class="page-item">
			   				 <a class="page-link" href="javascript:Pagination('${map.resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">Previous</a>
								</li>
				</c:if>
				
			    <!--  중앙  -->
				<c:forEach var="i"  begin="${map.resultPage.beginUnitPage}" end="${map.resultPage.endUnitPage}" step="1">
					<c:if test="${ map.resultPage.currentPage == i }">
						<!--  현재 page 가르킬경우 : active -->
					    <li class="page-item active" aria-current="page">
	   								<a class="page-link" href="javascript:Pagination('${ i }')">${ i }<span class="sr-only">(current)</span></a>
									 </li>
					</c:if>	
					
					<c:if test="${ map.resultPage.currentPage != i}">	
						<li class="page-item">
							<a class="page-link" href="javascript:Pagination('${ i }')">${ i }</a>
						</li>
					</c:if>
				</c:forEach>
			     <!--  우측 nav==>> -->
			     <c:if test="${ map.resultPage.endUnitPage >= map.resultPage.maxPage }">						
			    	<li class="page-item disabled">
			    		<a class="page-link" href="#">Next</a>
	 						</li>
			      </c:if>
			      <c:if test="${ map.resultPage.endUnitPage < map.resultPage.maxPage }">
			      	    <li class="page-item">
	  							 <a class="page-link" href="javascript:Pagination('${map.resultPage.endUnitPage+1}') ">Next</a>
	 							</li>
				 </c:if>	
			  </ul><!-- end of pagination -->
			 </div><!-- end of middle col --> 
			 <div class="col-4"></div>
			 <form id="pagination">
			 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
			 	<input type="hidden" id="purchaseStatus" name="purchaseStatus" value="${search.purchaseStatus }"/>
			 </form>
	  </div><!-- end of purchasePagination -->

	</div><!-- end of container -->

	<!-- Modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header" id="modalhead">
	        <h5 class="modal-title" id="exampleModalCenterTitle">구매 정보</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	        	
	        
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="purchaseListBtn"  class="btn" data-dismiss="modal">닫기</button>
<!-- 	      <button type="button" class="btn btn-primary">네</button>  -->	  
	      </div>
	    </div>
	  </div>
	</div>


<script>
$(function(){
	

	
	
});
$.ajaxSetup({async:false}); //전역 ajax 동기로
var purchaseNoList = new Array();
var purchaseProdNoList = new Array();
var purchaseQuantityList = new Array();
<c:forEach var='i' items='${map.PurchaseList }'>
	purchaseNoList.push('${i.purchaseNo}');
	purchaseProdNoList.push('${i.purchaseProductNo}');
	purchaseQuantityList.push('${i.purchaseProductQuantity}');
</c:forEach>

purchaseProdNoList.forEach( (x,y) => {

	x.split(",").forEach( (value,index) => {
			
		 $.get("/product/json/getProduct/"+value)
		 .done( value => {
				var prodName = value.product.prodName;
			
				
				var Element = "<div><span class='prodName'>"+prodName+"</span><span> x </span><span class='prodQuantity'></span></div>"
				
				$($("div.purchaseContent > div > div.purchaseList")[y]).append(Element);
				
		 })//end of ajax done
	}) // end of inner forEach
}); // end of outer forEach

purchaseQuantityList.forEach( (x,y) => {
	//console.log("outer : "+y)
	x.split(",").forEach( (value,index) => {
			
		 	//console.log("inner : "+index)
			$($($("div.purchaseList")[y]).find("div > span.prodQuantity")[index]).text(value);
	});
}); // end of outer for Each

<c:if test='${search.purchaseStatus eq 0}'>
	$("div.purchaseContent > div > div.purchaseList").on("click",function(){
		$("div.modal-body div.row").empty()
		var purchaseNo=$(this).parent().find("div.purchaseNo span > kbd").text()
	    		 $.ajax({
				  type: "POST",
				  url: "/purchase/json/getInventoryList/",
				  data: JSON.stringify({ inventoryPurchaseNo : purchaseNo, inventoryStatus : '2', inventoryProdNo : '0'}),
				  dataType : "json",
			      headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
			      },
			 }).done( data =>{
				 console.log(data)
				 data.forEach( (Inventory,index) => {
					 	var inventoryProdNo = Inventory.inventoryProdNo;
		    			 $.ajax({
						  type: "GET",
						  url: "/product/json/getProduct/"+inventoryProdNo,
						  data: JSON.stringify({ }),
						  dataType : "json",
					      headers: { 
					        "Accept" : "application/json",
					        "Content-Type": "application/json"
					      },
					      
		    			 }).done( value => {
							 var prodName = value.product.prodName
							 if(Inventory.inventoryStatus==1){
								 var Element = 	"<div><strong><div class='prodName col-12'><span>"+prodName+"</span></div></strong>";
							 	 Element += "<strong><div class='prodPinNo col-12'><span style='color: red; opacity:0.5;'>"+Inventory.inventoryProdPinNo+"</span></div></strong></div>"						 
							 }else{
								 var Element = 	"<div><strong><div class='prodName col-12'><span>"+prodName+"</span></div></strong>";
							 	 Element += "<strong><div class='prodPinNo col-12'><span>"+Inventory.inventoryProdPinNo+"</span></div></strong></div>"						 
							 }
							 
						 	$("div.modal-body div.row").append(Element);
					 	 
		    	    })//end of ajax Done
				 });//end of forEach
			 })//end of ajax done
			 
			$("#modal").modal("show");
	});

	
	purchaseNoList.forEach( (value,index) => {
		var payObjectFlag = false
		 $.getJSON("/payment/json/getPaymentbyPurchaseNo/"+value)
		 .done(data => {
			 try{
				if(data.payment.payObjectFlag==2 || data.payment.payObjectFlag==0){
					payObjectFlag = true
				}
			 }catch(error){
				 
			 }
		 })
		 $.ajax({
			  type: "POST",
			  url: "/purchase/json/getInventoryList/",
			  data: JSON.stringify({ inventoryPurchaseNo : value, inventoryStatus : '2', inventoryProdNo : '0'}),
			  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		 }).done(data => {
			
			 //받아온 인벤토리 리스트를 배열로 돌려 한 구매 내역에 해당하는 핀 넘버에 사용한것이 있는지 없는지 체크한다.
			 /* 나중에 꼭 결제 정보도 추가해주자 */ /* 나중에 꼭 결제 정보도 추가해주자 */
			 /* 나중에 꼭 결제 정보도 추가해주자 */ /* 나중에 꼭 결제 정보도 추가해주자 */
			 var useFlag=false
			 data.forEach( (value,sequence) => {
				
				 if(value.inventoryStatus==1){
					 useFlag=true
				 }
			 });
			 
			 if(!useFlag){
				 
			//	 var Element ="<img class='cancelButton' src='/resources/image/cancel.PNG' width=95>"
				 
				 var Element ="<button type='button' class='btn btn-outline-warning'>CANCEL</button>"
				 
				 $($("div.purchaseCancel")[index]).append(Element);
				 
				 $("div:nth-child("+(parseInt(index)+1)+") > div.purchaseCancel button.btn.btn-outline-warning").on("click",function(){
					 
					 $(this).prev().submit();
				 });
			 }
		 })	
		
	})//end of forEach
</c:if>

function Pagination(currentPage) {
	
	$("#currentPage").val(currentPage)
	//$("#pagination").attr("method","POST").attr("action", "/purchase/getPurchaseList").submit();
	$("#plusPage").load("getPurchaseList",$("#currentPage").serialize());
	
	
}
</script> 	
</body>
</html>