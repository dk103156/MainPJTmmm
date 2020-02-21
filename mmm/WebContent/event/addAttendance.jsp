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
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    dateClick: function(info){
	    	alert('1d11Clicked on:'+info.dateStr);
	    },
	    select: function(start, end, allDay) {
	        var check = $.calendar.formatDate(start,'yyyy-MM-dd');
	        var today = $.calendar.formatDate(new Date(),'yyyy-MM-dd');
	        console.log(check);
	        console.log(today);
	        if(check < today)
	        {
	           alert('aaaa')
	        }
	        else
	        {
	           alert('bbb')
	        }
	      },

// 	    validRange:function(nowDate){
// 	    	return {
// 	    		start: nowDate
// 	    		}
// 	    },
	    selectConstraint: {
	    },
	    defaultView: 'dayGridMonth',
	    selectable: true,
	    defaultDate: new Date(),
	    header: {
	      left: '',
	      center: 'title',
	      right: ''
	    },
	  });
	  calendar.render();
	});


function addAttendance(){

	alert('비슷한편');
}

///////////////////////////////////////////////
 






</script>

<style type="text/css">


 body {
		
	    overflow: auto;
	    overflow-y: scroll;
	    letter-spacing: 0;
	    line-height: 1.5;
	    font-size: 15px;
	    color: #444;
	    font-weight: 400;
		font-family: 'Noto Sans KR', sans-serif;
		
}
 #calendar{
 	width: 700px;
 }

</style>

</head>
<body>
<div class="container">

<i class="fas fa-calendar-check">출석체크</i>

<div id="calendar">

</div>
</div>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  출석체크
</button>


</body>
</html>