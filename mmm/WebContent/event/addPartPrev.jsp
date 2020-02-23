<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 
 <title>getPreviewList</title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">

	$(function(){
		
		$('#updateBtn').on('click', function(){
			
			self.location="/user/getUser";
			
		})
		
		$('#applyBtn').on('click', function(){
			
			
			console.log('응모하기버튼눌렀어요')
			console.log('userNo  : '+ $("#un").val());
			console.log('previewNo  : '+ $("#pn").val());
			if($("#un").val()==0){
				return;
			}
			if($("#pn").val()==null){
				return;
			}
			
			$.ajax({
				
				url: "/event/json/checkPart",
				method: "POST",
				data: JSON.stringify({
					userNo  :  $("#un").val(),
					previewNo : $("#pn").val(),
					}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
					alert(status);
					console.log(JSONData.result);
					if(JSONData.result==0){
						$("form").attr("method","POST").attr("action", "/event/addPartPrev").submit();
						alert('응모완료했습니다');
					}else{
						alert('이미 응모한 이벤트입니다')
					}
				}	
				
				
			})
			
			
		});
		
		
		
	})


</script>
<style>
	
	img {
		width : 180px;
		max-width :100%;
		height : auto;
	}

	div.text-dark {
			font-size: 3rem;
		}
		
	div.text-muted {
			font-size:2rem;
	}	
	
</style>



</head>
<body>

<div class="container">
 	<form>

	<br>
		<div class="page-header text-secondary">
	       <h3>응모하기 페이지</h3>
	       
	    </div>
<br>
 	<div class="row">
			<div class="col-sm-10">
				<input type="hidden" id="un" name="userNo" value="${user.userNo}">
				<input type="hidden" id="pn" name="previewNo" value="${preview.previewNo}">
				
				<div class="text-dark">${preview.previewName}</div>
			
				<div class="text-muted">
			
			
				<label>시사회장소</label>
				${preview.previewPlace}
				&nbsp
				
				
				<label>시사회일시</label>
				${preview.preDate} ${preview.previewTime}
					
				
				<br>
				<label>당첨발표일자</label>
				${preview.winDate}
				&nbsp
				
			
				<label>당첨인원수</label>
				${preview.winnerCount}
				
				
				</div>
			 </div>
		</div>
		<hr>
<!-- 		 row 닫는 애! -->
<br>
	<div class="row">
		
				<div class="col-md-3">		    
					<div>
			    	<c:forEach var = "image" items ="${fileArr}">
			    		<img src="/resources/image/${image}"/>
			    	<br/>
			    	</c:forEach>
			    	<c:if test="${!empty preview.previewImage}">
									
					</c:if> 
					
					</div>	
				</div>
				
				<div class="col-sm-7">
					<table class="table">
					<tr>
					<td><label>이름</label></td>
					<td>${user.userName}</td>
					</tr>
					
					<tr>
					<td><label>아이디</label></td>
					<td>${user.userId}</td>
					</tr>	
					
					<tr>
					<td><label>이메일</label></td>
					<td>${user.email}</td>
					</tr>	
					
					<tr>
					<td><label>휴대전화번호</label></td>
					<td>${user.phone}</td>
					</tr>	
					
					</table>
				 </div>
		
			
			</div>
	<!-- 		 row 닫는 애! -->
	
			<div class="text-center">
				<button id="applyBtn" class="btn btn-dafault write" type="button">응모하기</button>
				<button id="updateBtn" class="btn btn-dafault write" type="button">수정하기</button>
			</div>
			<br>
		
	</form>
 </div>
	<!-- 	container 닫는 애  -->
 </body>
 
 </html>