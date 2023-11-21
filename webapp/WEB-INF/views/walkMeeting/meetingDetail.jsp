<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingDetail.css" rel="stylesheet" type="text/css">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="${pageContext.request.contextPath}/assets/css/global/slick.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<p class="pageTitle">같이 산책 하실 분 구함</p>
		<div class="inputGroup">
			<div class="items">
				<p class="inputTitle">모임 날짜</p>
				<div>1972-11-21</div>
			</div>
			<div class="items">
				<p class="inputTitle">모임 인원</p>
				<div>4 / 6</div>
			</div>
			<div class="items">
				<p class="inputTitle">강아지 크기</p>
				<div>소형 / 중형 / 대형</div>
			</div>
		</div>
		
		<p class="inputTitle">참여 강아지</p>
		<!-- 개 주인 이름이 아니라, 모임 참가자 이름이 떠야 함. 아니 그걸 어떻게 구현해 ㅁ너ㅏ오며나ㅣ오ㅠ먀ㅣㅕ쥬 -->
		<div class="dogSlickBox">
			<button class="leftBtn lB1"><</button>
			<div class="dogList dl1">
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog3.jpg">
					</div>
					<div>
						<p>사랑이</p>
						<p>18kg</p>
						<p>심영</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog5.jpg">
					</div>
					<div>
						<p>사랑이</p>
						<p>18kg</p>
						<p>심영</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog4.jpg">
					</div>
					<div>
						<p>사랑이</p>
						<p>18kg</p>
						<p>심영</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog7.jpg">
					</div>
					<div>
						<p>계왕권 400배 사랑이</p>
						<p>18kg</p>
						<p>김두한</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog6.jpg">
					</div>
					<div>
						<p>슈퍼 초 사이어견 사랑이</p>
						<p>18kg</p>
						<p>시라소니</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog6.jpg">
					</div>
					<div>
						<p>개라서 개빡친 사랑이</p>
						<p>18kg</p>
						<p>조병옥</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog6.jpg">
					</div>
					<div>
						<p>분노를 참을 수 없는 사랑이</p>
						<p>18kg</p>
						<p>문영철</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog6.jpg">
					</div>
					<div>
						<p>죄악의 군주 사랑이</p>
						<p>18kg</p>
						<p>임화수</p>
					</div>
				</div>
				<div class="dog">
					<div class="imgBox">
						<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog6.jpg">
					</div>
					<div>
						<p>최종병기 사랑이</p>
						<p>18kg</p>
						<p>장택상</p>
					</div>
				</div>
			</div>
			<button class="rightBtn rB1">></button>
		</div>
		
		<div class="inputGroup">
			<div class="inputItem">
				<p class="inputTitle">모임 장소</p>
				<div>서울특별시 종로구 종로동 종로삼가 1972</div>
				<img class="mapImg" alt="" src="${pageContext.request.contextPath}/assets/images/1700470417847827d87c6-2cf2-4dbf-9482-7c785052160e.jpg">
			</div>
		</div>
		
		<p class="inputTitle">모임 설명</p>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="readonly"></textarea>
		
		
		<p class="pageTitle">모임 참여 신청</p>
		
		<form action="">
			<div class="dogSlickBox">
				<button class="leftBtn lB2"><</button>
				<div class="dogList dl2">
					<div class="dog">
						<div class="imgBox">
							<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog3.jpg">
						</div>
						<div>
							<p>사랑이</p>
							<p>18kg</p>
							<p>심영</p>
						</div>
					</div>
					<div class="dog">
						<div class="imgBox">
							<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog5.jpg">
						</div>
						<div>
							<p>사랑이</p>
							<p>18kg</p>
							<p>심영</p>
						</div>
					</div>
					<div class="dog">
						<div class="imgBox">
							<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog4.jpg">
						</div>
						<div>
							<p>사랑이</p>
							<p>18kg</p>
							<p>심영</p>
						</div>
					</div>
				</div>
				<button class="rightBtn rB2">></button>
			</div>
	
			<div class="btnArea">
				<button type="submit" class="btn btn-primary">신청하기</button>
			</div>
		</form>
	</div>


<script type="text/javascript">
$(function(){
    $('.dl1').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
        prevArrow: $('.lB1'),
        nextArrow: $('.rB1'),
        dots: true,
        
        infinite: false,
        slidesToShow: 5,
        slidesToScroll: 5

    });
    
    
    $('.dl2').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
        prevArrow: $('.lB2'),
        nextArrow: $('.rB2'),
        dots: true,
        
        infinite: false,
        slidesToShow: 5,
        slidesToScroll: 5

    });
    
});


</script>


</body>
</html>