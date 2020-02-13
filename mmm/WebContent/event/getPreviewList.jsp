<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 
 <title>getPreviewList</title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/javascript" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">

		$(function(){
			
			$('div[name="thumbImage"]').on('click',function(){
				console.log('thumbImage클릭')
				var previewNo = $(this).parent().find("#pn").val();
				alert(previewNo)
				self.location = "/event/getPreview?previewNo="+previewNo;
				
			});
			
			
			$('button[name="winBtn"]').on('click',function(){
				console.log('winBtn클릭')
				var previewNo = $(this).parent().find("#pn").val();
				self.location = "/event/getWinnerList";
				
			});
			
			
			
		})//end of function
		
// 			//div[name="thumbImage"]의 부모의 모든 자식들
			
			
// 			//$('div[name="thumbImage"]').parent().find('div[name="thumbImage"]').on('mouseover', function(){
// 				$("body > div > div.row > div > div > div > img").on('hover', function(enter, leave){
// 					//$("body > div > div.row > div").off("mouseout")
				
// 				var it=$(this)
// 				var fxxk = $.trim(it.parent().html())
// 				var previewNo = $(this).parent().first().next().find("input").val();
				
// 					$.ajax({
// 						url:"/event/json/getPreview/"+previewNo,
// 						method:"GET",
// 						dataType:"json",
// 						headers:{
// 							"Accept" : "application/json",
// 							"Content-Type" : "application/json"
// 						},
// 						success:function(JSONData, status){
// 							console.log(status)
// 							var strings="123";
// 							var string=fxxk
// 							    string+='<div><h3>'+JSONData.previewPlace
// 							    string+=+JSONData.previewName+JSONData.previewDate
// 							    string+='</h3></div>';	
// 							    it.parent().html(strings);

// 						}//end of success					
// 					});//end of ajax 				
// 			}).on('mouseout',function(){
				
// 				console.log(123)
// 			});//end of mouseon
			
	

</script>

	<style>
	
	
	  body > div.container{
            padding-top : 150px;
            font-family: 'Do Hyeon', sans-serif;
        }
        
		.thumbnail{        
		    width: 290px; 
		    // width : 100%;
		    height: 400px;
		    text-align :center;
		}

		.img-thumbnail.mx-auto.d-block{
		    width: 280px;
		    height: 350px;
		    display: block;
		    text-align :center;
		}
		
		#thumbImage {
			width: 290px;
			height: 250px;
			margin: 0px auto;
			text-align : center;
		}
		
		figure {
        width: 100%;
        position: relative;
   		}
	    
	    
	    figure img {
	        display: block;
	        width: 100%;
	        height: auto;
	    }   
	    
	    figure h4 {
	        position: absolute;
	        top: calc(100% - 50px);
	        left: 0;
	        width: 100%;
	        height: 50px;
	        color: #fff;
	        background: rgba(0, 0, 0, 0.6);
	        margin: 0;
	    }   
	    
	    figure .overlay {
	        position: absolute;
	        bottom: 0;
	        left: 0;
	        right: 0;
	        overflow: hidden;
	        width: 100%;
	        height: 0;
	        color: #fff;
	        background: rgba(0, 0, 0, 0.6);
	        -webkit-transition: .6s ease;
	        transition: .6s ease;
	    }
	    
	    figure .overlay .description {
	        font-size: 18px;
	        position: relative;
	        top: 50%;
	        left: 50%;
	        padding: 0px;
	        -webkit-transform: translate(-50%, -50%);
	        -ms-transform: translate(-50%, -50%);
	        transform: translate(-50%, -50%);
	        text-align: center;
	    }
	    
	    figure:hover h4 {
	        display: none;
	    }   
	    
	    figure:hover .overlay {
	        display: block;
	        height: 100%;
	    }
	    button.btn.btn-primary {
		  display: block;
		  margin-left: 10;
		}
		
		img {
		
		}
    
	   </style>
</head>

<body>


<div class="container">
 		<br>
		<div class="page-header text-secondary">
	       <h3>시사회 응모 이벤트</h3><hr>
	       <br>
	    </div>
	 	
	 	<div class="row">
	    	
		<c:set var="i" value="0" />
		 <c:forEach var="preview" items="${list}">
		  <div class="col-sm-6 col-md-4">
		    <form>
		    <div class="thumbnail">
	    	<div name="thumbImage">
	    	<figure>
	    	
	    	
		 		<img class="img-thumbnail mx-auto d-block" src= "/resources/image/${preview.previewImage}" >
		        <h4>${preview.previewName}</h4>
		        <div class="overlay">
		        	<div class="description">
		        	${preview.previewName}<br>
		        	${preview.previewPlace}<br>
		        	${preview.preDate}
		        	${preview.previewTime}
		     <input type="hidden" id="pn" value="${preview.previewNo}">
		        	</div>
		        </div>
		 	</figure>
		 
		 	</div> 
		 ${preview.previewFlag}     
		   </div> 
		   </form>
		  </div>
		   </c:forEach>
		</div>
	    
	    
	    
 </div>
</body>
</html>
