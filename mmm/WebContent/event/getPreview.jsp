<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 부트스트랩4 를 위한 것 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


<script type="text/javascript">
	
	$(function(){
		
		
		$('#updateBtn').on("click", function(){
			alert('update버튼이 클릭됨');
			var previewNo = ${preview.previewNo};
			self.location = "/event/updatePreviewAd?previewNo="+previewNo;
		});
		
		
		$('#okBtn').on("click", function(){
			alert('ok버튼이 클릭됨');
			self.location="/event/getPreviewListAd";
		});
		
		
		$('#doApply').on("click", function(){
			alert('doApply버튼이 클릭됨');
			var status =${preview.previewFlag};
			console.log(status);
			
			if(status=='1'){
				alert('제송합니다만...마감되었거든요....');
				return;
			}
			
			
			var previewNo = ${preview.previewNo};
			self.location="/event/addPartPrev?previewNo="+previewNo;
		});
		
		$('#ranBtn').on("click", function(){
			alert('doApply버튼이 클릭됨');
			var previewNo = ${preview.previewNo};
			alert("previewNo:"+previewNo)
			self.location="/event/getWinner?previewNo="+previewNo;
		});
		
		
		$('#winner').on('click',function(){
			console.log('winner클릭')
			var previewNo = ${preview.previewNo};
			console.log("previewNo"+previewNo);
			
				$.ajax({
				url: "/event/json/getWinnerList/"+previewNo,
				method:"GET",
				dataType:"json",
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(JSONData, status){
					//alert(status)
					console.log(JSONData.list.length);
					for (var i = 0; i < JSONData.list.length; i++) {
						console.log(JSONData.list[i]);
						$('#az').append("<h4><h5>[회원이름] "+JSONData.uList[i].userName+
								"[전화번호]  "+JSONData.uList[i].phone+"</h4><br>");
					}
				}
			}); //ajax끝
		});
		
		
		$("#apply").on("click", function(){
			
			var previewNo = ${preview.previewNo};
			console.log("previewNo"+previewNo);
			
				$.ajax({
				url: "/event/json/getApplyList/"+previewNo,
				method:"GET",
				dataType:"json",
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(JSONData, status){
				
					console.log(JSONData.list.length);
					for (var i = 0; i < JSONData.list.length; i++) {
						console.log(JSONData.list[i]);
						$('#ax').append("<h4><h5>[회원관리번호]"+JSONData.list[i].userNo+
								"[참여일시]"+JSONData.list[i].partStrDate+"</h4><br>");
					}
				}
			}); //ajax끝
		}); //click 이벤트 끝
	}) //$ 끝
	
</script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
		}
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
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">


 	<div>
			
	
		</div>
<!-- 		 row 닫는 애! -->


		<div class="text-center">
			<button id="updateBtn" class="btn btn-outline-secondary" type="button">수 &nbsp;정</button>
			<button id="okBtn" type="button" class="btn btn-outline-secondary">확 &nbsp;인</button>
			<button id="ranBtn" type="button" class="btn btn-outline-secondary">추첨하기</button>
			<button class="btn btn-outline-secondary" id="doApply">응모하기</button>
		</div>
		<br>
		<div class="text-center">
			<button class="btn btn-outline-secondary"   id="apply">응모자 정보보기</button>
			<div id="ax">
			</div>
		</div>
		<div class="text-center">
			<button class="btn btn-outline-secondary" id="winner">당첨자 정보보기</button>
			<div id="az">
			</div>
		</div>
		
		
<!-- 	container 닫는 애  -->
</div>

 </body>
 
 </html>