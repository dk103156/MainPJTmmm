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
<title>Insert title here</title>
<style type="text/css">
	
div.container {
	font-family: 'Noto Sans KR', sans-serif !important;

}

h2.tit {
    padding: 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}

#contents {
    width: 100%;
    margin: 0;
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


body {
    overflow: auto;

    letter-spacing: 0;
    line-height: 1.5;
    font-size: 16px;
    color: #444;
    font-weight: 400;
    font-family: 'Noto Sans KR', sans-serif;
}

.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 13px;
    line-height: 1.1;
    vertical-align: top;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.mypage-infomation+.board-list-util {
    padding: 0;
    margin: 0;
}


b, strong {
    font-weight: 700;
}

.board-list-util {
    margin: 0 0 15px 0;
    text-align: right;
}

.board-list-util .result-count b {
    color: #01738b;
}
.font-gblue {
    color: #01738b!important;
}

.my-saw-movie {
    line-height: 1.3;
}
.mt10 {
    margin-top: 10px!important;
}

.my-saw-movie ul {
    overflow: hidden;
    margin-bottom: -20px;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.my-saw-movie ul li {
    overflow: hidden;
    float: left;
    position: relative;
    width: 410px;
    height: 190px;
    margin: 0 0 20px 0;
    padding: 0;
}

li.col-md-6 {
    display: list-item;
    text-align: -webkit-match-parent;
    
}



.my-saw-movie ul li .img {
    position: absolute;
    left: 29px;
    top: 30px;
    width: 90px;
    height: 130px;
    font-size: 0;
    line-height: 0;
}

.my-saw-movie ul li .img img {
    width: 100%;
    height: auto;
}

img {
    border: 0;
}

.my-saw-movie p {
    margin: 0;
    padding: 0;
}

.my-saw-movie ul li .cont {
    min-height: 189px;
    padding: 30px 49px 0 149px;
}

.my-saw-movie ul li .cont .tit {
    font-size: 1.2em;
    font-weight: 700;
}

a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}

a {
    background-color: transparent;
}

.my-saw-movie ul li .cont .theater p {
    padding: 6px 0 0 0;
}



</style>

</head>
<body>

<div class="container pl-0" style="margin-top: 50px;">

	<div id="contents" class="mr-1">
		<h2 class="tit"><strong style="font-size : 28px;">내가 본 영화</strong> </h2>
		<!-- 내가 본 영화 -->
		<div class="board-list-util mySeenMovie myMovieStory">
			<p class="result-count">
				<strong>총 <b class="font-gblue" id="mySeenMovieCnt">0</b> 건</strong>
			</p>
		</div>
	
		<!-- my-saw-movie -->
		<div class="my-saw-movie mt10 mySeenMovie myMovieStory">
			<ul class="mySawMovie" id="mySawMovie">
				<c:forEach var="j" items="${dateTimeList}">
				<c:forEach var="i" items="${ticketingList}">
				<c:if test= "${i.dateTimeNo eq j.dateTimeNo}">
					<script>
						var cnt = $("#mySeenMovieCnt").html();
						$("#mySeenMovieCnt").html(parseInt(cnt)+1);
					</script>
					<li class="col-md-6">
						<p class="img posterImg" data-mno="01207400" style="cursor: pointer">
						<img src="${j.poster}" onerror="noImg(this)" alt="">
						</p>
						<div class="cont">        
							<p class="tit">
								<a href="" title="${i.movieName} 상세보기">${i.movieName}</a>
							</p>        
							<div class="theater">        
								<p>${j.theaterName}</p>            
								<p>${j.screenName}</p> 
								<p><fmt:formatDate var="screenDate" value="${j.screenDate }" pattern="yyyy-MM-dd"/>
								   	<fmt:formatDate var="screenTime" value="${j.screenTime }" pattern="HH:mm"/>
									${screenDate} ${screenTime}</p>           
							</div>    
						</div>
					</li>
				</c:if>
				</c:forEach>
				</c:forEach>
			</ul>
		</div><!--// my-saw-movie -->
	
		<nav class="pagination mySeenMovie myMovieStory"></nav><!--// 나의 본영화 -->
	
	</div><!--// contents -->
</div><!--// container -->

</body>
</html>