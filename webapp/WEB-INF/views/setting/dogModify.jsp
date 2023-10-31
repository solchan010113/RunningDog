<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 정보 수정</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>

<div class="pageContainer">

	<ul id="settingsMenu">
		<li class=""><a href="">내 정보</a></li>
		<li class="selected"><a href="">강아지</a></li>
		<li class="settingSubLi selectedBold"><a class="setting_sub" href="">강아지 카드</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="">강아지 등록</a></li>
		<li><a href="">패밀리</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="">패밀리 목록</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="">패밀리 신청 관리</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="">패밀리 추가</a></li>
		<li class="last_li"><a href="">회원탈퇴</a></li>
	</ul>
	
	
	<form action="" id="profile">
	
		<div class="firstElement">
			<h1>강아지 정보 수정</h1>
			<div>#회원코드</div>
		</div>
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
			<img class="profileImg" alt="" src="/teamproject/assets/images/liltriber.jpg">
			<input type="file" name="profile_img">
		</div>
		
		<div>
			<div class="settingLabel vertialTop">동물등록번호</div>
			
			<div class="checkAnimalBox">
				<div class="checkAnimalNum">
					<select name="selectOwner" id="profile">
						<option value="">소유주</option>
						<option value="">생년월일</option>
					</select>
					<input type="text" name="" value="">
				</div>
				<div class="checkAnimalNum">
					<select name="selectAnimalNum" id="profile">
						<option value="">등록번호</option>
						<option value="">RFID</option>
					</select>
					<input type="number" name="" value="" maxlength="15">
				</div>
				
				<button class="" id="animalBtn" type="submit">조회</button>
			</div>
		</div>
		
		<div>
			<div class="settingLabel">이름</div>
			<input type="text" name="name" value="" maxlength="10">
		</div>
		
		<div>
			<div class="settingLabel">생일</div>
			<input type="date" name="date" value="">
		</div>
		
		<div class="genderSelect">
			<div class="settingLabel">성별</div>
			<input type="radio" name="gender" value="male">남
			<input type="radio" name="gender" value="female">여
		</div>
		
		<div>
			<div class="settingLabel">체중</div>
			<input id="weight" type="number" name="weight" value=""> kg
		</div>
		
		<div>
			<div class="settingLabel">견종</div>
			<input id="kind" type="text" name="kind" value="">
		</div>
				
		<div class="genderSelect">
			<div class="settingLabel">중성화</div>
			<input type="radio" name="cast" value="yes">했어요
			<input type="radio" name="cast" value="no">안 했어요
		</div>
		
		<div>
			<div class="settingLabel vertialTop">성격</div>
			<textarea name="personality" maxlength="40" placeholder="* 성격이나 성향을 간단하게 서술해주세요."></textarea>
		</div>

		<div>
			<div class="settingLabel vertialTop">프로필 색상</div>
			<input type="color" name="color">
		</div>
		
		<div class="noBorder">
			<button type="submit" class="button">수정 완료</button>
			<a href="" class="button deleteBtn">강아지 삭제</a>
		</div>
		
	</form>	
	
</div>

	



</body>
</html>