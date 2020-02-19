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

<link rel="stylesheet" href="../resources/css/main.css" media="all">
<link rel="stylesheet" href="../resources/css/megabox.min.css" media="all">
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  	
<title></title>

<style>

</style>

</head>
<body>

<header id="header" class="main-header no-bg">
    <h1 class="ci"><a href="/" title="MEGABOX 메인으로 가기">MEGABOX : Life Theater</a></h1>

	<!-- 브라우저 다운로드 -->
    

    <script type="text/javascript">
    $(function(){
	  	//닫기 버튼 클릭
		$('.ie-update').on('click', '.close-chk .closeDl', function() {
			 if ($(":checkbox[id='one_month_no_update']:checked").length > 0) {
				fn_setCookie("BROWDER_DL", "Y", 30);
			}

			$('.ie-update').hide();
		});

		//다시보지 않기
		 if (fn_getCookie("BROWDER_DL") == null || fn_getCookie("BROWDER_DL") == 'N') {
			if ( $(".lt-ie9").length > 0 && $('.ie-update').length > 0 ) {
				$('.ie-update').show();
			}
		}
    });
    </script>
	<!-- ie-update : ie 9 이하 일때만 출력 -->
	<div class="ie-update">
		<div class="dimd"></div>
		<div class="wrap">
			<p class="tit">
				<img src="../../../static/pc/images/ie/txt-update.png" alt="megabox 홈페이지는 internet explrer10이상에서 최적화된 서비스 이용이 가능합니다. ie9 이하에서는 예매가 정상적으로 진행되지 않을 수 있으니, 브라우저를 업그레이드하시거나 다른 예매수단을 이용해 주세요!">
			</p>

			<div class="box">
				<div class="col">
					<p class="txt">브라우저를 최신 버전으로<br>업그레이드 해보세요!</p>

					<div class="link">
						<a href="https://www.microsoft.com/ko-kr/download/internet-explorer.aspx" title="internet explorer 새 버전 다운로드" target="_blank">
							<img src="../../../static/pc/images/ie/btn-ie.png" alt="internet explorer 새 버전 다운로드">
						</a>
					</div>

					<div class="link">
						<a href="http://www.google.com/chrome?hl=ko" title="chrome 다운로드" target="_blank">
							<img src="../../../static/pc/images/ie/btn-chrome.png" alt="chrome 다운로드">
						</a>
					</div>
				</div>

				<div class="col">
					<p class="txt">megabox 모바일 app을<br>이용해 보세요!</p>

					<div class="link">
						<a href="https://itunes.apple.com/us/app/megabox/id894443858?l=ko&amp;ls=1&amp;mt=8" title="available on the app store" target="_blank">
							<img src="../../../static/pc/images/ie/btn-appstore.png" alt="available on the app store">
						</a>
					</div>

					<div class="link">
						<a href="https://play.google.com/store/apps/details?id=com.megabox.mop&amp;hl=ko" title="available on the google play" target="_blank">
							<img src="../../../static/pc/images/ie/btn-google.png" alt="available on the google play">
						</a>
					</div>
				</div>
			</div>

			<div class="close-chk">
				<input type="checkbox" id="one_month_no_update">
				<label for="one_month_no_update" class="ml05">한 달 동안 이 창을 열지 않음</label>

				<button type="button" class="closeDl button purple x-small ml20">닫기</button>
			</div>
		</div>
	</div>
	<!--// ie-update : ie 9 이하 일때만 출력 -->
    <!--// 브라우저 다운로드 -->

    <!-- topGnb -->
    



	<!-- 2019-04-15 마크업 수정 : 고객요청  -->
    <div class="util-area">
        <div class="left-link">
            <a href="/benefit/viplounge" title="VIP LOUNGE">VIP LOUNGE</a>
            <a href="/benefit/membership" title="멤버십">멤버십</a>
            <a href="/support" title="고객센터">고객센터</a>
        </div>

        <div class="right-link">
            <!-- 로그인전 -->
            <div class="before" style="">
                <a href="javaScript:fn_viewLoginPopup('default','pc')" title="로그인">로그인</a>
                <a href="/join" title="회원가입">회원가입</a>
            </div>

            <!-- 로그인후 -->
            <div class="after" style="display:none">
                <a href="/on/oh/ohg/MbLogin/mbLogout.do" class="" title="로그아웃">로그아웃</a>
                <a href="" class="notice" title="알림">알림</a>

                <!-- layer-header-notice -->
				<div class="layer-header-notice">
					<div class="notice-wrap">
						<p class="tit-notice">알림함</p>

						<div class="count">
							<p class="left">전체 <em class="totalCnt">0</em> 건</p>

							<p class="right">* 최근 30일 내역만 노출됩니다.</p>
						</div>

						<!-- scroll -->
						<div class="scroll m-scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
							<ul class="list">
								<li class="no-list">
									알림 내역이 없습니다.
								</li>
							</ul>
						</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: none; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
						<div class="notice-list-more">
							<button type="button" class="button btn-more-notice-list">더보기 <i class="iconset ico-btn-more-arr"></i></button>
						</div>
						<!--// scroll -->
						<button type="button" class="btn-close-header-notice">알림 닫기</button>
					</div>
					<!--// notice-wrap -->
				<!--// layer-header-notice -->
				</div>

            </div>

            <a href="/booking">빠른예매</a>
        </div>
    </div>
    <!--// 2019-04-15 마크업 수정 : 고객요청  -->

    <div class="link-area">
        <a href="#layer_sitemap" class="header-open-layer btn-layer-sitemap" title="사이트맵">사이트맵</a>
        <a href="#layer_header_search" class="header-open-layer btn-layer-search" title="검색">검색</a>
        <a href="/booking/timetable" class="link-ticket" title="상영시간표">상영시간표</a>
        <a href="#layer_mymega" class="header-open-layer btn-layer-mymega" title="나의 메가박스">나의 메가박스</a>
    </div>

    <!-- gnb -->
    <!--
        2019-04-15 마크업 수정 : 고객요청
        1뎁스 a 태그에 각각 다른 class 추가
    -->
    
    <nav id="gnb" class="">
        <ul class="gnb-depth1">
            <li class=""><a href="/movie" class="gnb-txt-movie" title="영화">영화</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/movie" title="전체영화">전체영화</a></li>
                        <li><a href="/curation/specialcontent" title="큐레이션">큐레이션</a></li>
                        <li><a href="javascript:void(0)" onclick="javascript:MegaboxUtil.Common.moveMovieFilmCheck();" title="영화제">영화제</a></li>
                        <li><a href="/moviepost/all" title="무비포스트">무비포스트</a></li>
                    </ul>
                </div>
            </li>
            <li class=""><a href="/booking" class="gnb-txt-reserve" title="예매">예매</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/booking" title="빠른예매">빠른예매</a></li>
                        <li><a href="/booking/timetable" title="상영시간표">상영시간표</a></li>
                        <li><a href="/booking/privatebooking" title="더 부티크 프라이빗 예매">더 부티크 프라이빗 예매</a></li>
                    </ul>
                </div>
            </li>
            <li class=""><a href="/theater/list" class="gnb-txt-theater" title="극장">극장</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/theater/list" title="전체극장">전체극장</a></li>
                        <li><a href="/specialtheater/list" title="특별관">특별관</a></li>
                    </ul>
                </div>
            </li>
            <li class=""><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;" class="gnb-txt-event" title="이벤트">이벤트</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;" title="진행중 이벤트">진행중 이벤트</a></li>
                        <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event/end');return false;" title="지난 이벤트">지난 이벤트</a></li>
                        <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event/winner/list');return false;" title="당첨자발표">당첨자발표</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('STORE_LIST','/store');return false;" class="gnb-txt-store" title="스토어">스토어</a></li>
            <li class=""><a href="/benefit/membership" class="gnb-txt-benefit" title="혜택">혜택</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/benefit/membership" title="메가박스 멤버십">메가박스 멤버십</a></li>
                        <li><a href="/benefit/discount/guide" title="제휴/할인">제휴/할인</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
    <!--// gnb -->
    <!--// topGnb -->

    <!-- 레이어 : 검색 -->
    <div id="layer_header_search" class="header-layer layer-header-search appendHtml">




        <div class="wrap">
            <a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>

            <div class="tab-rank tab-layer">
                <ul>
                    <li class="on"><button type="button" class="btn">예매율 순</button></li>
                    <li><button type="button" class="btn">누적관객순</button></li>
                    <li><button type="button" class="btn">메가스코어순</button></li>
                </ul>
            </div>

            <div class="rank-cont">
                <p class="img">
                	
                	<img src="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" alt="지푸라기라도 잡고 싶은 짐승들" onerror="noImg(this, 'main');">
                	
                </p>

                <div class="list">
                	<ol>
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01680400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/73/C2E59B-7D34-4220-8D51-580299453B88.large.jpg" onerror="noImg(this, 'main');" title="작은 아씨들 상세보기">작은 아씨들</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01681500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/FE3E8F-2BF8-4720-8A56-E625A3326173.large.jpg" onerror="noImg(this, 'main');" title="정직한 후보 상세보기">정직한 후보</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01685000')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/oQDvW2iARA1zplUjSIq31rlmJWmqZXEa_316.jpg" onerror="noImg(this, 'main');" title="1917 상세보기">1917</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01684900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/8h3sIafHZ4V9auz4WwxE0i9zJkguGEq0_316.jpg" onerror="noImg(this, 'main');" title="사냥의 시간 상세보기">사냥의 시간</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01586400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/37/FC0155-CBED-48D6-B4F8-0F686D79CE86.large.jpg" onerror="noImg(this, 'main');" title="겨울왕국 2 상세보기">겨울왕국 2</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01550200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/07/F2B772-860E-4A3B-873C-F9E1C8C47966.large.jpg" onerror="noImg(this, 'main');" title="기생충 상세보기">기생충</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01659900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/00/4BAEBB-BAB6-48AD-BAA5-17776D485EFE.large.jpg" onerror="noImg(this, 'main');" title="백두산 상세보기">백두산</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('00516400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2013/69/A43ABE-6706-47BF-B0B4-E7AE9BF508AD.large.jpg" onerror="noImg(this, 'main');" title="설국열차 상세보기">설국열차</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01677500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" onerror="noImg(this, 'main');" title="남산의 부장들 상세보기">남산의 부장들</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01543900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/8F/87A6BC-9CB3-48A2-8A10-F28540FE017F.large.jpg" onerror="noImg(this, 'main');" title="[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토 상세보기">[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01674300')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/DD/C041BE-5414-4C37-8CB9-84D7EB06B7D1.large.jpg" onerror="noImg(this, 'main');" title="[싱어롱] 겨울왕국 1+2 상세보기">[싱어롱] 겨울왕국 1+2</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01682200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/caWWzsQ3G9W06rwRKVh6LgGiH634w7AU_316.jpg" onerror="noImg(this, 'main');" title="젠틀맨 상세보기">젠틀맨</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01679600')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/B4/E319A9-1E57-401E-9895-10E89767F257.large.jpg" onerror="noImg(this, 'main');" title="[오페라] 일 트로바토레 상세보기">[오페라] 일 트로바토레</a></li>
	                	
	                	
                	</ol>
                </div>
            </div>

            <div class="header-search-area">
                <input type="text" id="headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="input-text">
                <button type="button" id="btnHeaderSearch" class="btn-search">검색</button>
            </div>

			<form name="headerBoxoForm" id="headerBoxoForm" method="post" onsubmit="return fn_chkHeaderBoxOffice();">
				<input type="hidden" name="searchText" id="searchText">
			</form>



            <div class="ir">
                <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
            </div>
        </div>





        <div class="wrap">
            <a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>

            <div class="tab-rank tab-layer">
                <ul>
                    <li class="on"><button type="button" class="btn">예매율 순</button></li>
                    <li><button type="button" class="btn">누적관객순</button></li>
                    <li><button type="button" class="btn">메가스코어순</button></li>
                </ul>
            </div>

            <div class="rank-cont">
                <p class="img">
                	
                	<img src="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" alt="지푸라기라도 잡고 싶은 짐승들" onerror="noImg(this, 'main');">
                	
                </p>

                <div class="list">
                	<ol>
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01680400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/73/C2E59B-7D34-4220-8D51-580299453B88.large.jpg" onerror="noImg(this, 'main');" title="작은 아씨들 상세보기">작은 아씨들</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01681500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/FE3E8F-2BF8-4720-8A56-E625A3326173.large.jpg" onerror="noImg(this, 'main');" title="정직한 후보 상세보기">정직한 후보</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01685000')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/oQDvW2iARA1zplUjSIq31rlmJWmqZXEa_316.jpg" onerror="noImg(this, 'main');" title="1917 상세보기">1917</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01684900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/8h3sIafHZ4V9auz4WwxE0i9zJkguGEq0_316.jpg" onerror="noImg(this, 'main');" title="사냥의 시간 상세보기">사냥의 시간</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01586400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/37/FC0155-CBED-48D6-B4F8-0F686D79CE86.large.jpg" onerror="noImg(this, 'main');" title="겨울왕국 2 상세보기">겨울왕국 2</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01550200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/07/F2B772-860E-4A3B-873C-F9E1C8C47966.large.jpg" onerror="noImg(this, 'main');" title="기생충 상세보기">기생충</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01659900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/00/4BAEBB-BAB6-48AD-BAA5-17776D485EFE.large.jpg" onerror="noImg(this, 'main');" title="백두산 상세보기">백두산</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('00516400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2013/69/A43ABE-6706-47BF-B0B4-E7AE9BF508AD.large.jpg" onerror="noImg(this, 'main');" title="설국열차 상세보기">설국열차</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01677500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" onerror="noImg(this, 'main');" title="남산의 부장들 상세보기">남산의 부장들</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01543900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/8F/87A6BC-9CB3-48A2-8A10-F28540FE017F.large.jpg" onerror="noImg(this, 'main');" title="[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토 상세보기">[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01674300')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/DD/C041BE-5414-4C37-8CB9-84D7EB06B7D1.large.jpg" onerror="noImg(this, 'main');" title="[싱어롱] 겨울왕국 1+2 상세보기">[싱어롱] 겨울왕국 1+2</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01682200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/caWWzsQ3G9W06rwRKVh6LgGiH634w7AU_316.jpg" onerror="noImg(this, 'main');" title="젠틀맨 상세보기">젠틀맨</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01679600')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/B4/E319A9-1E57-401E-9895-10E89767F257.large.jpg" onerror="noImg(this, 'main');" title="[오페라] 일 트로바토레 상세보기">[오페라] 일 트로바토레</a></li>
	                	
	                	
                	</ol>
                </div>
            </div>

            <div class="header-search-area">
                <input type="text" id="headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="input-text">
                <button type="button" id="btnHeaderSearch" class="btn-search">검색</button>
            </div>

			<form name="headerBoxoForm" id="headerBoxoForm" method="post" onsubmit="return fn_chkHeaderBoxOffice();">
				<input type="hidden" name="searchText" id="searchText">
			</form>



            <div class="ir">
                <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
            </div>
        </div>





        <div class="wrap">
            <a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>

            <div class="tab-rank tab-layer">
                <ul>
                    <li class="on"><button type="button" class="btn">예매율 순</button></li>
                    <li><button type="button" class="btn">누적관객순</button></li>
                    <li><button type="button" class="btn">메가스코어순</button></li>
                </ul>
            </div>

            <div class="rank-cont">
                <p class="img">
                	
                	<img src="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" alt="지푸라기라도 잡고 싶은 짐승들" onerror="noImg(this, 'main');">
                	
                </p>

                <div class="list">
                	<ol>
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01680400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/73/C2E59B-7D34-4220-8D51-580299453B88.large.jpg" onerror="noImg(this, 'main');" title="작은 아씨들 상세보기">작은 아씨들</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01681500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/FE3E8F-2BF8-4720-8A56-E625A3326173.large.jpg" onerror="noImg(this, 'main');" title="정직한 후보 상세보기">정직한 후보</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01685000')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/oQDvW2iARA1zplUjSIq31rlmJWmqZXEa_316.jpg" onerror="noImg(this, 'main');" title="1917 상세보기">1917</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01684900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/8h3sIafHZ4V9auz4WwxE0i9zJkguGEq0_316.jpg" onerror="noImg(this, 'main');" title="사냥의 시간 상세보기">사냥의 시간</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01586400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/37/FC0155-CBED-48D6-B4F8-0F686D79CE86.large.jpg" onerror="noImg(this, 'main');" title="겨울왕국 2 상세보기">겨울왕국 2</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01550200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/07/F2B772-860E-4A3B-873C-F9E1C8C47966.large.jpg" onerror="noImg(this, 'main');" title="기생충 상세보기">기생충</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01659900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/00/4BAEBB-BAB6-48AD-BAA5-17776D485EFE.large.jpg" onerror="noImg(this, 'main');" title="백두산 상세보기">백두산</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('00516400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2013/69/A43ABE-6706-47BF-B0B4-E7AE9BF508AD.large.jpg" onerror="noImg(this, 'main');" title="설국열차 상세보기">설국열차</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01677500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" onerror="noImg(this, 'main');" title="남산의 부장들 상세보기">남산의 부장들</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01543900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/8F/87A6BC-9CB3-48A2-8A10-F28540FE017F.large.jpg" onerror="noImg(this, 'main');" title="[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토 상세보기">[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01674300')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/DD/C041BE-5414-4C37-8CB9-84D7EB06B7D1.large.jpg" onerror="noImg(this, 'main');" title="[싱어롱] 겨울왕국 1+2 상세보기">[싱어롱] 겨울왕국 1+2</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01682200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/caWWzsQ3G9W06rwRKVh6LgGiH634w7AU_316.jpg" onerror="noImg(this, 'main');" title="젠틀맨 상세보기">젠틀맨</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01679600')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/B4/E319A9-1E57-401E-9895-10E89767F257.large.jpg" onerror="noImg(this, 'main');" title="[오페라] 일 트로바토레 상세보기">[오페라] 일 트로바토레</a></li>
	                	
	                	
                	</ol>
                </div>
            </div>

            <div class="header-search-area">
                <input type="text" id="headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="input-text">
                <button type="button" id="btnHeaderSearch" class="btn-search">검색</button>
            </div>

			<form name="headerBoxoForm" id="headerBoxoForm" method="post" onsubmit="return fn_chkHeaderBoxOffice();">
				<input type="hidden" name="searchText" id="searchText">
			</form>



            <div class="ir">
                <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
            </div>
        </div>





        <div class="wrap">
            <a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>

            <div class="tab-rank tab-layer">
                <ul>
                    <li class="on"><button type="button" class="btn">예매율 순</button></li>
                    <li><button type="button" class="btn">누적관객순</button></li>
                    <li><button type="button" class="btn">메가스코어순</button></li>
                </ul>
            </div>

            <div class="rank-cont">
                <p class="img">
                	
                	<img src="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" alt="지푸라기라도 잡고 싶은 짐승들" onerror="noImg(this, 'main');">
                	
                </p>

                <div class="list">
                	<ol>
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01680400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/73/C2E59B-7D34-4220-8D51-580299453B88.large.jpg" onerror="noImg(this, 'main');" title="작은 아씨들 상세보기">작은 아씨들</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01681500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/FE3E8F-2BF8-4720-8A56-E625A3326173.large.jpg" onerror="noImg(this, 'main');" title="정직한 후보 상세보기">정직한 후보</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01685000')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/oQDvW2iARA1zplUjSIq31rlmJWmqZXEa_316.jpg" onerror="noImg(this, 'main');" title="1917 상세보기">1917</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01684900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/8h3sIafHZ4V9auz4WwxE0i9zJkguGEq0_316.jpg" onerror="noImg(this, 'main');" title="사냥의 시간 상세보기">사냥의 시간</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01586400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/37/FC0155-CBED-48D6-B4F8-0F686D79CE86.large.jpg" onerror="noImg(this, 'main');" title="겨울왕국 2 상세보기">겨울왕국 2</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01550200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/07/F2B772-860E-4A3B-873C-F9E1C8C47966.large.jpg" onerror="noImg(this, 'main');" title="기생충 상세보기">기생충</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01659900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/00/4BAEBB-BAB6-48AD-BAA5-17776D485EFE.large.jpg" onerror="noImg(this, 'main');" title="백두산 상세보기">백두산</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('00516400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2013/69/A43ABE-6706-47BF-B0B4-E7AE9BF508AD.large.jpg" onerror="noImg(this, 'main');" title="설국열차 상세보기">설국열차</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01677500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" onerror="noImg(this, 'main');" title="남산의 부장들 상세보기">남산의 부장들</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('01677700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg" onerror="noImg(this, 'main');" title="지푸라기라도 잡고 싶은 짐승들 상세보기">지푸라기라도 잡고 싶은 짐승들</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('01543900')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/8F/87A6BC-9CB3-48A2-8A10-F28540FE017F.large.jpg" onerror="noImg(this, 'main');" title="[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토 상세보기">[응원상영] 킹 오브 프리즘 -샤이니 세븐 스타즈-II 카케루x조지x미나토</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('01674300')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/DD/C041BE-5414-4C37-8CB9-84D7EB06B7D1.large.jpg" onerror="noImg(this, 'main');" title="[싱어롱] 겨울왕국 1+2 상세보기">[싱어롱] 겨울왕국 1+2</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('01682200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2020/02/18/caWWzsQ3G9W06rwRKVh6LgGiH634w7AU_316.jpg" onerror="noImg(this, 'main');" title="젠틀맨 상세보기">젠틀맨</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('01679600')" data-imgsrc="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/B4/E319A9-1E57-401E-9895-10E89767F257.large.jpg" onerror="noImg(this, 'main');" title="[오페라] 일 트로바토레 상세보기">[오페라] 일 트로바토레</a></li>
	                	
	                	
                	</ol>
                </div>
            </div>

            <div class="header-search-area">
                <input type="text" id="headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="input-text">
                <button type="button" id="btnHeaderSearch" class="btn-search">검색</button>
            </div>

			<form name="headerBoxoForm" id="headerBoxoForm" method="post" onsubmit="return fn_chkHeaderBoxOffice();">
				<input type="hidden" name="searchText" id="searchText">
			</form>



            <div class="ir">
                <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
            </div>
        </div>
</div>
    <!--// 레이어 : 검색 -->

    <!-- 레이어 : 마이페이지 -->
    



	<div id="layer_mymega" class="header-layer layer-mymege">
    	<a href="" class="ir" title="나의 메가박스 레이어 입니다.">나의 메가박스 레이어 입니다.</a>

        <!-- wrap -->
        <div class="wrap" style="display:none">

            <div class="login-after">
                <div class="user-info">
                    <p class="txt">안녕하세요!</p>

                    <p class="info">
                        <!--
                            vip 일때만 출력
                            vip 아닐때는 태그 자체 삭제
                        -->
                       <em class="vip">VIP PREMIUM</em>
                        <em class="name"></em>
                        <span>회원님</span>
                    </p>

                    <div class="last-date">마지막 접속일 : <em></em></div>

                    <!-- vip, 멤버십 없을때는 미 출력  -->
                    <div class="membership">
                        <!-- <i class="iconset ico-header-vip"></i>
                        <i class="iconset ico-header-film"></i>
                        <i class="iconset ico-header-classic"></i> -->
                    </div>

                    <div class="btn-fixed">
                        <a href="/mypage" class="button" title="나의  메가박스">나의  메가박스</a>
                    </div>
                </div>

                <div class="box">
                    <div class="point">
                        <p class="tit">Point</p>

                        <p class="count">
                            0
                        </p>

                        <div class="btn-fixed">
                            <a href="/mypage/point-list" class="button" title="멤버십 포인트">멤버십 포인트</a>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="coupon">
                        <p class="tit">쿠폰/관람권 <!-- <i class="iconset ico-header-new"></i> --></p>

                        <p class="count">
                            <em title="쿠폰 수" class="cpon">0</em>
                            <span title="관람권 수" class="movie">0</span>
                        </p>

                        <div class="btn-fixed">
                            <a href="/mypage/discount-coupon" class="button" title="쿠폰">쿠폰</a>
                            <a href="/mypage/movie-coupon" class="button" title="관람권">관람권</a>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="reserve">
                        <p class="tit">예매 <!-- <i class="iconset ico-header-new"></i> --></p>

                        <p class="txt"></p>

                        <div class="btn-fixed">
                            <a href="/mypage/bookinglist" class="button" title="예매내역">예매내역 </a>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="buy">
                        <p class="tit">구매 <!-- <i class="iconset ico-header-new"></i> --></p>

                        <p class="count">
                            <em>0</em>
                            <span>건</span>
                        </p>
                    </div>

                    <div class="btn-fixed">
                        <a href="/mypage/bookinglist?tab=02" class="button" title="구매내역">구매내역</a>
                    </div>
                </div>
            </div>

        	<!-- 로그인 전 -->
            <div class="login-before">
                <p class="txt">
                    로그인 하시면 나의 메가박스를 만날 수 있어요.<br>
                    영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해 보세요!
                </p>

                <div class="mb50">
                    <a href="#layer_login_common" id="moveLogin" title="로그인" class="button w120px btn-modal-open" w-data="850" h-data="484">로그인</a>
                </div>

                <a href="/join" class="link" title="혹시 아직 회원이 아니신가요?">혹시 아직 회원이 아니신가요?</a>
            </div>
        </div>
        <!--// wrap -->

        <div class="ir">
            <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
        </div>
	</div>
    <!--// 레이어 : 마이페이지 -->

</header>

</body>
</html>