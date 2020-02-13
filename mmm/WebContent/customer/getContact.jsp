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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function(){
		
		$('#delBtn').on("click", function(){
			alert('delBtn버튼이 클릭됨');
			var articleNo = ${article.articleNo};
			console.log(articleNo)
			self.location="/customer/deleteContact?articleNo="+articleNo;
		});
		
		$('#okBtn').on("click", function(){
			alert('ok버튼이 클릭됨');
			history.go(-1);
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

<style>
 #header{ 
      	width:808px;
      	height:auto;
      	padding: 20px;
        margin: 10px auto;
        border: 1px solid #bcbcbc;
        }
        
	 
		        
	  th {
	     width:300px;
	     padding: 10px;
	     text-align: center;
	  }        
	  
	  
	  .content{
	  	height:autox;
	  }
	  
	  		
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
  
  
  tr.title{
  background-color:#f2efed;
  }
</style>



</head> 

<body>
<div class="container">

	<div class="page-header text-dark">
	       <h3>고객센터</h3>
	       <hr>
	    </div>
	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
		<button type="button" name="ask" class="btn btn-outline-secondary ">자주찾는질문</button>
	    <button type="button" name="contact" class="btn btn-outline-secondary active">일대일문의</button>
	    <button type="button" name="notice" class="btn btn-outline-secondary ">공지사항</button>
	  </div>
	</div>

</div>
	<div class="container">
	<div id="header"> 
	
	<div>
					<table class="table table-sm table-borderless">
				     <tbody>
				     
                    <tr class="title">
                    <td colspan="4">${article.articleTitle}</td>
                    </tr>
                    
                    
					<tr>
					<th>이름</th>
					<td>${writer.userName}</td>
					
					
				
					<th>아이디</th>
					<td>${writer.userId}</td>
					</tr>	
					
					<tr>
					<th>이메일</th>
					<td>${writer.email}</td>
					
					
					
					<th>휴대전화번호</th>
					<td>${writer.phone}</td>
					</tr>	
					
				</tbody>
				</table>
				
	</div>
		
	 <div class="noticebox">	
                        <table class="table table-bordered">
	                        <tbody>
	                        </tbody>
	                        <tbody>
		                        <tr>
		                        <td colspan="2">
			                        <div class="content">
				                        ${article.content}
			                        </div>
		                        </td>
		                        </tr>
	                        </tbody>
	                    </table>
	                    
                    </div>
				
		
	
			</div>
	 <div class="row">
		   
	</div>
		
	  
		<div class="text-center">
			<button id="delBtn"" class="btn btn-secondary write" type="button">삭 &nbsp;제</button>
			<button id="okBtn" type="button" class="btn btn-secondary write">목 &nbsp;록</button>
		</div>

	</div>

 </body>
 
 </html>