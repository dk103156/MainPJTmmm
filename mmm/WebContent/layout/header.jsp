<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
	
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

<link rel="stylesheet" id="omb-main-style-css" href="http://demo.aa-team.com/tf/omb/wp-admin/admin-ajax.php?action=omb_frontend_style&amp;ver=4.9.13" type="text/css" media="all">  
<link rel="stylesheet" id="omb-bootstrap-min-css" href="http://demo.aa-team.com/tf/omb/wp-content/themes/omb/css/bootstrap.min.css?ver=4.9.13" type="text/css" media="all"> 
<link rel="stylesheet" id="TMDB-movie-styles-css" href="http://demo.aa-team.com/tf/omb/wp-content/plugins/tmdb/templates/assets/tmdb-style.php?1582201824&amp;ver=4.9.13" type="text/css" media="all">
<link rel="stylesheet" id="aa-megamenu-css" href="http://demo.aa-team.com/tf/omb/wp-content/plugins/mega-menu/assets/menu-core.css?ver=4.9.13" type="text/css" media="all">  
<link rel="stylesheet" id="font-awesome-css" href="http://demo.aa-team.com/tf/omb/wp-content/themes/omb/css/font-awesome.min.css?ver=4.9.13" type="text/css" media="all">

 <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  	
<title></title>

<style>

	.aa-mega-menu-wrap li.menu-item-has-children > a:after {
	    color: #ccc;
	    content: "";
	    font-family: "";
	    font-size: 10px;
	    vertical-align: 0px;
	    margin: 0px 0px 0px 7px;
	    position: relative;
	    top: -3px;
	}

	body, input, select, textarea, header, footer {
	    color: #333;
	   	font-family: 'Noto Sans KR', sans-serif;
	    font-size: 12px;
	    font-weight: bold;
	}

	.logo > img{
		width: 69px;
	    height: 37px;
	}
	
	header .container .omb-menu.content-wrapper .aa-mega-menu-wrap .aa-mega-menu > li > a {
	    padding: 2.0625rem 2.5625rem;
	    border-top: solid 0.125rem transparent;
	    font-size: 0.875rem;
	    font-family: 'Noto Sans KR', sans-serif;
	    letter-spacing: 0.01rem;
	    font-weight: 700;
	    color: #fff;
	    text-transform: uppercase;
	}
	
	
	#aa-mega-menu-item-2914 > a{
		padding-left: 48px;
	}
	
	#aa-mega-menu-item-83 > a{
		padding-left: 42px;
		padding-right: 40px;
	}
	
	#aa-mega-menu-item-45 > a{
	    padding-left: 49px;
	}
	
	header .container .omb-menu.content-wrapper .aa-mega-menu-wrap .aa-mega-menu > li:last-of-type a {
	    padding-right: 35.875px;
	    padding-left: 47px;
	}

	ul, ol {
	    margin-top: 0;
	    margin-bottom: 0px;
	}
	
	a, a span, input, button, .btn, a:after, a span:after, input:after, button:after, .btn:after, a:before, a span:before, input:before, button:before, .btn:before {
    	transition: all -3.0s;
	}
	
	.login{
		color: #242424; 
		border-right: 2px solid #fe9558; 
		padding-right: 7px;	
	}
	
	.join{
		color: #242424; 
		border-right: 2px solid #fe9558; 
		padding-right: 5px; 
		padding-left: 1px;
	}
	
	.myPage{
		color: #242424; 
		border-right: 2px solid #fe9558; 
		padding-right: 6px; 
		padding-left: 2px;
	}
	
	header .container .omb-menu.content-wrapper .aa-mega-menu-wrap .aa-mega-menu > li > a:hover {
	    border-top-color: #ff0000;
	    color: #fee50e;
	}
	
	@media all and (min-width:768px) {
    	.aa-mega-menu{
    		display: block !important;
    	}
	}
</style>

<script type="text/javascript">
$(function(){

	/* 드롭따운쓰 */
	$("#aa-mega-menu-omb-top-menu > li").on("mouseover", function(){ 
		$(this).children().first().next().css("display","block"); 
		
		$(this).on("mouseout",function(){
			$(this).children().first().next().css("display","none"); 
		});					
	});
	
	/* 화면 줄였을때 드롭따운쓰 */
	$("#aa-mega-menu-wrap-omb-top-menu > div > i").on("click", function(){
	
		if($(this).hasClass("on")){
			$(this).removeClass("on");
			$(this).parent().next().css("display","none");	
		}else if(!$(this).hasClass("on")){
			$(this).addClass("on");
			$(this).parent().next().css("display","block");	
			
		}
	
		
	});
	

	
	
	
	

});
</script>

</head>

