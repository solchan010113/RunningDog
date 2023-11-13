<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<form action="" id="profile">
	
		<div class="firstElement">
			<h1>강아지 정보 수정</h1>
			<div>#${requestScope.selectUser.code}</div>
		</div>
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
			<img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/liltriber.jpg">
			<label for="inputFile2" class="upload-btn" id="uploadLabel">
				<input id="inputFile2" type="file" name="file" accept="image/*">
			    <span class="form-text" >이미지 선택</span>
		    </label>
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
			<textarea name="personality" maxlength="30" placeholder="* 성격이나 성향을 간단하게 서술해주세요."></textarea>
		</div>

		<div>
			<div class="settingLabel vertialTop">프로필 색상</div>
			<input type="color" name="color">
		</div>
		
		<div class="noBorder marginBottom">
			<button type="submit" class="button">수정 완료</button>
			<a href="" class="button deleteBtn">강아지 삭제</a>
		</div>
		
	</form>	
	
</div>

	



</body>
</html>