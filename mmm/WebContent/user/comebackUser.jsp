<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	
	function getParam(key) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var value = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == key) { value = temp[1]; }
	    }
	    return value;
	}

	var status = getParam("status");
	
	if(status=="comeback"){
		comeback();
	}
	

	
	
	

	//회원복구
	$("#comebackBtn").on("click",function(){
		var password= $("#password").val();
		var userId= $("#userId").val();
	
		$.ajax({
			url : '/user/json/updateUserStatus',
			method : "post" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			data : JSON.stringify({
				password : password,	
				userId:userId
			}), 
			success : function(data) {
				console.log("false = pw 일치 X / true = pw 일치 : "+ data);							
				
				if (data == 0) {
						// 0 : 비밀번호가 다름
						$("#passwordChk").text("비밀번호를 확인해주세요.");
						$("#passwordChk").css("color", "red");
						$("#byeconfirmBtn").attr("disabled", true);
				}else{
					$("#passwordChk").text("");
					alert("복구가 완료 되었습니다.")
					self.location="/mypage/mypage.jsp";
				} 
			}, error : function() {
					console.log("실패");
				}
			})//ajax 끝
	
	})//회원복구끝
	
});


	function comeback(){
		$("#staticBackdrop").modal("show");	
	}

</script>


</head>
<body>

<!-- Modal -->
 <form>
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">회원 복구</h5>
	        <button type="button" class="close" data-dismiss="modal" id="Btn" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ${user.userName}님 회원 복구를 하시겠습니까?<br/>
	        	<br/><br/>
	        	비밀번호
	        <input type="password" name="password" id="password">	
	        <input type="hidden" name="userId" id="userId" value="${user.userId }">	
	        <h6 id="passwordChk" style="color: red;"></h6>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary"  id="cancelBtn" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="comebackBtn">복구</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
</form>

</body>
</html>