<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>

  <!-- īī�� �� api key -->
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
	searchTheater("CGV ����");	
	function searchTheater(keyword){	  
		/* �ʿ� ���� ��ġ ��� */
		if(navigator.geolocation) {
	           
	           navigator.geolocation.getCurrentPosition(success, error, {enableHighAccuracy: true, maximumAge : 0});
		}//end of if
	        
		
		// ���� ��ġ �ҷ����°� �����ߴٸ�	
		function success(position) {
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
				level: 1,
				keyboardShortcuts : true
			};
	
			var map = new kakao.maps.Map(container, options); // ȭ�鿡 �� �߰�
			
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // �Ϲ�-��ī�̺� ���� �߰�
			
			var control = new kakao.maps.ZoomControl(); // �� ��� Ȯ�� �߰�
			map.addControl(control, kakao.maps.ControlPosition.RIGHT);
			
			// ���� ��ġ ��Ŀ �̹���
			var myPosition ="../resources/image/kakaoMapIcon/myPosition.png";
			
			var icon = new kakao.maps.MarkerImage(myPosition, new kakao.maps.Size(100, 100));
			
			// ���� ��ġ ��Ŀ
			var marker = new kakao.maps.Marker({ 
			    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
			    position: map.getCenter(),
			    image: icon
			}); 
			// ������ ��Ŀ�� ǥ���մϴ�
			//marker.setMap(map);
			
			var cgvLogo ="../resources/image/kakaoMapIcon/CGV.png";
			var lotteLogo ="../resources/image/kakaoMapIcon/lotte.png";
			var megaLogo ="../resources/image/kakaoMapIcon/MegaBox.png";
			
			//theater List ajax�� �ҷ����� Marker�� ǥ��
			var theaterMarkerArray = new Array();
			var jqxhr = $.getJSON( "/ticketing/json/getTheaterByName/"+encodeURI(keyword), function() {
				  console.log( "success" );
				})
				  .done( 
				    	theater => {
				    		console.log(theater)
				    		//�ΰ� �ޱ�
				    		if(theater.franchise=='CGV'){
				    			var icon = new kakao.maps.MarkerImage(cgvLogo, new kakao.maps.Size(100, 100));
				    		}else if(theater.franchise=='�Ե��ó׸�'){
				    			var icon = new kakao.maps.MarkerImage(lotteLogo, new kakao.maps.Size(100, 100));
				    		}else if(theater.franchise=='�ް��ڽ�'){
				    			var icon = new kakao.maps.MarkerImage(megaLogo, new kakao.maps.Size(100, 100));
				    		}
				    		//���� ��Ŀ ����
				    		var theaterMarker = new kakao.maps.Marker({
				    		    map: map,
				    		    position: new kakao.maps.LatLng(theater.positionY, theater.positionX),
				    		 	image: icon
				    		});
				    		
				    		theaterMarkerArray.push(theaterMarker);
				    		//���� ��Ŀ ǥ��
				    		//theaterMarker.setMap(new kakao.maps.LatLng(theater.positionY, theater.positionX));
							
				    		map.setCenter(new kakao.maps.LatLng(theater.positionY, theater.positionX));
				    	    var infowindow = new kakao.maps.InfoWindow({
				    	        content: "<span id='infoWindow'>"+theater.theaterName+"</span>" // ���������쿡 ǥ���� ����
				    	    });
				    		
				    		//���� ��Ŀ�� ���������� �ޱ�
				    		kakao.maps.event.addListener(theaterMarker, 'mouseover', function(){
				    			
				    			 infowindow.open(map, theaterMarker);
				    		});
				    		
				    		kakao.maps.event.addListener(theaterMarker, 'mouseout', function(){
				    			
				    			 infowindow.close();
				    		});			    		
				    		//���� ��Ŀ�� Click �̺�Ʈ �ޱ�
				    		kakao.maps.event.addListener(theaterMarker, 'click', function() {
				    			$("#myModalTitle").html("<strong>"+theater.theaterName+"</strong>");
				    			
				    			var bodyHtml = "<p>�ּ�  : "+theater.address+"</p>"
				    				bodyHtml+= "<p>���θ� �ּ� : "+theater.roadAddress+"</p>"
				    				bodyHtml+= "<p>��ȭ��ȣ : "+theater.theaterPhone+"</p>"
				    				bodyHtml+= "<button type='button' id='myModalBodyButton' class='btn btn-link p-0'>������</button>"
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
	
		// ���� ��ġ �ҷ����°� �����ߴٸ�
		function error(err) {
	  		console.warn('ERROR(' + err.code + '): ' + err.message);
		};	  
	}

	/* ��Ŀ Ŭ���ϸ� ���� ���̰�, ��ư �����ÿ� ��ȣ �������� ������ �����ϱ� */
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
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button>
	        <button type="button" class="btn btn-primary" id="addTheater">��ȣ���� �߰��ϱ�</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>