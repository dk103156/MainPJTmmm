<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- fontawesome-->
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<!-- FullCalendar -->
<link rel="stylesheet" href="../resources/css/daygrid.css">
<link rel="stylesheet" href="../resources/css/fullcalendar.css">
<link rel="stylesheet" href="../resources/css/timegrid.css">
<script src='../resources/javascript/fullcalendar.js'></script>
<script src='../resources/javascript/daygrid.js'></script>
<script src='../resources/javascript/timegrid.js'></script>
<script src='../resources/javascript/interaction.js'></script>



	
	
<script type="text/javascript">


document.addEventListener('DOMContentLoaded', function() {
	var weekList = ['일','월','화','수','목','금','토']; 
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    dateClick: function(info){
	    	  
	              },
	    timeZone: 'UTC',
	    select: function(info) {
	       
	       var check =moment(info.start).format('YYYY-MM-DD');
	       //console.log(check);
	       var today = moment().format('YYYY-MM-DD');
	       //console.log(today);
	       
	       if(check < today){
	    	   //previous date
	    	   //sweet alert 처리
	    	   console.log('이전은 클릭안됨')
	       }else if(check == today){
	    	   //right date
	    	   console.log('출첵가능')
	    	   addAttendance();
	       }else{
				//future date
				//sweet alert 처리
				console.log('미래는 클릭안됨')
	       }
	    },
	    defaultView: 'dayGridMonth',
	    selectable: true,
	    defaultDate: new Date(),
	    header: {
	      left: '',
	      center: 'title',
	      right: ''
	    },
	    eventBorderColor : '#5c6a96',
	     eventBackgroundColor : '#ffffff' ,
	     eventColor : '#5c6a96',
	     titleFormat : function(date) { // title 설정
	    	  return date.date.year +"년 "+(date.date.month +1)+"월"; 
	    	    },
   	    columnHeaderText : function(date) { 
   	    	  return weekList[date.getDay()]; // 헤더 var weekList = ['일','월','화','수','목','금','토']; 
   	    },     
   	    
	  eventSources: 
		  [{
			  events: function(start, callback) {
				  
			      $.ajax({
			        url: "/event/json/getAttendanceRecord",
			     	type :"get",			
					dataType : "json",
					contentType: 'application/json',
					
			          success : function(doc) {
			              callback(doc);
// 			              console.log(doc);

			          }//end of success
			      
			      });//end of ajax
			      
			     
			  } //end of events
			  
		  }], //end of eventSources 
	  });
	 
	  calendar.render();
	  
	});


function addAttendance(){

	var userNo = ${user.userNo};
	
	var datas = JSON.stringify({
		userNo : new String(userNo),
		pointStatus : "S1",
		partPoint : "10"
	});
	
	console.log(datas);
	
	ajaxPromise("/event/json/addAttendance", datas).then(
  	
	()=> {
		console.log("성공");
	}//end of arrow function
   );//end of then
}

function ajaxPromise(url, datas) {
	return new Promise(function (resolve, reject) {
		
		$.ajax({
			type: "POST",
			url: url,				
			data: datas,
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json",
			},
			success : function(result, status) {
				//데이터를 받으면 resolve()호출
				resolve(result);
				console.log(status)
			}//end of success
		
		})//end of ajax
		
		
	}) //end of Promise
	
}//end of function - ajaxPromise


///////////////////////////////////////////////
 






</script>

<style type="text/css">


 body {
		
	    overflow: auto;
	    overflow-y: scroll;
	     margin: 0;
		padding: 0;
		font-size: 14px;
	    letter-spacing: 0;
	    line-height: 1.5;
	    color: #444;
		font-family: 'Noto Sans KR', sans-serif;
		
}
 #calendar{
  max-width: 900px;
  margin: 40px auto;
 }
 
 #contents {
	    width: 100%;
	    margin: 0;
	    padding: 40px 0 0 0;
	}

</style>

</head>
<body>
<div class="container">
<div class="contents">
<h3><i class="fas fa-calendar-check">${user.userId} 님의 출석체크</i></h3>



 <input type="hidden" name="userNo" value="${user.userId}">
<div id="calendar">

</div>
</div>
</div>


</body>
</html>