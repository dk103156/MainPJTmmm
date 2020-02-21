<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">



function getCommentList(currentPage) {
	var parent = ${preview.previewNo};
	
	var datas = JSON.stringify({
		currentPage : new String(currentPage),
		commentType : "0",
		parent : new String(parent)
	});
	
	$.ajax({
		type: "POST",
		url: "/event/json/listExpectLine",				
		data: datas,
		dataType : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json",
		},
		success : function(result) {
			
			//alert(result.list.length)
			
			
				$(".reply_box").empty()
				var html = "<p class='num'>"+ result.resultPage.totalCount+" Comments</p>";
				html+= "<input type='hidden' id='currentPage' value=''/>"
				html+= "<input type='hidden' name='articleNo' value='${preview.previewNo}'>"
				html+= "<input type='hidden' name='commentType' value='0'>"
				html+= "<input type='hidden' name='userId' value='${user.userId}'>"
				html+= "<div class='textarea_box'>"
				html+="<textarea name='commentContent' rows='5' cols='50' class='textarea' onfocus=''></textarea>"
				html+="<a id='commentWrite' class='btn_write' >쓰기</a></div>"
			
				
			if(result.list.length!=0){
				for (var i = 0; i < result.list.length; i++) {
					
					if(result.list[i].blindStatus==1){
						html += "<li class='blindCmt'>관리자에 의해 블라인드 처리되었습니다. </li>"
					}else{
					html += "<li><div class='id' name='userId'>"+ result.list[i].userId+ "</div>";
					html += "<input type='hidden' name='commentNo' value='"+result.list[i].commentNo+"'>";
					html += "<div class='date' name='date'>"+result.list[i].commentDate+"</div>";
					html += "<div class='comment' name='content'>"+result.list[i].commentContent+"</div>";
					html += "<a type='button' class='btn_spam' name='btn_spam'>처리</a></li>";
					}
				}
			}
				html += "</p>"
					$(".reply_box").append(html);
				
			
			
			//페이지네이션 추가
			$("div.cmtPagination").empty();
			
			Element = "<div class='col-4'></div>"
	  		Element +="<div class='col-4'>"
			Element +="<ul class='pagination'>"
   			if(result.resultPage.currentPage <= result.resultPage.pageUnit){
   				Element +="<li class='page-item disabled'>"
   				Element +="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'><i class='fas fa-angle-left'></i></a>";
   				Element +="</li>"
   			}else if(result.resultPage.currentPage > result.resultPage.pageUnit){
   				Element +="<li class='page-item'>";
   				Element +="<a class='page-link' href='javascript:getCommentList'("+(parseInt(result.resultPage.beginUnitPage)-1)+")' tabindex='-1' aria-disabled='true'>Previous</a>";
   				Element +="</li>";
   			}
			
  			for(var i=result.resultPage.beginUnitPage; i<=result.resultPage.endUnitPage; i++){
  				if(result.resultPage.currentPage==i){
  					Element+="<li class='page-item active' aria-current='page'>";
  					Element+="<a class='page-link' href='javascript:getCommentList("+i+")'>"+i+"<span class='sr-only'>(current)</span></a>";
  					Element+="</li>";
  				}else{
  					Element+="<li class='page-item'>";
  					Element+="<a class='page-link' href='javascript:getCommentList("+i+")'>"+i+"</a>";
  					Element+="</li>";
  				}
  				
  			}//end of for
			
  			if(result.resultPage.endUnitPage >= result.resultPage.maxPage){
  				Element+="<li class='page-item disabled'>";
  				Element+="<a class='page-link' href='#'><i class='fas fa-angle-right'></i></a>";
  				Element+="</li>";
  			}else if(result.resultPage.endUnitPage < result.resultPage.maxPage){
  				Element+="<li class='page-item'>";
  				Element+="<a class='page-link' href='javascript:getCommentList("+(parseInt(data.resultPage.endUnitPage)+1)+") '><i class='fas fa-angle-right'></i></a>";
  				Element+="</li>";
  			}
			
  			Element+= "</ul>";
			Element+= "</div>";
			Element+= "<div class='col-4'></div>";
			Element+= "<form>";
			Element+= "<input type='hidden' id='currentPage' name='currentPage' value=''/>";
			Element+= "</form>";
			
			$("div.cmtPagination").append(Element);
			
			comment(currentPage)
			
		}//end of success
	
	})//end of ajax
}//end of getCommentList

