<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingInsert.css" rel="stylesheet" type="text/css">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="${pageContext.request.contextPath}/assets/css/global/slick.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<p class="pageTitle">모임 등록</p>
		<p class="inputTitle">모임 이름</p>
		<input type="text" class="form-control meetingTitle" placeholder="모임명 입력" aria-label="Username">
		<div class="inputGroup">
			<div class="inputItem">
				<p class="inputTitle">모임 날짜 입력</p>
				<input type="date" class="form-control" placeholder="Username" aria-label="Username">
			</div>
			<div class="inputMember">
				<p class="inputTitle">모임 인원 입력</p>
				<input class="fmradio form-check-input" type="radio" name="count" id="" value="2">2
				<input class="mradio form-check-input" type="radio" name="count" id="" value="3">3
				<input class="mradio form-check-input" type="radio" name="count" id="" value="4">4
				<input class="mradio form-check-input" type="radio" name="count" id="" value="5">5
				<input class="mradio form-check-input" type="radio" name="count" id="" value="6">6
				<input class="mradio form-check-input" type="radio" name="count" id="" value="7">7
				<input class="mradio form-check-input" type="radio" name="count" id="" value="8">8
			</div>
		</div>
		<p class="inputTitle">강아지 크기</p>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
		  <label class="form-check-label" for="inlineCheckbox1">소형견</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
		  <label class="form-check-label" for="inlineCheckbox2">대형견</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
		  <label class="form-check-label" for="inlineCheckbox3">중형견</label>
		</div>
		<i class="fa-solid fa-circle-exclamation" data-bs-html="true" data-toggle="tooltip" data-placement="top" 
		title="~7kg 소형견 <br> 7~11kg 중형견 <br> 11kg ~ 대형견"></i>
		<p class="inputTitle">강아지 선택</p>
		
		<div class="dogSlickBox">
			<button class="leftBtn lB1"><</button>
			<div class="dogList">
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
			<div class="inputImg">
				<p class="inputTitle">산책로 선택</p>
				<input type="text" class="form-control" placeholder="" aria-label="Username">
				<button class="btn btn-primary">산책로 찾기</button>
				<img class="mapImg" alt="" src="">
			</div>
		</div>
		
		<p class="inputTitle">모임 설명</p>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="모임 설명 입력"></textarea>
		<div class="btnArea">
			<button type="submit" class="btn btn-primary">등록하기</button>
		</div>
	</div>


<script type="text/javascript">
$(function(){
    $('.dogList').slick({

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
});


</script>


</body>
</html>