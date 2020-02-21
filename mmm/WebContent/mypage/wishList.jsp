<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>위시리스트</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 150px;
	left: 0;
	font-family: 'Noto Sans KR', sans-serif;
}


#contaniner{
	width: 800px;
	display: inline-block;
	vertical-align: middle;
} 

.col-left{
	text-align: left;
}
.movieTitle{
	font-weight : bold;
	overflow: hidden;
    width: 95%;
    color: #222;
    font-size: 16px;
    line-height: 16px;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.releaseDate{
	color: #999999;
    font-size: 12px;
}
.likebg{
	font-size : 15px;
	display:inline-block;
	width : 80px;
	height : 25px;
	background-image: url('/resources/image/likebg.png');
	background-repeat: no-repeat;
	background-size: 80px 25px;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}
.board-list-util:after {
    clear: both;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}

.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    padding-left: 30px;
    line-height: 1.1;
    vertical-align: top;
}

.mypage-infomation+.board-list-util {
    padding: 0;
    margin: 0;
}

.board-list-util .result-count b {
    color: #01738b;
}


.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}

.font-gblue {
    color: #01738b!important;
}

b, strong {
    font-weight: 700;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

</style> 
<script type="text/javascript">

function getWishMovieList(startRowNum, endRowNum){
	$.ajax({
		url : '/user/json/getWishMovieList',
		method : "post",
		datatype : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			startRowNum : startRowNum,
			endRowNum : endRowNum
		}),
		success : function(data) {
			
			$("#wishList").empty();
			
			console.log("=== getWishMovieList success ===");
			console.log(data); // data.wishMovieList => List<Movie>

			if(data.totalCnt > 0){ 
				
				var len = data.wishMovieList.length;
				var num = 1;
				
				for(var i=0; i<len; i++){
					
					if(num%3 == 1){ $("#wishList").append("<div class='row'>") }
					
					$("#wishList").append(
						"<div class='col-md-4'>"
							+"<img src='https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419' width='185' height='260'>"
							+"<br>"
							+data.wishMovieList[i].movieTitle
							+"<br>"
						+"</div>"
					);
					
					if(num%3 == 0){ $("#wishList").append("</div>") }
					
					num++;
				}
			} else { // 조회된 위시 리스트가 없을때
				$("#wishList").append(
					'<div class="no-my-movie-list myLikeMovie myMovieStory" id="noDataDiv">'+
						'<i class="iconset ico-movie-see"></i>'+
						'<p>보고싶은 영화를 담아주세요.</p>'+
					'</div>'		
				)
			}

		}, error : function() {
			console.log("=== getWishMovieList error ===");
		}
	}); //ajax 끝
}

$(function(){
	
	getWishMovieList(1, 10);
	
	$(".cancleWishBtn").on('click',function(){
		if(confirm("취소 하갓소?")){
			console.log("취소!");
		} else {
			console.log("안취소!");
		}			
	});
	
});
</script>
</head>
<body>
<!--container-->
	<div id="contaniner">
	
		<div class="row">
			<h2 class="tit">위시 리스트 </h2>
	<!-- 내가 본 영화 -->
	<div class="board-list-util mySeenMovie myMovieStory">
		<p class="result-count">
			<strong>총 <b class="font-gblue" id="mySeenMovieCnt">0</b> 건</strong>
		</p>
	</div>
			<div class="col-md-4 offset-md-4">
<!-- 				<div class="form-group"> -->
<!-- 					<label for="sorting"></label><a style ="float:right; margin-top: 27px; margin-right: 45px;"><button class="btn btn-primary btn-sm">GO</button></a> -->
<!-- 					<select class="form-control" id="sorting" style="width: 150px; float:center;"> -->
<!-- 					  <option>등록일순</option> -->
<!-- 					  <option>개봉일순</option> -->
<!-- 					</select> -->
<!-- 				 </div> -->
			</div>
		</div>
		
		<div id="wishList"></div>
		
		
		<div class="row">
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
				<br><span class="movieTitle">정직한 후보</span>
				<br><span class="releaseDate">2019.10.23 개봉</span>
				<br><span class="cancleWishBtn"><img src="/resources/image/heart.png" width="20" height="20"></span> <span class="likebg">999,999</span>
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
				<br><span class="movieTitle">정직한 후보</span>
				<br><span class="releaseDate">2019.10.23 개봉</span>
				<br><span class="cancleWishBtn"><img src="/resources/image/heart.png" width="20" height="20"></span> <span class="likebg">999,999</span>
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
				<br><span class="movieTitle">정직한 후보</span>
				<br><span class="releaseDate">2019.10.23 개봉</span>
				<br><span class="cancleWishBtn"><img src="/resources/image/heart.png" width="20" height="20"></span> <span class="likebg">999,999</span>
			</div>
		</div>
		
		
	</div>
	<!--container end-->
</body>
