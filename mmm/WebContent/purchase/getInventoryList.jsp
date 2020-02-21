<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
  
<title>Insert title here</title>

<style>


</style>
</head>
<body>

	<div class="container">
		<div class="row mx-0">
			<div class="inventoryHeader col-12 text-center">
				<span>내 인벤토리 목록</span>
			</div>
		</div>
		
		<hr>
		
		<div class="inventoryContentHeader row mx-0">
			<div class="prodNoHeader col-2"><span>상품번호</span></div>
			<div class="prodNameHeader col-6"><span>상품명</span></div>
			<div class="prodQuantityHeader col-2"><span>소지수(사용가능)</span></div>
		</div>
		
		<hr>
		
		<div class="inventoryContent">
			<c:forEach var="i" items="${map.productList }">
				<div class='cartContentIn row mx-0 mb-2'>
					<div class="prodNo col-2"><span><kbd>${i.prodNo }</kbd></span></div>
					<div class="prodName col-6"><span><img src="../resources/image/${ i.prodImage}" width=150></span><span>${i.prodName }</span></div>
					<div class="prodQuantity col-4">
						<span></span>
						<button type="button" class="btn btn-primary modalButton" data-toggle="modal" data-target="#exampleModalCenter">
		  					 상세보기
						</button>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="inventoryContentFooter row">
			<div class="col-2"><span></span></div>
			<div class="col-6"><span></span></div>
			<div class="col-6"><span></span></div>
		</div>			
	</div>





<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">상품 핀 번호</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	
<script>
$(function(){
	
	var productList= new Array();
	var productQuantityList = new Array();
	//console.log ('${map }');
	
	<c:forEach var='i' items='${map.productList }'>
	productList.push('${i.prodNo}');
	</c:forEach>
	
	<c:forEach var='i' items='${map.productQuantityList }'>
	productQuantityList.push('${i}');
	</c:forEach>	

	//console.log(productList)
	//console.log(productQuantityList)
	
	productList.forEach( (value,index) =>{
		//console.log(value)
		var quantity = productQuantityList[index];
		$($("div.prodQuantity > span")[index]).text(quantity)
		  
		 $.ajax({
		  type: "POST",
		  url: "json/getInventoryList/",
		  data: JSON.stringify({inventoryProdNo : value, inventoryStatus : "0", inventoryPurchaseNo : "0" }),
		  dataType : "json",
	      headers: { 
	        "Accept" : "application/json",
	        "Content-Type": "application/json"
	      },
	  	  }).done( x=> {
	  		  
			  		$($("button.modalButton")[index]).on("click",function(){
			  			$("div.modal-body").empty();
						x.forEach( (value,index) => {
							var inventoryNo = value.inventoryNo;
							var pinNo =value.inventoryProdPinNo;
							var Element ="<div><div>"+pinNo+"</div><input type='hidden' value='"+inventoryNo+"'></div>";
							$("div.modal-body").append(Element);
						});
											
						
					});
	  		  
	  	  })
		

	})
	

});

</script>
</body>
</html>