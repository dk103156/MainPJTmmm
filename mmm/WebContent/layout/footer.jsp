<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
<!--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 -->  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
   
   <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
<title></title>
 
<style>

body {
	font-family: 'Noto Sans KR', sans-serif !important;
}

#footer {
    position: relative;
    min-width: 1100px;
    width: 100%;
    height: 184px;
    margin: 0;
    padding: 0;
	background-color:  #333;
}

.foo_div > a > img {
    width: 109px;
    height: 107px;
    border-radius: 50%;
    margin-top: 40px;
    margin-left: 30px;
}

.foo_div {
	float: left;
}

.foo_div1 {
	text-align: center;
}

.foo_div1 span {
	font-size: 15px;
	color: white;
}

.foo_div1 p {
	margin-top: 5px;
	color: white;
}


.foo_div1 div:nth-child(1) {
	margin-bottom: 10px;
}

.foo_div1 div > a > img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-top: 15px;
}

</style>


</head>



</head>
<body>

<footer id="footer" style="top: 25px;">
	    <div class="foo_div">
	    	<a href="/main" title="MMM"><img src="../resources/image/logo/logo.png"></a>
	    </div>
	    <div class="foo_div1" style="margin-right: 88px;">
		    <div class="3Sa_Logo">	    
		    	<a href="http://www.cgv.co.kr/" target="_blank"><img alt="" src="../resources/image/logo/CGV.png" style="margin-right: 50px;"></a> 
		    	<a href="https://www.lottecinema.co.kr/" target="_blank"><img alt="" src="../resources/image/logo/LotteCinema.png" style="margin-right: 50px;"></a>
		    	<a href="https://www.megabox.co.kr/" target="_blank"><img alt="" src="../resources/image/logo/MegaBox.jpg"></a>
		    </div>	
		    <div class="copyright">    
		    	<span>(주) MMM</span> <span> | </span>
		    	<span>대표 :  GETSET 조</span> <span> | </span>
		    	<span>사업자 등록번호 : 000-00-00000</span>
		    	<p>주소 : 대한민국 어디엔가 사는!</p>
		    	<p style="padding-left: 138px;">뭅 ? 뭅 ! 뭅</p>
	    	</div>
	    </div>
</footer>
    
</body>
</html>