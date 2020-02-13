<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>마이페이지</title>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body {
       		background-color: #f9fad4;
            margin-top: 100px;
        }
     </style> 
</head>
<body>

	<!--container-->
	<div id="contaniner" class="bg-bricks">
		<!--contents Area-->
		<div class="form-group" id="contents" style= " clear:both; padding-bottom: 50px;" >
			<div class= sect-common style ="height: 450px; width: 980px;">
				<div class=" mmm wrap"  style ="width:882px; height:390px; background-color: white; padding:60px 40px 0 58px">
					<div class ="sect-person-info">
						<div class ="box-image">
							<span class="thumb-image">
							<img src="/resources/image/profile.PNG" style= " float:left;  width: 135px; height: 135px;"/>
							<!-- <input type="file" class="form-control"   id="prodImage" name="prodImage"> -->
							</span>	
						</div>
						<div class ="box-contents newtype" style= " margin-top:6px; float:right;  width: 600px;">
							<div class="person-info">
								<br>
								<Strong>유저이름! ${user.userName}</Strong>
								<em>유저아이디!${user.userId}</em>
								<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
							</div>
							<hr/>
							<div class="grade-info">
								<p style=" margin-top:4px; margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
	
									고객님은   <strong class="txt-purple" >일반!!${user.userGrade}</strong> 입니다.             
	                        
	                   			</p>
	                   			<br>
							</div>
						</div>						
					</div>	
					 <div class="cols-benefit-info">
			        	<div class="col-my-coupon" style="float: left; width: 250px; 155px;	">
			        		<h3>MY COUPON</h3>
			        		<ul>
			                    
			                    <li>
			        				<strong>CGV VIP에 도전하세요!</strong>
			        				<span><a href="/user/vip-lounge/" class="round black1"><i>CGV VIP 혜택보기</i></a></span>
			        			</li>
			                    
			        			<li>
			        				<strong>CGV 할인쿠폰</strong>
			        				<span><em>0</em> 개</span>
			        			</li>
			        			<li>
			        				<strong>영화관람권</strong>
			        				<span><em>0</em> 개</span>
			        			</li>
			        		</ul>
			        	</div>
        				
				</div>
					
			</div>				 
		</div>
		<!--contents Area end-->
	</div>
	<!--container end-->
		 

		
</body>
</html>