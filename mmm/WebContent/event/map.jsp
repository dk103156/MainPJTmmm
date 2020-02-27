<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>

  <!-- 카카오 맵 api key -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e195c747986bcc9e0da58dd2ded5409c"></script>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
 <style>
 

 		

 	
 	
 	#infoWindow{
 		  white-space: nowrap; 
		  width: 50px; 
		  overflow: hidden;
		  text-overflow: ellipsis; 	
 	}
 	
 	.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
	.distanceInfo .label {display:inline-block;width:50px;}
	.distanceInfo:after {content:none;}
 
 </style> 
</head>
<body>

	<div id="map" style="width:1138px;height:762px;"></div>
	<script>
	searchTheater("CGV 강남");	
	function searchTheater(keyword){	  
		/* 맵에 현재 위치 찍기 */
		if(navigator.geolocation) {
	           
	           navigator.geolocation.getCurrentPosition(success, error, {enableHighAccuracy: true, maximumAge : 0});
		}//end of if
	        
		
		// 현재 위치 불러오는게 성공했다면	
		function success(position) {
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
				level: 1,
				keyboardShortcuts : true
			};
	
			var map = new kakao.maps.Map(container, options); // 화면에 맵 추가
			
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 일반-스카이뷰 선택 추가
			
			var control = new kakao.maps.ZoomControl(); // 맵 축소 확대 추가
			map.addControl(control, kakao.maps.ControlPosition.RIGHT);
			
			// 현재 위치 마커 이미지
			var myPosition ="../resources/image/kakaoMapIcon/myPosition.png";
			
			var icon = new kakao.maps.MarkerImage(myPosition, new kakao.maps.Size(100, 100));
			
			// 현재 위치 마커
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter(),
			    image: icon
			}); 
			// 지도에 마커를 표시합니다
			//marker.setMap(map);
			
			var cgvLogo ="../resources/image/kakaoMapIcon/CGV.png";
			var lotteLogo ="../resources/image/kakaoMapIcon/lotte.png";
			var megaLogo ="../resources/image/kakaoMapIcon/MegaBox.png";
			
			//theater List ajax로 불러오고 Marker로 표시
			var theaterMarkerArray = new Array();
			var jqxhr = $.getJSON( "/ticketing/json/getTheaterByName/"+encodeURI(keyword), function() {
				  console.log( "success" );
				})
				  .done( 
				    	theater => {
				    		console.log(theater)
				    		//로고 달기
				    		if(theater.franchise=='CGV'){
				    			var icon = new kakao.maps.MarkerImage(cgvLogo, new kakao.maps.Size(100, 100));
				    		}else if(theater.franchise=='롯데시네마'){
				    			var icon = new kakao.maps.MarkerImage(lotteLogo, new kakao.maps.Size(100, 100));
				    		}else if(theater.franchise=='메가박스'){
				    			var icon = new kakao.maps.MarkerImage(megaLogo, new kakao.maps.Size(100, 100));
				    		}
				    		//극장 마커 생성
				    		var theaterMarker = new kakao.maps.Marker({
				    		    map: map,
				    		    position: new kakao.maps.LatLng(theater.positionY, theater.positionX),
				    		 	image: icon
				    		});
				    		
				    		theaterMarkerArray.push(theaterMarker);
				    		//극장 마커 표시
				    		//theaterMarker.setMap(new kakao.maps.LatLng(theater.positionY, theater.positionX));
							
				    		map.setCenter(new kakao.maps.LatLng(theater.positionY, theater.positionX));
				    	    var infowindow = new kakao.maps.InfoWindow({
				    	        content: "<span id='infoWindow'>"+theater.theaterName+"</span>" // 인포윈도우에 표시할 내용
				    	    });
				    		
				    		//극장 마커에 인포윈도우 달기
				    		kakao.maps.event.addListener(theaterMarker, 'mouseover', function(){
				    			
				    			 infowindow.open(map, theaterMarker);
				    		});
				    		
				    		kakao.maps.event.addListener(theaterMarker, 'mouseout', function(){
				    			
				    			 infowindow.close();
				    		});			    		
				    		//극장 마커에 Click 이벤트 달기
				    		kakao.maps.event.addListener(theaterMarker, 'click', function() {
				    			$("#myModalTitle").html("<strong>"+theater.theaterName+"</strong>");
				    			
				    			var bodyHtml = "<p>주소  : "+theater.address+"</p>"
				    				bodyHtml+= "<p>도로명 주소 : "+theater.roadAddress+"</p>"
				    				bodyHtml+= "<p>전화번호 : "+theater.theaterPhone+"</p>"
				    				bodyHtml+= "<button type='button' id='myModalBodyButton' class='btn btn-link p-0'>상세정보</button>"
				    			$("#myModalBody").html(bodyHtml);
				    			$("#myModalBodyButton").on("click",function(){
				    				showPopup(theater.placeUrl);
				    			});	
				    			$('#myModal').modal('show')
				    			
				    			
				    		});//end of theaterMarker event click
				    	})//end of forEach inner Function		 
				     
		};//end of success
		
		function showPopup(url){
			
			window.open(url, "a", "width=400, height=300, left=100, top=50");
		}
	
		// 현재 위치 불러오는게 실패했다면
		function error(err) {
	  		console.warn('ERROR(' + err.code + '): ' + err.message);
		};	  
	}

	/* 마커 클릭하면 정보 보이고, 버튼 누를시에 선호 극장으로 데이터 전송하기 */
	</script>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalTitle"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="myModalBody">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="addTheater">선호극장 추가하기</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>