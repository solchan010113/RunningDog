<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 산책기록넣기</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 800px;"></div>

	<script>
		let coords = [];

		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.538247, 127.125280), // 서울의 좌표를 기본으로 설정
			zoom : 18
		});

		var drawingLine = new naver.maps.Polyline({
			map : map,
			path : coords,
			clickable : true
		});

		naver.maps.Event.addListener(map, 'click', function (e) {
            coords.push({ x: e.coord.x, y: e.coord.y });
            drawingLine.setPath(coords);
        });

		function sendDataToServer() {
			// 여기에서 AJAX를 사용하여 서버로 좌표값을 전송하는 코드를 작성
			console.log("작성", coords);
			
			$.ajax({
			     url: "${pageContext.request.contextPath}/m/adminInsert",
			     type: 'POST',
			     data: JSON.stringify({ coords: coords }),
			     contentType: 'application/json',
			     success: function(result) {
			         console.log("관리자 기록 등록완료");
			     },
			     error: function(error) {
			         console.error('Error:', error);
			     }
			 });
		}
	</script>

	<button onclick="sendDataToServer()"> 기록하기 </button>
</body>

</html>