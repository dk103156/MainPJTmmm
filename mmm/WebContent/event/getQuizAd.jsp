<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<title>getQuizAd</title> 
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>	 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function(){
		$('#updateBtn').on("click", function(){
			alert('update버튼이 클릭됨');
			self.location = "/event/updateQuizAd?quizNo=${quiz.quizNo}";
		});
		$('#okBtn').on("click", function(){
			alert('ok버튼이 클릭됨');
			history.go(-1);
		});
	});  

</script>
</head> 

<body>
	<div class="container">
		<br>
		<div class="page-header text-secondary">
		       <h3>퀴즈 상세조회</h3>
		 </div>
		<br>	
		
	 <div class="row">
		    
		<table class="table">
			<tr>
			<td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="title">Question</label>
				<div class="form-group col-sm-10">
					${quiz.question}
				</div>	
	        </td>
	       </tr> 
	       <tr>
			<td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="title">Option1</label>
				<div class="form-group col-sm-10">
					${quiz.optionFirst}
				</div>	
	        </td>
	        </tr>
	        <tr>
	        <td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="title">Option2</label>
				<div class="form-group col-sm-10">
					${quiz.optionSecond}
				</div>	
	        </td>
	        </tr>
	        <tr>
	        <td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="title">Option3</label>
				<div class="form-group col-sm-10">
					${quiz.optionThird}
				</div>	
	        </td>
	        </tr>
	        <tr>
	        <td class="form-inline form-group">
				<label class="col-sm-2 control-label"  for="title">Option4</label>
				<div class="form-group col-sm-10">
					${quiz.optionFourth}
				</div>	
	        </td>
	        </tr>
	        <tr>
	           <td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="answer">answer</label>
				<div class="form-group col-sm-10">
					${quiz.answer}
				</div>	
	        </td>
	        </tr>
	        <tr>
	         <td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="quizStartDate">quizStartDate</label>
				<div class="form-group col-sm-10">
					${quiz.quizStDate}
				</div>	
	        </td>
	        </tr>
	        <tr>
	         <td class="form-inline form-group">
				<label class="col-sm-2 control-label" for="quizEndDate">quizEndDate</label>
				<div class="form-group col-sm-10">
					${quiz.quizEdDate}
				</div>	
	      </td>
	      </tr>
		</table>
	</div>
		
	  
		<div class="text-center">
			<button id="updateBtn"" class="btn btn-dafault write" type="button">수 &nbsp;정</button>
			<button id="okBtn" type="button" class="btn btn-dafault write">확 &nbsp;인</button>
		</div>

	</div>

 </body>
 
 </html>