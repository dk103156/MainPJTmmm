<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    

    
<!DOCTYPE html>
<html>
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
			<div class="cartHeader col-12 text-center">
				<span>장바구니 목록</span>
			</div>
		</div>
		
		<hr>
		
		<div class="cartContentHeader row mx-0">
			<div class="prodNoHeader col-2"><span>상품번호</span></div>
			<div class="prodNameHeader col-6"><span>상품명</span></div>
			<div class="prodPriceHeader col-2"><span>4500</span></div>
			<div class="prodQuantityHeader col-2"><span>수량</span></div>
		</div>
		
		<hr>
		
		<div class="cartContent">
		
				
		</div>
		
		<div class="cartContentFooter row">
			<div class="col-2"><span></span></div>
			<div class="col-6"><span></span></div>
			<div class="fianlPrice col-2">
				<span>최종가격</span><br>
				<input name="totalPrice" type="text" readonly><br>
			</div>			
			<div class="col-2"><span></span>
				<button id="toPayment" type="button" class="btn btn-dark">결제하기</button>
			</div>
		</div>
	</div>
	
	
<form id="finalData">
	<input name="purchaseProductNo" type="hidden" value ="">
	<input name="purchaseProductQuantity" type="hidden" value="">
	<input name="purchasePrice" type="hidden" value= "">
</form> 
	
<script>
$(function(){
	
});

	var prodNoList = new Array();	//상품 번호 
	var prodNameList = new Array();
	var prodQuantityList = new Array();	// 상품 갯수
	var prodPriceList = new Array();
	var prodImageList = new Array();
	<c:forEach var='i' items='${cartList }'>
		prodNoList.push('${i.cartProdNo}');
		prodQuantityList.push('${i.cartProdQuantity}')	
	</c:forEach>
	prodNoList.sort( function(a,b) { return a - b});
	prodNoList.forEach( (x) => {
		
			$.get('/product/json/getProduct/'+x)
			.done( y => {
				
				prodNameList.push(y.product.prodName)
				prodPriceList.push(y.product.prodPrice)
				prodImageList.push(y.product.prodImage)
				
			})

	});
	
	setTimeout(function(){
		//console.log(prodNoList)
		//console.log(prodNameList)
		//console.log(prodQuantityList)
		//console.log(prodPriceList);
		//console.log(prodImageList)		
	prodNoList.forEach( (x,i) => {
	
		var Element = "<div class='cartContentIn row mx-0 mb-2'>"
			Element+= "<div class='prodNo col-2'><span><kbd>"+prodNoList[i]+"</kbd></span></div>"
			Element+= "<div class='prodName col-6'>"
			Element+= "<span><img src='../resources/image/"+prodImageList[i]+"' width=150></span>"
			Element+= "<span>"+prodNameList[i]+"</span>"
			Element+= "</div>"
			Element+= "<div class='prodPrice col-2'><span><input name='prodPrice' type='text' initialValue='"+prodPriceList[i]+"'value='"+prodPriceList[i]+"' readonly> 원</span></div>"
			Element+= "<div class='prodQuantity col-2'><span><input type='number' value='"+prodQuantityList[i]+"' min='1' step='1' max='99'> 개</span></div>" 
			Element+= "</div>"		
			console.log(Element)
			
		$("div.cartContent").append(Element);	
	})
	
	$("input[type=number]").on("change",function(){
		
		var index = $("input[type=number]").index( $(this) )
		var price = parseInt( $($("input[type=text]")[index]).attr('initialValue') );
		var quantity = $(this).val()
		$($("input[type=text]")[index]).val( price * quantity );
		
		var sum=0;
		$("input[name=prodPrice]").each( x => {
			sum += parseInt( $($("input[name=prodPrice]")[x]).val() )
		})
		
		$("input[name=totalPrice]").val(sum)
		
	});
		
	$("#toPayment").on("click",function(){
		
		var finalPrice = $("div.fianlPrice > input[type=text]").val() //최종 가격
		var finalProductNo ="";
		var finalQuantity = "";
		$("div.prodNo > span > kbd").each( x => {
			//console.log ( $($("div.prodNo > span > kbd")[x]).text() )
			finalProductNo+= $($("div.prodNo > span > kbd")[x]).text()+","
		})
		finalProductNo = finalProductNo.substring(0,finalProductNo.length-1);
		//console.log(finalProductNo)
		
		$("div.prodQuantity > span > input[type=number]").each( x => {
			
			finalQuantity+= $($("div.prodQuantity > span > input[type=number]")[x]).val()+",";
		})
		
		finalQuantity = finalQuantity.substring(0,finalQuantity.length-1);
		//console.log(finalQuantity)
		$("input[name=purchaseProductNo]").val(finalProductNo)
		$("input[name=purchaseProductQuantity]").val(finalQuantity)
		$("input[name=purchasePrice]").val(finalPrice)
		
		$("form#finalData").attr("action","/purchase/addPurchase").attr("method","POST").submit();
	});	
	
	
	},50)

</script>
</body>
</html>