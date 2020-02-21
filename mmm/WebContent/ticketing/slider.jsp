<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.slide_wrap { 
		position: relative; 
		width: 400px; margin: auto; 
		padding-bottom: 30px; 
	}
	
	.slide_box { 
		width: 100%; 
		margin: auto; 
		overflow-x: hidden; 
	}
	
	.slide_content { 
		display: table; 
		float: left; 
		width: 400px; 
		height: 400px; 
	}



</style>
</head>
<body>



<div id="container">
	<div class="slide_wrap">
		<div class="slide_box">
			<div class="slide_list clearfix">
				<div class="slide_content slide01">
					<p>1</p>
				</div>
				<div class="slide_content slide02">
					<p>2</p>
				</div>
				<div class="slide_content slide03">
					<p>3</p>
				</div>
				<div class="slide_content slide04">
					<p>4</p>
				</div>
				<div class="slide_content slide05">
					<p>5</p>	
				</div>
			</div><!-- // .slide_list -->
		</div><!-- // .slide_box -->
		
		<div class="slide_btn_box">
			<button type="button" class="slide_btn_prev">Prev</button>
			<button type="button" class="slide_btn_next">Next</button>
		</div><!-- // .slide_btn_box -->
	<ul class="slide_pagination"></ul><!-- // .slide_pagination -->
	</div><!-- // .slide_wrap -->
</div><!-- // .container -->


<script>
const slideList = document.querySelector('.slide_list'); // Slide parent dom
const slideContents = document.querySelectorAll('.slide_content'); // each slide dom
const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
const slideLen = slideContents.length; // slide length
const slideWidth = 400; // slide width
const slideSpeed = 300; // slide speed
const startNum = 0; // initial slide index (0 ~ 4)

slideList.style.width = slideWidth * (slideLen + 2) + "px";
// Copy first and last slide
let firstChild = slideList.firstElementChild;
let lastChild = slideList.lastElementChild;
let clonedFirst = firstChild.cloneNode(true);
let clonedLast = lastChild.cloneNode(true);
// Add copied Slides
slideList.appendChild(clonedFirst);
slideList.insertBefore(clonedLast, slideList.firstElementChild);
slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";
let curIndex = startNum; // current slide index (except copied slide)
let curSlide = slideContents[curIndex]; // current slide dom
curSlide.classList.add('slide_active');
/** Next Button Event */
slideBtnNext.addEventListener('click', function() {
if (curIndex <= slideLen - 1) {
slideList.style.transition = slideSpeed + "ms";
slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
}
if (curIndex === slideLen - 1) {
setTimeout(function() {
slideList.style.transition = "0ms";
slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
}, slideSpeed);
curIndex = -1;
}
curSlide.classList.remove('slide_active');
curSlide = slideContents[++curIndex];
curSlide.classList.add('slide_active');
});
/** Prev Button Event */
slideBtnPrev.addEventListener('click', function() {
if (curIndex >= 0) {
slideList.style.transition = slideSpeed + "ms";
slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
}
if (curIndex === 0) {
setTimeout(function() {
slideList.style.transition = "0ms";
slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
}, slideSpeed);
curIndex = slideLen;
}
curSlide.classList.remove('slide_active');
curSlide = slideContents[--curIndex];
curSlide.classList.add('slide_active');
});


출처: https://im-developer.tistory.com/97 [Code Playground]



</script>
</body>
</html>