<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	jQuery...  -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <!-- fontawesome CDN -->
    <script src="https://kit.fontawesome.com/e464a52b8d.js" crossorigin="anonymous"></script>

<!-- 	Google web font -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!--     Common Css -->
    <link rel="stylesheet" href="/resources/css/common.css?after">
	    
    <link rel="stylesheet" href="/resources/css/payment.css?after">
    
<title>Insert title here</title>
</head>
<body>

<h4> Point List </h4>

<div class="container mt-2">
  <div>
   <h5 class="text-right">Total Point : ${totalPoint}</h5>
  </div>
	<div>
		<table class="table table-hover text-center">
		  <thead class="thead-dark">
		    <tr >
		      <th scope="col">적립/사용 일자</th>
		      <th scope="col">포인트 구분</th>
		      <th scope="col">적립/사용 포인트</th>
		    </tr>
		  </thead>
		  <tbody>
	          
	<!--         list size만큼 for문으로 Point 내역 출력  -->
	        <c:forEach var="point" items="${list}">
		      <tr >
		        <th scope="col">${point.pointDate}</th>
		        <td scope="col">
		        
		        <c:set var = "pointStatus" value="${point.pointStatus}"/>
		        <c:if test="${fn:contains(pointStatus, '적립')}">
			       <div class = "badge saving text-wrap" style="width: 6rem;"> ${point.pointStatus}</div>
		        </c:if>
		        <c:if test="${fn:contains(pointStatus, '사용')}">
			       <div class = "badge using text-wrap" style="width: 6rem;"> ${point.pointStatus}</div>
		        </c:if>
		        
		        </td>
		        <td scope="col">
		        
   		        <c:if test="${fn:contains(pointStatus, '적립')}">
			       <div class = ""> ${point.partPoint} (p)</div>
		        </c:if>
		        <c:if test="${fn:contains(pointStatus, '사용')}">
			       <div class = "text-danger"> ${point.partPoint} (p)</div>
		        </c:if>
		        </td>
		      </tr>
	        </c:forEach>  
	          
	          
		  </tbody>
		</table> 
	</div>
</div>    

</body>
</html>