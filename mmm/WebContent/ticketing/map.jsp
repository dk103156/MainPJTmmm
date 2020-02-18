<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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
		
		  
	/* �ʿ� ���� ��ġ ��� */
	if(navigator.geolocation) {
           
           navigator.geolocation.getCurrentPosition(success, error, {enableHighAccuracy: true, maximumAge : 0});
	}//end of if
        
	
	// ���� ��ġ �ҷ����°� �����ߴٸ�	
	function success(position) {
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
			level: 3,
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
		marker.setMap(map);
		
		var cgvLogo ="../resources/image/kakaoMapIcon/CGV.png";
		var lotteLogo ="../resources/image/kakaoMapIcon/lotte.png";
		var megaLogo ="../resources/image/kakaoMapIcon/MegaBox.png";
		
		//theater List ajax�� �ҷ����� Marker�� ǥ��
		var theaterMarkerArray = new Array();
		var jqxhr = $.getJSON( "/ticketing/json/getTheaterList", function() {
			  console.log( "success" );
			})
			  .done(function(theaters) {
			     theaters.forEach(
			    	theater => {
			    		//�ΰ� �ޱ�
			    		if(theater.franchise=='CGV'){
			    			var icon = new kakao.maps.MarkerImage(cgvLogo, new kakao.maps.Size(50, 50));
			    		}else if(theater.franchise=='�Ե��ó׸�'){
			    			var icon = new kakao.maps.MarkerImage(lotteLogo, new kakao.maps.Size(80, 80));
			    		}else if(theater.franchise=='�ް��ڽ�'){
			    			var icon = new kakao.maps.MarkerImage(megaLogo, new kakao.maps.Size(50, 50));
			    		}
			    		//���� ��Ŀ ����
			    		var theaterMarker = new kakao.maps.Marker({
			    		    map: map,
			    		    position: new kakao.maps.LatLng(theater.positionY, theater.positionX),
			    		 	image: icon
			    		});
			    		
			    		theaterMarkerArray.push(theaterMarker);
			    		//���� ��Ŀ ǥ��
			    		theaterMarker.setMap(map);
						
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
			    	}//end of forEach inner Function		 
			     )//end of for Each
			  })// end of done
		
		
	  var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
	  var moveLine; // ���� �׷����� ������ ���콺 �����ӿ� ���� �׷��� �� ��ü �Դϴ�
	  var clickLine // ���콺�� Ŭ���� ��ǥ�� �׷��� �� ��ü�Դϴ�
	  var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
	  var dots = {}; // ���� �׷����� ������ Ŭ���� ������ Ŭ�� ������ �Ÿ��� ǥ���ϴ� Ŀ���� �������� �迭�Դϴ�.
		
			
		//���� ��ġ�� ������ ��Ŀ
		var markerArray = new Array();
		
		// �ʿ� Ŭ�� �̺�Ʈ �߰�
		// ������ Ŭ���ϸ� �� �׸��Ⱑ ���۵˴ϴ� �׷��� ���� ������ ����� �ٽ� �׸��ϴ�
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			markerArray.forEach(
				marker => {marker.setMap(null);}		
			)//end of forEach
			// Ŭ���� ����, �浵 ������ �����ɴϴ�  
			var latlng = mouseEvent.latLng; 
            
			//�� ��Ŀ�� ǥ���մϴ�
			var newMarker = new kakao.maps.Marker({ 
			    
			    position: latlng
			}); 
		    
			newMarker.setMap(map);
			
			markerArray.push(newMarker);
			// ���콺�� Ŭ���� ��ġ�Դϴ� 
		    var clickPosition = mouseEvent.latLng;
		 	
		    // ���� Ŭ���̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� ���°� �ƴϸ�
		    if (!drawingFlag) {

		        // ���¸� true��, ���� �׸����ִ� ���·� �����մϴ�
		        drawingFlag = true;
		        
		        // ���� ���� ���� ǥ�õǰ� �ִٸ� �������� �����մϴ�
		        deleteClickLine();
		        
		        // ���� ���� Ŀ���ҿ������̰� ǥ�õǰ� �ִٸ� �������� �����մϴ�
		        deleteDistnce();

		        // ���� ���� ���� �׸��� ���� Ŭ���� ������ �ش� ������ �Ÿ������� ǥ�õǰ� �ִٸ� �������� �����մϴ�
		        deleteCircleDot();
		    
		        // Ŭ���� ��ġ�� �������� ���� �����ϰ� �������� ǥ���մϴ�
		        clickLine = new kakao.maps.Polyline({
		            map: map, // ���� ǥ���� �����Դϴ� 
		            path: [clickPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
		            strokeWeight: 3, // ���� �β��Դϴ� 
		            strokeColor: '#db4040', // ���� �����Դϴ�
		            strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
		            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
		        });
		        
		        // ���� �׷����� ���� �� ���콺 �����ӿ� ���� ���� �׷��� ��ġ�� ǥ���� ���� �����մϴ�
		        moveLine = new kakao.maps.Polyline({
		            strokeWeight: 3, // ���� �β��Դϴ� 
		            strokeColor: '#db4040', // ���� �����Դϴ�
		            strokeOpacity: 0.5, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
		            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�    
		        });
		    
		        // Ŭ���� ������ ���� ������ ������ ǥ���մϴ�
		        displayCircleDot(clickPosition, 0);

		            
		    } else { // ���� �׷����� �ִ� �����̸�

		        // �׷����� �ִ� ���� ��ǥ �迭�� ���ɴϴ�
		        var path = clickLine.getPath();

		        // ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
		        path.push(clickPosition);
		        
		        // �ٽ� ���� ��ǥ �迭�� �����Ͽ� Ŭ�� ��ġ���� ���� �׸����� �����մϴ�
		        clickLine.setPath(path);

		        var distance = Math.round(clickLine.getLength());
		        displayCircleDot(clickPosition, distance);
		    }
		});
		    
		// ������ ���콺���� �̺�Ʈ�� ����մϴ�
		// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �������� �����ֵ��� �մϴ�
		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

		    // ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
		    if (drawingFlag){
		        
		        // ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
		        var mousePosition = mouseEvent.latLng; 

		        // ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
		        var path = clickLine.getPath();
		        
		        // ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
		        var movepath = [path[path.length-1], mousePosition];
		        moveLine.setPath(movepath);    
		        moveLine.setMap(map);
		        
		        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
		            content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">' + distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�
		        
		        // �Ÿ������� ������ ǥ���մϴ�
		        showDistance(content, mousePosition);   
		    }             
		});                 

		// ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
		// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
		kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

		    // ���� ������ Ŭ�� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
		    if (drawingFlag) {
		        
		        // ���콺����� �׷��� ���� �������� �����մϴ�
		        moveLine.setMap(null);
		        moveLine = null;  
		        
		        // ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
		        var path = clickLine.getPath();
		    
		        // ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
		        if (path.length > 1) {

		            // ������ Ŭ�� ������ ���� �Ÿ� ���� Ŀ���� �������̸� ����ϴ�
		            if (dots[dots.length-1].distance) {
		                dots[dots.length-1].distance.setMap(null);
		                dots[dots.length-1].distance = null;    
		            }

		            var distance = Math.round(clickLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
		                content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�
		                
		            // �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
		            showDistance(content, path[path.length-1]);  
		             
		        } else {
					markerArray.forEach(
							marker => {marker.setMap(null);}		
						)//end of forEach
		            // ���� �����ϴ� ��ǥ�� ������ 1�� �����̸� 
		            // ������ ǥ�õǰ� �ִ� ���� �������� �������� �����մϴ�.
		            deleteClickLine();
		            deleteCircleDot(); 
		            deleteDistnce();

		        }
		        
		        // ���¸� false��, �׸��� �ʰ� �ִ� ���·� �����մϴ�
		        drawingFlag = false;          
		    }  
		});    

		// Ŭ������ �׷��� ���� �������� �����ϴ� �Լ��Դϴ�
		function deleteClickLine() {
		    if (clickLine) {
		        clickLine.setMap(null);    
		        clickLine = null;        
		    }
		}

		// ���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
		// ���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
		function showDistance(content, position) {
		    
		    if (distanceOverlay) { // Ŀ���ҿ������̰� ������ �����̸�
		        
		        // Ŀ���� ���������� ��ġ�� ǥ���� ������ �����մϴ�
		        distanceOverlay.setPosition(position);
		        distanceOverlay.setContent(content);
		        
		    } else { // Ŀ���� �������̰� �������� ���� �����̸�
		        
		        // Ŀ���� �������̸� �����ϰ� ������ ǥ���մϴ�
		        distanceOverlay = new kakao.maps.CustomOverlay({
		            map: map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
		            content: content,  // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
		            position: position, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
		            xAnchor: 0,
		            yAnchor: 0,
		            zIndex: 3  
		        });      
		    }
		}

		// �׷����� �ִ� ���� �ѰŸ� ������ 
		// �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
		function deleteDistnce () {
		    if (distanceOverlay) {
		        distanceOverlay.setMap(null);
		        distanceOverlay = null;
		    }
		}

		// ���� �׷����� �ִ� ������ �� ������ Ŭ���ϸ� ȣ���Ͽ� 
		// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� ǥ���ϴ� �Լ��Դϴ�
		function displayCircleDot(position, distance) {

		    // Ŭ�� ������ ǥ���� ���� ���׶�� Ŀ���ҿ������̸� �����մϴ�
		    var circleOverlay = new kakao.maps.CustomOverlay({
		        content: '<span class="dot"></span>',
		        position: position,
		        zIndex: 1
		    });

		    // ������ ǥ���մϴ�
		    circleOverlay.setMap(map);

		    if (distance > 0) {
		        // Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
		        var distanceOverlay = new kakao.maps.CustomOverlay({
		            content: '<div class="dotOverlay">�Ÿ� <span class="number">' + distance + '</span>m</div>',
		            position: position,
		            yAnchor: 1,
		            zIndex: 2
		        });

		        // ������ ǥ���մϴ�
		        distanceOverlay.setMap(map);
		    }

		    // �迭�� �߰��մϴ�
		    dots.push({circle:circleOverlay, distance: distanceOverlay});
		}

		// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
		function deleteCircleDot() {
		    var i;

		    for ( i = 0; i < dots.length; i++ ){
		        if (dots[i].circle) { 
		            dots[i].circle.setMap(null);
		        }

		        if (dots[i].distance) {
		            dots[i].distance.setMap(null);
		        }
		    }

		    dots = [];
		}

		// ���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
		// �׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
		// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
		function getTimeHTML(distance) {

		    // ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
		    var walkkTime = distance / 67 | 0;
		    var walkHour = '', walkMin = '';

		    // ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
		    if (walkkTime > 60) {
		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>�ð� '
		    }
		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

		    // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
		    var content = '<ul class="dotOverlay distanceInfo">';
		    content += '    <li>';
		    content += '        <span class="label">�ѰŸ�</span><span class="number">' + distance + '</span>m';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">����</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '</ul>'

		    return content;
		}
		
		
			
			$("#addTheater").on("click",function(){
				console.log("�۵��� �ϴµ� ���̾� �׽�Ʈ�� �ʿ���")
				var theaterName = $("#myModalTitle").text();
				
				if( $("#likeTheater1 option:selected").val() == null){
					$("#likeTheater1 option").each(
						option => {
							if( $(option).text()==theaterName ){
								$(option).attr("selected",true);
							}
						}//end of option		
					)//end of each
				}else if( $("#likeTheater2 option:selected").val() == null){
					$("#likeTheater2 option").each(
							option => {
								if( $(option).text()==theaterName ){
									$(option).attr("selected",true);
								}
							}//end of option		
						)//end of each				
				}else if( $("#likeTheater3 option:selected").val() == null){
					$("#likeTheater3 option").each(
							option => {
								if( $(option).text()==theaterName ){
									$(option).attr("selected",true);
								}
							}//end of option		
						)//end of each					
				}else{
					alert("��ȣ ������ ��� ���õǾ����ϴ�.");
				}
			});//end of #addtheater click
	};//end of success
	
	function showPopup(url){
		
		window.open(url, "a", "width=400, height=300, left=100, top=50");
	}

	// ���� ��ġ �ҷ����°� �����ߴٸ�
	function error(err) {
  		console.warn('ERROR(' + err.code + '): ' + err.message);
	};	  

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