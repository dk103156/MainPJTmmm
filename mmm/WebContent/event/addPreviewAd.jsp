<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> <meta charset="utf-8"> <!-- 문자셋 --> 
<title>addPreviewAd</title> 
<meta charset="utf-8">

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
	

	
		$(document).ready(function() {
		
		    $(".datepicker").datepicker({ 
		        dateFormat: 'yy-mm-dd'
		    });
	    
			$(".datepicker").on("change", function () {
		        var fromdate = $(this).val();
		    });
			
			$('#regBtn').on("click", function(){
				
				fncAddPreview();
			});
			
			$('#cancelBtn').on("click", function(){
				history.go(-1);
			});
	
			$("#fileUpload").on("change", function (){
				readURL(this);
			});
			
			
		});
			
			
			
		   function readURL(input) {
	            if (input.files && input.files[0]) {
	            var reader = new FileReader();
	 
	            reader.onload = function (e) {
	                    $('#blah').attr('src', e.target.result);
	                }
	              reader.readAsDataURL(input.files[0]);
	            }
	        }


			
			function check(re, what, message) {
				alert('호출됨');
		    	if(re.test(what)) {
		        return true;
		    	}
		    	alert(message);
			}	
			

			function fncAddPreview(){
				
				var reHour = /^(?:[01][0-9]|2[0-3])$/;
				var reMin = /^[0-5][0-9]$/;
				
				
				var previewName = $("input[name='previewName']").val();
				var previewPlace = $("select[name='previewPlace']").val();
				var previewDate = $("input[name='previewDate']").val();
				var previewImage = $("input[name='previewImage']").val();
				var previewStartDate = $("input[name='previewStartDate']").val();  
				var previewEndDate = $("input[name='previewEndDate']").val();
				var winnerDate = $("input[name='winnerDate']").val();
				var winnerCount = $("input[name='winnerCount']").val();
				var previewHH = $("input[name='previewHH']").val();
				var previewMM = $("input[name='previewMM']").val();
				
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
				if(!check(reHour, previewHH, "적합하지 않은 시간입니다.")) {
					
				    return false;
				}
				if(!check(reMin, previewMM, "적합하지 않은 분입니다.")) {
				    return false;
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
				
				$("form").attr("method","post").attr("action","/event/addPreviewAd").attr("enctype","multipart/form-data").submit();
			}
			
					
		</script>
		
		 <style type="text/css">
		
				.pinkstyle{
				 color:#495057;
				 font-size:25px;
				}
				
				.time{
				 display:inline;
				}
			
				body {
			    overflow: auto;
			    overflow-y: scroll;
			    letter-spacing: 0;
			    line-height: 1.5;
			    font-size: 17px;
			    color: #444;
			    font-weight: 400;
				font-family: 'Noto Sans KR', sans-serif;
				}
				
				input:focus {
				outline: none;
				}
				
				#fileUpload{
				font-size: 23px;
				position: absolute;
				right: 0px;
				top: 0px;
				opacity: 0;

				}
				
			.file_input_textbox
			{
			float: left;
			border-style: none;
		    border-color: white;
			}
			 
			.file_input_div
			{
			position: relative;
			width: 100px;
			height: 23px;
			border-color: 1px solid black;
			overflow: hidden;
		  
			}
			.file_input_button
			{
			position: absolute;
			color:#495057;
			height:25px;
			}
			 
			#fileUpload
			{
			font-size: 50px;
			position: absolute;
			right: 0px;
			top: 0px;
			opacity: 0;
			 
			filter: alpha(opacity=0);
			-ms-filter: "alpha(opacity=0)";
			-khtml-opacity: 0;
			-moz-opacity: 0;
			}
			
			.btn{
			 border-color: #d6cece;
			 color: #4e4c4c;
			 background-color: #fee00e;
			}
	
	
			th{
			width: 25%;
			}
		</style>
</head> 