<body>

	<div style="background-color: #fee50e;">
		<ul class="gnb">                
				<li style="text-align: right; padding-top: 10px; padding-bottom: 10px; padding-right: 5px;">
					<c:choose> 
					    <c:when test="${not empty sessionScope.user }">   
					       <a href="/user/logout" class="login">LOGOUT</a>
					    </c:when>
					    <c:otherwise>    
					       <a href="/user/login" id=mainLoginBtn class="login"><span>LOGIN</span></a>
					    </c:otherwise>                  
					</c:choose>
					<a href="/user/userAuthorization.jsp?type=addUser" class="join"><span>JOIN</span></a>
					<a href="/mypage/mypage" class="myPage"><span>MY PAGE</span></a>
					<a href="/customer/getAskList" class="customer" style="color: #242424; padding-left: 1px;"><span>CUSTOMER CENTER</span></a>
				</li>
		</ul>
	</div>
           
<header>
	<div class="container">

		<span>
				<a class="logo" href="#" title="MMM">
					<img src="../resources/image/logo/movmovmov.jpg" alt="MMM">
				</a>	
		</span>
	
		<div class="omb-menu content-wrapper">
			<div id="aa-mega-menu-wrap-omb-top-menu" class="aa-mega-menu-wrap">
			<div class="aa-mega-menu-brand"><span>Top menu</span> <i class="fa fa-bars"></i></div>
			<ul id="aa-mega-menu-omb-top-menu" class="aa-mega-menu" data-trigger="hover" data-effect="none" data-css3animations="none" style="margin-right: 180px;">
			
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-has-children menu-item-2914 aa-mega-menu-item align-left menu-flyout" id="aa-mega-menu-item-2914">
					<a href="/movie/getBoxOfficeList"><span>MOVIE</span><span class="arrow"> ▼</span></a>
						<ul class="aa-mega-sub-menu we-sidebar" style="right: auto; display: none;">
							<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2902 aa-mega-menu-item" id="aa-mega-menu-item-2902">
								<a href="/movie/getBoxOfficeList">BoxOffice</a>
							</li>
							<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2181 aa-mega-menu-item" id="aa-mega-menu-item-2181">
								<a href="/movie/getExpectedMovieList">상영예정작</a>
							</li>
						</ul>
				</li>
			
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-83 aa-mega-menu-item align-left menu-flyout" id="aa-mega-menu-item-83">
					<a href="/ticketing/addTicketing"><span>TICKETING</span><span class="arrow"> ▼</span></a>
						<ul class="aa-mega-sub-menu we-sidebar" style="right: auto; display: none;">
							<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-188 aa-mega-menu-item" id="aa-mega-menu-item-188">
								<a href="/ticketing/addTicketing">일반예매</a>
							</li>
							<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-372 aa-mega-menu-item" id="aa-mega-menu-item-372">
								<a href="/ticketing/addCompareTicketing">극장별 비교예매</a>
							</li>
						</ul>
				</li>

				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-45 aa-mega-menu-item align-left menu-flyout" id="aa-mega-menu-item-45">
					<a href="/product/getSnackProductList"><span>STORE</span><span class="arrow"> ▼</span></a>
					<ul class="aa-mega-sub-menu we-sidebar" style="right: auto; display: none;">
						<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-652 aa-mega-menu-item" id="aa-mega-menu-item-652">
							<a href="/product/getVoucherList">Voucher</a>
						</li>
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-61 aa-mega-menu-item" id="aa-mega-menu-item-61">
							<a href="/product/getSnackProductList">Snack</a>
						</li>
					</ul>
				</li>

				<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-2120 aa-mega-menu-item align-left menu-flyout" id="aa-mega-menu-item-2120">
					<a href="/event/getPreviewList"><span>EVENT</span><span class="arrow"> ▼</span></a>
					<ul class="aa-mega-sub-menu we-sidebar" style="right: auto; display: none;">
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2053 aa-mega-menu-item" id="aa-mega-menu-item-2053">
							<a href="/event/getPreviewList">시사회이벤트</a>
						</li>
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2114 aa-mega-menu-item" id="aa-mega-menu-item-2114">
							<a href="/event/getQuizList">퀴즈풀기</a>
						</li>
						<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2251 aa-mega-menu-item" id="aa-mega-menu-item-2251">
							<a href="/event/addAttendance">출석체크</a>
						</li>
					</ul>
				</li>
<!-- 
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-285 aa-mega-menu-item align-left menu-flyout" id="aa-mega-menu-item-285">
					<a href="#">#</a>
				</li>
				
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-302 aa-mega-menu-item align-left menu-flyout" id="aa-mega-menu-item-302">
					<a href="#">#</a>
				</li>
 -->
				
				
			</ul>
			</div>			
		</div>
		
	</div>
</header>


</body>
</html>