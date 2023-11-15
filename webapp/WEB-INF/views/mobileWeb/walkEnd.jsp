<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<!-- 모바일용 웹페이지로 변환 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>산책종료</title>
    <!-- 네이버 지도 API 스크립트를 포함합니다. -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b9b0wee2jf"></script>
    <!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/assets/css/mobileWeb/walkEnd.css" rel="stylesheet" type="text/css">	
	
	<!-- 부트스트랩 cdn , 폰트어썸 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<!-- 맵 이미지저장 -->
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
</head>
<body>

	<input type="hidden" name="Time" id="tDataOutput" value="${moWalkLogVo.logTime}">

	<!-- 컨트롤러로 보내서 insert할 데이터들 -->
	<form id="dataForm" action="${pageContext.request.contextPath}/m/walkInsert" method="post">
		<!-- 거리데이터 -->
	    <input type="hidden" name="distance" id="distanceDataInput" value="${moWalkLogVo.distance}">
	    <!-- 소요시간데이터 -->	    
	    <input type="hidden" name="logTime" id="timeDataInput" value="${moWalkLogVo.logTime}">
	    <!-- 시작시간데이터 -->
	    <input type="hidden" name="startTime" id="sTimeDataInput" value="${moWalkLogVo.startTime}">
	    <!-- 종료시간데이터 -->
	    <input type="hidden" name="endTime" id="eTimeDataInput" value="${moWalkLogVo.endTime}">		
	</form>	 
	   
	<div id="allBox">
	
		<!-- 헤더박스 -->
		<div class="headerBox" style="" >
		
			<div class="end" id="text01">산책종료</div>
			
			<div class="recordBox">
				<div class="date" id="text02"> </div>
				<div class="record" id="text02"> 거리:${moWalkLogVo.distance}m  시간: ${moWalkLogVo.logTime} </div>
			</div>							
			
		</div>
		
			
		<!-- 컨텐츠 모음 -->
		<div class="content" >
		
			<!-- 기록된 이동기록이 뜨는 맵 -->
			<div id="map"></div>
			
			<!-- 좌표데이터 -->
	    	<input type="hidden" name="line" id="lineDataInput" value="">
			
			<!-- 기록된 라인과 일치율이 높은 산책로 사진 3개 -->
			<div class="mapImages" >
				<div class="mapNameBox">
					이 산책로를 이용하셨습니다.
		        </div>				
				<div class="mapImageContainer" >
					<div class="mapImageBox">
						<img class="mapImage" src="${pageContext.request.contextPath}/assets/images/map1.jpg"></img>
						<i id="likeIcon" class="fa-solid fa-heart"></i>
						<div class="mapName"> ${trailList[0].name} </div>
						<input type="hidden" name="trail" class="trailDate" value="${trailList[0].trailNo}">
			        </div>
			        <div class="mapImageBox">
						<img class="mapImage" src="${pageContext.request.contextPath}/assets/images/map1.jpg">
						<i id="likeIcon" class="fa-regular fa-heart"></i>
						<div class="mapName"> ${trailList[1].name} </div>
						<input type="hidden" name="trail" class="trailDate" value="${trailList[1].trailNo}">
			        </div>
			        <div class="mapImageBox">
						<img id="mapImageClick" class="mapImage" src="${pageContext.request.contextPath}/assets/images/map1.jpg">
						<i id="likeIcon" class="fa-solid fa-heart"></i>
						<div class="mapName"> ${trailList[2].name} </div>
						<input type="hidden" name="trail" class="trailDate" value="${trailList[2].trailNo}">
			        </div>
				</div>				
			</div>
			
			<!-- 파일첨부 버튼 -->
			<div class="pictures">
			    <label for="fileInput">
			        <i class="fa-regular fa-image"></i>&nbsp; 사진첨부
			    </label>
			    <input type="file" id="fileInput" />
			</div>
			
			<!-- 텍스트작성박스 -->
			<td colspan="1"><textarea  class="textBox" name="content" rows="4" placeholder="내용을 입력해주세요." value="" ></textarea></td>
			
			<!-- 체크박스라인 -->
			<div class="checkBox">
			
				<i class="fa-solid fa-unlock-keyhole"></i>
				
				<div> &nbsp; 비공개로 게시</div>
				
				<label class="switch-button">
					<input type="checkbox"  id="privacyCheckbox" />
				    <span class="onoff-switch"></span>
				</label>
			</div>
			
			<!-- <div class="checkBox">
			
				<i class="fa-brands fa-instagram"></i>
				
				<div> &nbsp; Instagram에 게시</div>
				
				<label class="switch-button">
					<input type="checkbox"/>
				    <span class="onoff-switch"></span>
				</label>
				
			</div> -->
		</div>
		
		
		
		<!-- 작성하기 버튼 -->
		<div class="lastButton">
			<!-- 작성 -->
			<div class="write" id="insertBtn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 기록하기 </div>
			<!-- 취소 -->
			<div class="back"> 기록하지않기 </div>
		</div>	
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">기록되었습니다.</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		     
		      <div class="modal-footer">
		        <button type="button"  class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
	</div>
	
	<!-- js 설정
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/walkEnd.js"></script>	  
    -->
	
	<script th:inline="javascript">
	
		// 날짜표시
		const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
	    document.getElementById("text02").innerHTML = new Date().toLocaleDateString('ko-KR', options);
	
		// 경로로 표시할 배열(array)
		// naver.maps.LatLng 위도 경도 변수
		var polylinePath = [];	
	
		// 컨트롤러에서 전달한 lineList 데이터를 JSON 형식으로 파싱
	    var jsonString = '${lineList}'; // JSON 형식의 문자열
		var lineList = JSON.parse(jsonString);
	    
	    // lineList의 각 항목을 polylinePath 배열에 추가
	    for (var i = 0; i < lineList.length; i++) {
	        var lat = lineList[i].lat;
	        var lng = lineList[i].lng;
	        polylinePath.push(new naver.maps.LatLng(lat, lng));
	    }
	    
	    console.log("내 이동 경로 표시 : " + polylinePath);	  
	    
	    
	  
		// 중간 지점을 계산
		var totalLat = 0;
		var totalLng = 0;

		// 모든 좌표의 합을 계산
		for (var i = 0; i < polylinePath.length; i++) {
		    totalLat += polylinePath[i].y;
		    totalLng += polylinePath[i].x;
		}

		// 평균 좌표 계산
		var avgLat = totalLat / polylinePath.length;
		var avgLng = totalLng / polylinePath.length;

	    //지도 표시
	    var map = new naver.maps.Map('map', {
	        zoom: 18,
	        center: new naver.maps.LatLng(avgLat, avgLng),
			mapDataControl : false,
			scaleControl : false,
			caleControl: false,
	        logoControl: false
	    });

	    //위의 배열을 이용해 라인 그리기
	    var polyline = new naver.maps.Polyline({
	        path: polylinePath,      //선 위치 변수배열
	        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
	        strokeOpacity: 0.8, //선 투명도 0 ~ 1
	        strokeWeight: 6,   //선 두께
	        map: map           //오버레이할 지도
	    });
	    
	 	// 배열 첫번째 위치를 마크로 표시함
	    var firstMarker = new naver.maps.Marker({
		    position: polylinePath[0], // 첫 번째 위치
		    map: map
		});

	    // 배열 마지막 위치를 마크로 표시함
	    var marker = new naver.maps.Marker({
	        position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
	        map: map
	    });
	    	    
	    // 기록하기
	    $(document).ready(function() {
	    	
	    	// 체크박스 상태 변경 감지
	        $('#privacyCheckbox').change(function() {
	            // 체크박스가 체크되어 있으면 '비공개', 그렇지 않으면 '공개'를 콘솔에 출력
	            var status = this.checked ? '비공개' : '공개';
	            console.log(status);
	        });
	    		    	
	    	
	    	$('#fileInput').change(function() {
	            // 최대 4개의 파일을 저장할 배열
	            var files = [];

	            // 선택된 파일들을 배열에 추가 (최대 4개까지)
	            for (var i = 0; i < Math.min(this.files.length, 4); i++) {
	                files.push(this.files[i]);
	            }

	            // 파일 배열을 컨트롤러로 전송할 수 있음
	            console.log("첨부된 파일" + files);
	        });
	    	
		    $("#insertBtn").click(function() {	    	
		    	console.log("기록완료");
		    	
		    	//sendLinePathToController(); 
		    	
		    	console.log("기록된 위치 재확인 1 : " + polylinePath);
		    	console.log("기록된 위치 재확인 2 : " + jsonString);
		    	
		    	console.log("기록된 위치 재확인 3 : " + '${lineList}');		    	
		    	
		    	console.log("산책한 강아지 정보 : " + '${dogNoList}');
		    	
		    	console.log("시작시간 : " + '${moWalkLogVo.startTime}');
		    	var startTime = '${moWalkLogVo.startTime}';
		    	
		    	console.log("종료시간 : " + '${moWalkLogVo.endTime}');
		    	var endTime = '${moWalkLogVo.endTime}';
		    	
		    	console.log("소요시간 : " + '${moWalkLogVo.logTime}');
		    	var logTime = ${moWalkLogVo.logTime};
		    	
		    	console.log("거리 : " + '${moWalkLogVo.distance}');
		    	var distance = ${moWalkLogVo.distance};
		    	
		    	var content = $('.textBox').val();
		    	console.log("글내용 : " + content);
		    	
		    	$.ajax({
		               type: 'POST',
		               url: "${pageContext.request.contextPath}/m/walkInsert",
		             contentType : "application/json",
		               // data: { linePath: JSON.stringify(linePath) },
					    data: JSON.stringify({
					        line: polylinePath,
					        startTime: startTime,
					        endTime: endTime,
					        logTime: logTime,
					        distance: distance
					    }),
		               /* data: {line: jsonString,
		            	      startTime: startTime,
		            	      endTime: endTime,
		            	      logTime: logTime,
		            	      distance: distance
		            	      }, */
		               //traditional: true,
		               success: function (response) {
		                  console.log("기록완료");
		                  window.location.href = "${pageContext.request.contextPath}/m/map";
		               },
		               error: function (error) {
		                 console.error('Error sending data to the controller:', error);
		               }
		        });
		    	
	        	// 폼 제출 
		    	//$("#dataForm").submit();  
	        });
	    }); 	    
	    
	    // 기록하지 않음
	    $(document).ready(function() {
            $(".back").click(function() {
                // 여기에 이동할 링크를 넣어주세요
                window.location.href = "${pageContext.request.contextPath}/m/map";
            });
        }); 
	    
	    // 라인 컨트롤러로 넘기기
        function sendLinePathToController(jsonString) {
             // Replace 'your_controller_url' with the actual URL of your controller
             console.log("기록된 위치 재확인 : " + jsonString);
             
           /*   // JavaScript에서 데이터를 linePathVo와 일치하는 구조로 변환 (x와 y 제외)
             const linePathData = linePath.map(function (point) {
               return {
                 lat: point._lat,
                 lng: point._lng
               };
             });
             
             // JSON형식으로 변환하기
             const jsonData = JSON.stringify(linePathData);
             
             console.log("기록된 위치 데이터 : " + jsonData);

             $.ajax({
               type: 'POST',
               url: "${pageContext.request.contextPath}/m/walkInsert",
             contentType : "application/json",
               // data: { linePath: JSON.stringify(linePath) },
               data: jsonData, 
               //traditional: true,
               success: function (response) {
                  console.log("기록완료");
                  window.location.href = "${pageContext.request.contextPath}/m/map";
               },
               error: function (error) {
                 console.error('Error sending data to the controller:', error);
               }
             }); */
             
           }
	  
	    
	</script>
	
    <script>
        // 네이버 지도 API 스크립트 로딩 후 initMap 함수 호출
        naver.maps.onJSContentLoaded = initMap;
        
        function initMap() {
            // 지도 초기화 및 설정 작업을 수행하세요.
        }
    </script>
    
</body>
</html>