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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>위시리스트</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

</style> 
</head>
<body>

<!--// contents -->
<div id="contents">
	<h2 class="tit">위시리스트</h2>

	<!--// 위시 리스트 -->
	<!-- my-movie-list -->
	<div class="my-movie-list myLikeMovie myMovieStory">
		<div class="board-list-util">
			<p class="result-count">
				<strong>총 <b class="font-gblue" id="totalCnt">0</b>건</strong>
			</p>
		</div>

		<div class="movie-list myLikeMovie myMovieStory">
			<ol class="list" id="movieList"></ol>
		</div>

		<div class="more-movie-list pt30 myLikeMovie myMovieStory">
			<button type="button" class="button btn-more-like-list">더보기 <i class="iconset ico-btn-more-arr"></i></button>
		</div>

	</div>
	<!--// my-movie-list -->

	<!-- 보고싶어 영화 없을 때 -->
	<div class="no-my-movie-list myLikeMovie myMovieStory" id="noDataDiv">
		<i class="iconset ico-movie-see"></i>
		<p>보고싶은 영화를 담아주세요.</p>
	</div>
	<!--// 위시 리스트 -->
</div>
<!--// contents -->
		

</body>
</html>