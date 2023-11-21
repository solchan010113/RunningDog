<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingList.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>우리동네 동아리</h1>
		<div class="infoHeader">
			<div class="left location">
				<span class="myColor">천호동</span> 모임 <i class="fa-regular fa-square-caret-down"></i>
			</div>
			<form action="${pageContext.request.contextPath}/setting/friendList?crtPage=1" method="post" id="searchUser">
				<div class="searchBox">
					<select name="what" id="searchUser">
						<option value="title">모임 제목</option>
						<option value="date">날짜</option>
					</select>
					<input type="text" name="keyword">
					<button type="submit" class="button" id="searchBtn">검색</button>
				</div>
			</form>
		</div>
		
		<div class="listBox">
			<table class="meetingList">
				<colgroup>
					<col style="width: 30%;" />
	    			<col style="width: 30%;" />
	    			<col style="width: 15%;" />
					<col style="width: 10%;" />
					<col style="width: 15%;" />
				</colgroup>
				<tr>
		            <th>모임 제목</th>
		            <th>위치</th>
		            <th>강아지 크기</th>
		            <th>인원 수</th>
		            <th>날짜</th>
		        </tr>

		        <tr class="mt42">
		        	<td>보이 넥스트 도어이즈 투 블럭스 다운 보이</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형, 중형, 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>		        	
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형 / 중형 / 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형 / 중형 / 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형 / 중형 / 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형, 중형, 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형 / 중형 / 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형 / 중형 / 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형, 중형, 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형, 중형, 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        <tr>
		        	<td>보이 넥스트 도어</td>
		        	<td>서울특별시 종로구 천호동 천호대러 19-72</td>
		        	<td>소형, 중형, 대형</td>
		        	<td>8</td>
		        	<td>2023-11-21</td>
		        </tr>
		        
			</table>
			
			<div id="paging">
				<ul>
					<c:if test="${friendMap.prev}">
						<li><a href="${pageContext.request.contextPath}/walkmeeting/meetinglist?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${friendMap.startPageBtnNo-1}">◀</a></li>
					</c:if>
					
					<c:forEach begin="${friendMap.startPageBtnNo}" end="${friendMap.endPageBtnNo}" step="1" var="page">
						<c:choose>
							<c:when test="${param.crtPage == page}">
								<li class="active"><a href="${pageContext.request.contextPath}/walkmeeting/meetinglist?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${page}">${page}</a></li>										
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/walkmeeting/meetinglist?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					
					<c:if test="${friendMap.next}">
						<li><a href="${pageContext.request.contextPath}/walkmeeting/meetinglist?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${friendMap.endPageBtnNo+1}">▶</a></li>
					</c:if>

				</ul>
			</div>
			<a href="${pageContext.request.contextPath}/walkmeeting/meetinginsert" class="button">모임 등록</a>
		</div>
	</div>
	
	
	
<!-- 	<div class="fixedDate" data-bs-toggle="modal" data-bs-target="#exampleModal">
		<i class="fa-solid fa-calendar" style="color: #000000;"></i>
	</div>
	Modal
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">모임 일정</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
		        <div class="modal-body">
		          <div id='calendar'></div>
		        </div>
		        <div class="modal-footer">
		            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        </div>
	        </div>
	    </div>
	</div> -->
	
	<script>
	
	$('.mt42').click(function() {
	    window.location = '${pageContext.request.contextPath}/walkmeeting/meeting?no=1';
	});
	
	
	
	/* FullCalendar */
	const myModalEl = document.getElementById('exampleModal')
	myModalEl.addEventListener('shown.bs.modal', event => {
		var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale: 'ko'
        });
        calendar.render();
	})
	</script>
</body>
</html>