<body>
<form enctype="multipart/form-data" autocomplete="off">
	<br>
		<div class="page-header text-secondary">
	        <h3><i class="fas fa-grip-lines-vertical"></i>시사회이벤트 등록</h3>
	    </div>
			
		<br>	
		<br>
		
<div class="container">
 	<div class="row">
 	
			<div class="col">		
				<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
 
				<div class=file_input_div>
				
				<i class="file_input_button fas fa-file-image">search file</i>
<!-- 				<input type="button" value="search Files" class="file_input_button" /> -->
				<input type="file" id="fileUpload" name="previewImage" >
				</div>
				
				<img id="blah" src="/resources/image/default_img.jpg" alt="이미지 준비중" width="300" height="400" />
			</div>
			
			<div class="col">
				<table class="table table-sm table-borderless">
				
				<tr>
					<th scope="row">시사회이름</th></td>
					<td><input type="text" class="form-control" name="previewName" placeholder="예)<영화명>시사회"></td>
				</tr>
				<tr>
					<th scope="row">영화제목</th>
					<td><input type="text" class="form-control" name="movieTitle" value=""></td>
				</tr>
				<tr>
					<th scope="row">시사회장소</th>
						<td>
						<select class="form-control" id="previewPlace" name="previewPlace">
							<c:forEach var="i" items="${getTheaterList}">
				   			<option>${i.theaterName}</option>
							</c:forEach>
						</select>
						</td>
				</tr>				
				
				<tr>
					<th scope="row">시사회일자</th>
					<td><div class='input-group date' data-provide="datepicker">
	 				
 					 <input placeholder="Selected date" type="text" name="previewDate" class="form-control col-md-5 col-xs-5 datepicker">                    
 					 <div class="input-group-addon pinkstyle ml-1">
                    	 <i class="far fa-calendar-alt"></i>
              		 </div>			
					</div></td>
				</tr>	
				
				<tr>
					<th scope="row">시사회시간</th>
					<td>   
					<input type="text" class="form-control col-sm-3 time" name="previewHH" placeholder="(HH)"> 시
					<input type="text" class="form-control col-sm-3 time" name="previewMM" placeholder="(MM)"> 분
					</td> 
				</tr>
				
				
				<tr>
				<th scope="row">응모시작일자</th>
				<td>
				<div class='input-group date' data-provide="datepicker">
				<input placeholder="Selected date" type="text" name="previewStartDate" class="form-control datepicker">                    
					<div class="input-group-addon pinkstyle ml-1">
                	<i class="far fa-calendar-alt"></i>
              		</div>			
				</div>	
				</td>
				</tr>	
				
				<tr>
				<th scope="row">응모종료일자</th>
				<td><div class='input-group date' data-provide="datepicker">
				 <input placeholder="Selected date" type="text" name="previewEndDate" class="form-control datepicker">                    
				 <div class="input-group-addon pinkstyle ml-1">
                  <i class="far fa-calendar-alt"></i>
           		  </div>			
				</div>
				</td>
				</tr>	
				
				<tr>
				<th scope="row">당첨발표일자</th>
				<td><div class='input-group date' data-provide="datepicker">
				 <input placeholder="Selected date" type="text" name="winnerDate" class="form-control col-md-5 col-xs-5 datepicker">                    
				 <div class="input-group-addon pinkstyle ml-1">
		          <i class="far fa-calendar-alt"></i>
		       	  </div>			
				  </div></td>
				</tr>	
				
				<tr>
				<th scope="row">당첨인원수</th>
				<td><input type="text" class="form-control" name="winnerCount"></td>
				</tr>	
				
				</table>
			 </div> <!--  col-sm-8 닫는애--> 
		</div> <!-- row 닫는 애! -->

		<div class="text-center mt-4">
			<button id="regBtn" class="btn mr-1">등&nbsp;록</button>
			<button id="cancelBtn" type="button" class="btn ml-1">취 &nbsp;소</button>
		</div>
		<br>
	
		</form>
		</div> <!-- container 닫는 애  -->


 </body>
 </html>

