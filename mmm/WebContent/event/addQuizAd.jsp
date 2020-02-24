<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> <meta charset="utf-8"> <!-- 문자셋 --> 
<title>addQuizAd</title> 
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
	
	function fncAddQuiz(){
		
		var question = $("input[name='question']").val();
		var optionFirst = $("input[name='optionFirst']").val();
		var optionSecond = $("input[name='optionSecond']").val();
		var optionThird = $("input[name='optionThird']").val();
		var optionFourth = $("input[name='optionFourth']").val();
		var answer = $("select[name='answer']").val();
		var quizStartDate = $("input[name='quizStartDate']").val();
		
		if(question == null || question.length<1) {
			alert("퀴즈문제는 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionFirst == null || optionFirst.length<1) {
			alert("선택지1은 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionSecond == null || optionSecond.length<1) {
			alert("선택지2는 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionThird == null || optionThird.length<1) {
			alert("선택지3은 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionFourth == null || optionFourth.length<1) {
			alert("선택지4는 반드시 입력하셔야 합니다.")
			return;
		}
		if(answer == null || answer.length<1) {
			alert("정답은 반드시 입력하셔야 합니다.")
			return;
		}
		if(quizStartDate == null || quizStartDate.length<1) {
			alert("퀴즈참여 시작일자는 반드시 입력하셔야 합니다.")
			return;
		}
		$("form").attr("method","post").attr("action","/event/addQuizAd").submit();
	
	}
	
	
		$(function(){
			$('#regBtn').on("click", function(){
				fncAddQuiz();
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
// 		        alert(fromdate);
		    });
		
		});
		
		</script>



	
	 <style type="text/css">
	.pinkstyle{color:#f68181;font-size:28px;}
	.qOrder{display:inline;}
				
	body {
	font-family: 'Noto Sans KR', sans-serif;	
	}
				
	</style>
				
</head> 
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">
<br>
		<div class="page-header">
	        <h3>퀴즈 등록</h3>
	    </div>
			
		<br>	
		<br>
		
    
	<form autocomplete="off">
	<div>
		<div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Question</label>
			<div class="form-group col-sm-10">
			<input type="text" class="form-control" name="question" placeholder="Question">
			</div>
        </div>
		<div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option1</label>
			<div class="form-group col-sm-10" >
			<input type="text" class="form-control" name="optionFirst"  placeholder="Option1">
        </div>
		</div>	
        <div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option2</label>
				<div class="form-group col-sm-10">
			<input type="text" class="form-control" name="optionSecond" placeholder="Option2">
			</div>
        </div>
        <div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option3</label>
				<div class="form-group col-sm-10">
			<input type="text" class="form-control" name="optionThird" placeholder="Option3">
			</div>
			
        </div>
        <div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option4</label>
				<div class="form-group col-sm-10">
			<input type="text" class="form-control" name="optionFourth" placeholder="Option4">
			</div>
        </div>
        
        <!-- 제품 컬럼 추가 -->
        <div class="form-inline form-group">
            <label for="area" class="col-sm-2 control-label">Answer</label>
            <div class="form-group col-sm-10">
                    <select class="form-control"  name="answer">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
        </div>
        </div>
        <!-- 제품 컬럼 종료 -->
   		<div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">시작일자</label>
			<div class="form-group col-sm-10">
			<div class='input-group date' data-provide="datepicker">
 				 <input placeholder="Selected date" type="text" name="quizStartDate" class="form-control datepicker" >                    
 				 <div class="input-group-addon pinkstyle">
                     <i class="far fa-calendar-alt"></i>
                </div>
                 </div>			
			</div>	
        </div>
        </div>
		<br>
		<div class="text-center">
			<button id="regBtn" class="btn btn-dafault write" type="button">등 &nbsp;록</button>
			<button type="button" class="btn btn-dafault write">취 &nbsp;소</button>
		</div>
	</form>
</div>


 </body>
 
 </html>