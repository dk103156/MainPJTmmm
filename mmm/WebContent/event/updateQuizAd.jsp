<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> <meta charset="utf-8"> <!-- 문자셋 --> 
<title>addQuizAd</title> 
<!-- bootstrap 4 CDN -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- jQuery library -->
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- datepicker CDN -->

	
	
	
<!-- fontawesome CDN -->
	<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	function fncUpdateQuiz(){
		
		var question = $("input[name='question']").val();
		var optionFirst = $("input[name='optionFirst']").val();
		var optionSecond = $("input[name='optionSecond']").val();
		var optionThird = $("input[name='optionThird']").val();
		var optionFourth = $("input[name='optionFourth']").val();
		var answer = $("input[name='answer']").val();
		var quizStartDate = $("input[name='quizStartDate']").val();
		var quizEndDate = $("input[name='quizEndDate']").val();
		
		if(question == null || question.length<1) {
			alert("퀴즈문제는 반드시 입력하셔야 합니다.")
		}
		if(optionFirst == null || optionFirst.length<1) {
			alert("선택지1은 반드시 입력하셔야 합니다.")
		}
		if(optionSecond == null || optionSecond.length<1) {
			alert("선택지2는 반드시 입력하셔야 합니다.")
		}
		if(optionThird == null || optionThird.length<1) {
			alert("선택지3은 반드시 입력하셔야 합니다.")
		}
		if(optionFourth == null || optionFourth.length<1) {
			alert("선택지4는 반드시 입력하셔야 합니다.")
		}
		if(answer == null || answer.length<1) {
			alert("정답은 반드시 입력하셔야 합니다.")
		}
		if(quizStartDate == null || quizStartDate.length<1) {
			alert("퀴즈참여 시작일자는 반드시 입력하셔야 합니다.")
		}
		if(quizEndDate == null || quizEndDate.length<1) {
			alert("퀴즈참여 종료일자는 반드시 입력하셔야 합니다.")
		
		}
		$("form").attr("method","post").attr("action","/event/updateQuizAd").submit();
	}
	
	$(function(){
		$('#updateBtn').on("click", function(){
			fncUpdateQuiz();
		});
		$('#cancelBtn').on("click", function(){
			alert('취소버튼이야');
		});
	});
	</script>
	
	
	 <style type="text/css">
				.pinkstyle{color:#f68181;font-size:28px;}
				.qOrder{display:inline;}
	</style>
</head> 
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">
<br>
		<div class="page-header text-secondary">
	        <h3>퀴즈 수정</h3>
	    </div>
			
		<br>	
		<br>
		
    
	<form>
		<div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Question</label>
			<div class="form-group col-sm-10">
			<input type="text" class="form-control" name="question" value="${quiz.question}">
			</div>
        </div>
		<div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option1</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="optionFirst"  value="${quiz.optionFirst}">
        </div>
		</div>	
        <div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option2</label>
				<div class="col-sm-10">
			<input type="text" class="form-control" name="optionSecond"  value="${quiz.optionSecond}">
			</div>
        </div>
        <div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option3</label>
				<div class="col-sm-10">
			<input type="text" class="form-control" name="optionThird"  value="${quiz.optionThird}">
			</div>
			
        </div>
        <div class="form-inline form-group">
			<label for="title" class="col-sm-2 control-label">Option4</label>
				<div class="col-sm-10">
			<input type="text" class="form-control" name="optionFourth" value="${quiz.optionFourth}">
			</div>
        </div>
        
        <!-- 제품 컬럼 추가 -->
        <div class="form-inline form-group">
            <label for="area" class="col-sm-2 control-label">Answer</label>
            <div class="col-sm-10">
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
			<div class="col-sm-10">
			<div class='input-group date' data-provide="datepicker">
 				 <input value="${quiz.quizStDate}" type="text" name="quizStartDate" class="form-control datepicker" >                    
 				 <div class="input-group-addon pinkstyle">
                     <i class="far fa-calendar-alt"></i>
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
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>

				