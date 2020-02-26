<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> <meta charset="utf-8"> <!-- 문자셋 --> 
<title>MMM</title> 
<meta charset="utf-8">

<!-- bootstrap 4 CDN -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
<!-- datepicker CDN -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	
	
<!-- fontawesome CDN -->
	    <script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
	    

	
	<script type="text/javascript">
	

	function fncAddPreview(){
		
		var previewName = $("input[name='previewName']").val();
		var previewPlace = $("select[name='previewPlace']").val();
		var previewDate = $("input[name='previewDate']").val();
		var previewImage = $("input[name='previewImage']").val();
		var previewStartDate = $("input[name='previewStartDate']").val();
		var previewEndDate = $("input[name='previewEndDate']").val();
		var winnerDate = $("input[name='winnerDate']").val();
		var winnerCount = $("input[name='winnerCount']").val();
		
		if(previewName == null || previewName.length<1) {
			alert("시사회 이름은 반드시 입력하셔야 합니다.")
			return;
		}
		if(previewPlace == null || previewPlace.length<1) {
			alert("시사회 장소는 반드시 입력하셔야 합니다.")
			return;
		}
		if(previewDate == null || previewDate.length<1) {
			alert("시사회 일자 반드시 입력하셔야 합니다.")
			return;
		}
		if(previewImage == null || previewImage.length<1) {
			alert("시사회 이미지는 반드시 입력하셔야 합니다.")
			return;
		}
		if(previewStartDate == null || previewStartDate.length<1) {
			alert("이벤트 응모 시작일자는 반드시 입력하셔야 합니다.")
			return;
		}
		if(previewEndDate == null || previewEndDate.length<1) {
			alert("시사회 응모 종료일자는 반드시 입력하셔야 합니다.")
			return;
		}
		if(winnerDate == null || winnerDate.length<1) {
			alert("당첨자 발표 일시는 반드시 입력하셔야 합니다.")
			return;
		}
		if(winnerCount == null || winnerCount.length<1) {
			alert("당첨인원수는 반드시 입력하셔야 합니다.")
			return;
		}
		
		$("form").attr("method","post").attr("action","/event/updatePreviewAd").attr("enctype","multipart/form-data").submit();
	}
	
		$(function(){
			
			$('#regBtn').on("click", function(){
				alert('눌렸어!!!!!!!!!!!!!!!!!!!!!!!');
				fncAddPreview();
			});
			
			$('#cancelBtn').on("click", function(){
				history.go(-1);
			});
	
		
		});
	
	
	</script>

		<script type="text/javascript">
			
		
			$(document).ready(function() {
			
			    $(".datepicker").datepicker({ 
			        dateFormat: 'yy-mm-dd'
			    });
		    
				$(".datepicker").on("change", function () {
			        var fromdate = $(this).val();
			        alert(fromdate);
			    });
			
		});
		
		</script>
		
	 <style type="text/css">
		.pinkstyle{color:#f68181;font-size:28px;}
		.time{display:inline;}
		
		img-wrapper{
		width: 25%;
		}
		
		img{
			width: 100%;
			height: auto;
			}
	</style>
</head> 

<body>

<div class="container">
	
	<br>
		<div class="page-header text-secondary">
	        <h3>시사회이벤트 수정</h3>
	    </div>
			
	<br><br>
 	
	<form enctype="multipart/form-data">
 	<div class="row">
		
			<div class="col-md-5">		
			
			<div class="img-wrapper">
		    	<c:forEach var ="image" items ="${fileArr}">
		    		<img src="/resources/image/${image}"/>  <br>
		    	</c:forEach>
			</div>
			
			<input type="file"  name="previewImage" >
			
			</div>
			
			<div class="col-sm-7">
				<table class="table">
				<tr>
				<td><label>시사회이름</label></td>
				<td><input type="text" class="form-control" name="previewName" value="${preview.previewName}"></td>
				</tr>
				
				<tr>
					<td><label>시사회장소</label></td>
						<td>
							<select class="form-control" id="previewPlace" name="previewPlace">
								<c:forEach var="i" items="${getTheaterList}">
					   				<option>${i.theaterName}</option>
								</c:forEach>
							</select>
						</td>
				</tr>				
				
				<tr>
				<td><label>시사회일자</label></td>
				<td><div class='input-group date' data-provide="datepicker">
 				
 				 <input placeholder="Selected date" type="text" name="previewDate" class="form-control col-md-5 col-xs-5 datepicker" value="${preview.preDate}">                    
 				
 				 <div class="input-group-addon pinkstyle">
                     <i class="far fa-calendar-alt"></i>
                </div>			
				</div></td>
				</tr>	
				
				<tr>
					<td><label>시사회시간</label></td>
					<td>
					<input type="text" class="form-control col-sm-3 time" name="previewHH" placeholder="(HH)"> 시
					<input type="text" class="form-control col-sm-3 time" name="previewMM" placeholder="(MM)"> 분
					</td>
				</tr>
				
				<tr>
				<td><label>시사회시작일자</label></td>
				<td>
				<div class='input-group date' data-provide="datepicker">
				<input type="text" name="previewStartDate" class="form-control col-md-5 col-xs-5 datepicker" value="${preview.preStDate}">                    
					<div class="input-group-addon pinkstyle">
                	<i class="far fa-calendar-alt"></i>
              		</div>			
				</div>	
				</td>
				</tr>	
				
				<tr>
				<td><label>시사회종료일자</label></td>
				<td><div class='input-group date' data-provide="datepicker">
				 <input  type="text" name="previewEndDate" class="form-control col-md-5 col-xs-5 datepicker" value="${preview.preEdDate}">                    
				 <div class="input-group-addon pinkstyle">
                  <i class="far fa-calendar-alt"></i>
           		  </div>			
				</div>
				</td>
				</tr>	
				
				<tr>
				<td><label>당첨발표일자</label></td>
				<td><div class='input-group date' data-provide="datepicker">
				 <input type="text" name="winnerDate" class="form-control col-md-5 col-xs-5 datepicker" value="${preview.winDate}">                    
				 <div class="input-group-addon pinkstyle">
		          <i class="far fa-calendar-alt"></i>
		       	  </div>			
				  </div></td>
				</tr>	
				
				<tr>
				<td><label>당첨인원수</label></td>
				<td><input type="text" class="form-control" name="winnerCount" value="${preview.winnerCount}"></td>
				</tr>	
				
				</table>
			 </div> 
			 
				<input type="hidden" name="previewNo" value="${preview.previewNo}">
		
		</div><!-- col-sm-7 닫는애 -->
		</form>
		</div> <!--row 닫는 애! -->
		

		<div class="text-center">
			<button id="regBtn" class="btn btn-dafault write">수&nbsp;정</button>
			<button id="cancelBtn" type="button" class="btn btn-dafault write">취 &nbsp;소</button>
		</div>
		<br>
	
	</div> <!--	container 닫는 애  -->


 </body>
 </html>