function comment(currentPage){
	$('#commentWrite').on("click", function(){
				$.ajax({
					
				url: "/event/json/addExpectLine",
				method:"POST",
				data: JSON.stringify({
					articleNo : $("input[name='articleNo']").val(),
					commentType : $("input[name='commentType']").val(),
					userId : $("input[name='userId']").val(),
					commentContent : $("textarea[name='commentContent']").val()
				}),
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(){
					getCommentList(currentPage);
				},
				error: function(status,error) {
					alert("에러발생");
				}//success 끝
			}); //ajax끝
		}); //click 이벤트 끝
}//end of comment()


	$(function(){
		
		getCommentList(1);
		
		comment(1);
		
		//처리 버튼을 누름
		$(document).on("click", "a[name='btn_spam']" ,function() { 
			
			
			var today = new Date();   

			var commentDate = 	today.toLocaleDateString()+" "+today.toLocaleTimeString();	
			var articleNo =${preview.previewNo};
			var userId = $(this).parent().find("div[name='userId']").text();
			var commentContent = $(this).parent().find("div[name='content']").text();
			var commentNo = $(this).parent().find("input[name='commentNo']").val();
			
			$("#userId").html(userId);
			$("#content").html(commentContent);
			$("#cmtDate").html(commentDate);
			$("input[name='commentNo']").val(commentNo);

			
			$('#modalBox').modal('show');
		
		});
		
		
		$('#modalBox').on('show.bs.modal', function (e) {
			console.log("show.bs.modal");
			
			});
		
		$('#closeModalBtn').on('click', function(){
			$('#modalBox').modal('hide');
			});
		
		
		
		
		
		
		
		//블라인드 처리 모달창 확인버튼 
		$('#addBlindBtn').on("click", function(){
			
			var blindReason = $("select[name='blind_reason']").val();
			var commentNo = $("input[name='commentNo']").val();
			
			
			
			console.log(blindReason);
			console.log(commentNo);
			
			$.ajax({
				
				url: "/event/json/addExpectLineBlind",
				method:"POST",
				data: JSON.stringify({
					blindReason : new String(blindReason),
					commentNo : new String(commentNo)
				}),
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(){
					alert('성공했어....')
				},
				error: function(status,error) {
					alert("에러발생");
				}//success 끝
			}); //ajax끝
			
			
			
			
			self.location = "";
		});


		
		$('#okBtn').on("click", function(){
			alert('ok버튼이 클릭됨');
			self.location="/event/getPreviewListAd";
		});
		
		
		$('#doApply').on("click", function(){
			alert('doApply버튼이 클릭됨');
			var status =${preview.previewFlag};
			console.log(status);
			
			if(status==1){
			
				Swal.fire({
					  title: 'Error!',
					  text: 'Do you want to continue',
					  icon: 'error',
					  confirmButtonText: 'Cool'
					});
			
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
	
	.issue{
	height: 500px;
	border: 1px solid black;
	
	
	}	
		
		
	.byeFloat {
/* 	content: '';  */
	dispaly: table;
	clear: both;
	height: 30px;


	}

	.event-detail .event-detail-date {
	    overflow: hidden;
	    width: 1100px;
	    margin: 0 auto 30px auto;
	    padding: 15px 0 25px 0;
	    line-height: 1.1;
	    border-bottom: 1px solid #555;
		}
	
	* {
	    box-sizing: border-box;
		}
	
	p {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	
	body {
		
	    overflow: auto;
	    overflow-y: scroll;
	    letter-spacing: 0;
	    line-height: 1.5;
	    font-size: 15px;
	    color: #444;
	    font-weight: 400;
		font-family: 'Noto Sans KR', sans-serif;
		
		}
		
		#contents {
	    width: 100%;
	    margin: 0;
	    padding: 40px 0 0 0;
	}

	.event-detail h2.tit {
	    width: 1100px;
	    margin: 0 auto;
	    padding: 0;
	}
	
	
	h2.tit {
	    padding: 0 0 26px 0;
	    font-size: 1.8666em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	    }
	    
	
		div.cdtl_col_lft{
		font-size: 12px;
		line-height: 1.5em;
		float: left;
		width: 550px;
		}
	
		div.cdtl_col_rgt {
	    float: right;
	    width: 550px;
	    line-height: 1.5em;
		}
	
		div.prevInfo {
		padding: 0px;
		font-size: 1.5em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	    border-bottom: 0.5px solid #444444;
	    margin-bottom: 15px;
		}
	
		p{
		text-indent : 0.5em;
		}
	
	.jb-bolder {
        font-weight: bolder;
      }
	.trailer{
		width: 550px;
		height: 300px;
		border: 1px solid #444444;
	}
	
	.expectLine{
		border-top: 1px solid black;
		px;
	}
	
	
	
	
	
	.comment_area{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 14px;
	color: #545454;
	position: relative;
	}
	
	.comment_area.num{
	padding: 0;
	border: 0;
	color: #545454;
	font-weight: bold;
	font-size: 12px;
	margin: 10px 0 25px;

	}
	
	p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
	}
	
	.comment_area .textarea_box {
	    position: relative;
	    margin: 10px 0; 
	    padding-right: 75px;
	}
	
	.comment_area .textarea_box textarea {
	    border: 1px solid #ebebeb;
	    background: #f3f3f3;
	    font-size: 14px;
	    display: block;
	    height: 70px;
	    width: 100%;
	}

	.comment_area .textarea_box a.btn_write {
	    position: absolute;
	    right: 0;
	    top: 0;
	    height: 70px;
	    color: #fff;
	    font-weight: bold;
	    width: 65px;
	    background: #828282;
	    text-align: center;
	    padding-top: 25px;
	}
	
	textarea {
	    -webkit-writing-mode: horizontal-tb !important;
	    text-rendering: auto;
	    color: -internal-light-dark-color(black, white);
	    letter-spacing: normal;
	    word-spacing: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    -webkit-appearance: textarea;
	    background-color: -internal-light-dark-color(white, black);
	    -webkit-rtl-ordering: logical;
	    flex-direction: column;
	    resize: auto;
	    cursor: text;
	    white-space: pre-wrap;
	    overflow-wrap: break-word;
	    margin: 0em;
	    font: 400 13.3333px Arial;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(169, 169, 169);
	    border-image: initial;
	    padding: 2px;
	}
	 .reply_box {
    margin-bottom: 25px;
    padding: 0 
	}
	
	ul {
	    display: block;
	    list-style-type: disc;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;
	}
	
	.reply_box li {
	    position: relative;
	    border-bottom: 1px solid #e0e0e0;
	    padding: 12px 5px;
	}
	
	
	li {
	    list-style: none;
	}
	
	.reply_box li .id {
	    margin-bottom: 10px;
	    display: inline-block;
	    font-weight: bold;
	    color: #828282;
	    font-size: 14px;
	}

	li {
	    text-align: -webkit-match-parent;
	}
	
	 li .date {
	    font-size: 12px;
	    color: #bebebe;
	    position: absolute;
	    top: 12px;
	    right: 50px;
	}
	
	li .comment {
	    font-size: 16px;
	    line-height: 180%;
	}
	
	li .btn_spam {
	    position: absolute;
	    right:10px;
	    top: 12px;
	    font-size: 12px;
	    text-decoration: underline;
	    color: #000;
	}
	
	.cmtPagination {
	    text-align: center;
	}
	
	.cmtPagination a {
	    display: inline-block;
	}

	
	li.blindCmt{
		height: 82.76px;
		color: #2F4F4F;
		padding-top:30px;
	}
	a:visited {
	    color: #545454;
	    text-decoration: none;
	}
	li.active {
	  background-color: yellow;
	}
	
	p.modal-title {
		color: #545454;
		font-size: 15px;
	}
	i.fas.fa-pastafarianism{
		color:#545454;
	}
	
	button.btn {
	background-color:#fee50e ;
	color:#545454;
	}
	
	#content{
	width:90%;
	margin-left: 21px;
	height: 100px;
	border: 1px solid #dedede;
	}
	
	#cmtDate{
	    font-size: 15px;
	    color: #dedede;
	    position: absolute;
	    top: 12px;
	    right: 40px;
	}
	
	#userId{
		font-size: 15px;
	   
	    position: absolute;
	    top: 12px;
	    left: 40px;
	}
	span{
	 color: #dedede;
	}
	
	div.blindInfo{
		width:90%;
	}
	
	.btn{
	border: 1px solid #dedede;
	}

</style>



</head> 

<body>
	<button class="btn btn-outline-secondary" id="doApply">응모하기</button>
<div class="container">


 	<div id="contents">
 	
 	
	<div class="event-detail">	
	<h2 class="tit">${preview.previewName}</h2>
	<p class="event-detail-date">
				<span>기간</span>
				<em>${preview.preStDate} ~ ${preview.preEdDate}</em>
	</p>
	</div><!-- div.event-detail끝 -->
	
	<div class="cdtl_cm_detail">
	
		<div class="cdtl_col_lft">
				<div class="cdtl_item_image">
					<span class="cdtl_imgbox imgzoom">
								<img src= "/resources/image/${preview.previewImage}" width="450" height="600" onerror="this.onerror=null;this.src='http://img.ssgcdn.com/trans.ssg?src=/ui/ssg/img/common/img_ready_500x500.jpg&amp;w=1200&amp;h=1200&amp;t=a00628030fd12db31022d09ae5b97d4b29576a99'" id="mainImg"></span>
				</div>
	
			</div><!-- div.cdtl_col_lft끝 -->
	
		<div class="cdtl_col_rgt">
		
				<div class="cdtl_bn_wrap">
                        <div>
                                   <img src="/resources/image/ddd.PNG" alt=""></a>
										</div>
                        </div>
               
            <div class="cdtl_prd_info"> <!-- 시사회 정보 -->
                <div class="prevInfo">
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder">시사회 이름</span> ${preview.previewName}</p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder">장소</span>  ${preview.previewPlace} <i class="far fa-map"></i></p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder">시사 일자</span> ${preview.preDate}</p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder">상영 시간 </span> ${preview.previewTime}</p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder">인원수  </span> ${preview.winnerCount}</p>
					
					</div>
                
                <div class="trailer">
                	Trailer 넣는곳
                </div>
	 		</div> <!-- cdtl_prd_infot끝 -->
	   
		</div><!-- div.cdtl_col_rgt끝 -->
	
	</div>			
	
	<div class="byeFloat" style="clear:both;">
	</div>
	
<!-- 	<div class="issue"> -->
		
<!-- 	</div> -->
	
	<div class="expectLine" >
	
	<div class="comment_area" id="comment_holder">
<!-- 댓글 -->
					<div class="comment_area">
						<ul class="reply_box">
							</ul>

						<div class="cmtPagination">
						
						
						</div>
						
					</div>
					<!-- //댓글 -->


</div>
	
	
	
	
	</div>
	
	</div>		
	
		
	   
			
											
</div>

	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<p class="modal-title" id="myModalLabel"><i class="fas fa-pastafarianism yellowTheme"></i> 블라인드 처리</p>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
		
			<div class="modal-body">
			<form>
					
				
					 
					 <div class="mt-3 mb-0">
					 <label class="m-4">처리사유</label>
						<select class="m-3" name="blind_reason">
						<option value="0">욕설 등 불건전한 내용</option>
						<option value="1">정치적 성향이 강한 내용</option>
						<option value="2">비방, 명예훼손의 내용</option>
						<option value="3">도배성 게시글</option>
						<option value="4">상업성을 띄는 광고글</option>
						</select>
					 </div>
					 
					 <input type="hidden" name="commentNo" value="">
					 <div class="blindInfo mb-2">
					 <span id="userId"> </span>
					 <span id="cmtDate"></span>
					 </div>
					<div id="content">
					</div>			
								
					 </form>
			</div>
		
			<div class="modal-footer">
				<button type="button" class="btn" id="addBlindBtn">확인</button>
				<button type="button" class="btn" id="closeModalBtn">취소</button>
			</div>
		</div>
	</div>

	</div>






		
<!-- 	container 닫는 애  -->


		

 </body>
 
 </html>
 