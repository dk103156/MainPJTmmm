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
body {
	background-color: #f9fad4;
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 150px;
	left: 0;
}
#contaniner{
	width: 800px;
	display: inline-block;
	vertical-align: middle;
} 

.col-left{
	text-align: left;
}
</style> 
</head>
<body>
<!--container-->
	<div id="contaniner">
	
		<div class="row">
			<div class="col-md-4 .col-left" style="margin-bottom: 20px;">
				<h3><span class="badge badge-primary">위시리스트</span></h3>
			</div>
			<div class="col-md-4 offset-md-4">
				<div class="form-group">
					<label for="sorting"></label><a style ="float:right; margin-top: 27px; margin-right: 45px;"><button class="btn btn-primary btn-sm">GO</button></a>
					<select class="form-control" id="sorting" style="width: 150px; float:center;">
					  <option>등록일순</option>
					  <option>개봉일순</option>
					</select>

				 </div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
			<div class="col-md-4">
				<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F08bddecf7d26414585157598e5e453031579576516419" width="185" height="260" >
			</div>
		</div>
		<br>
	</div>
	<!--container end-->
</body>
</html>