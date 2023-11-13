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
			<c:choose>
			    <c:when test="${dogVo.saveName != null && dogVo.saveName != ''}">
			   		<!-- Result값이 있다면 실행할 로직 -->
			   		<img class="profileImg" alt="" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
			    </c:when>
			    <c:otherwise>
					 <!-- 그렇지 않다면 실행할 로직 -->
					 <img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">
			    </c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<div class="settingLabel">이름</div>
			<input type="text" name="name" value="${dogVo.dogName}" maxlength="10">
		</div>
		
		<div>
			<div class="settingLabel">생일</div>
			<input type="date" name="date" value="${dogVo.birth}">
		</div>
		
		<div class="genderSelect">
			<div class="settingLabel">성별</div>
			<c:choose>
			    <c:when test="${dogVo.gender == 'male'}">
			   		<input type="radio" name="gender" value="male">남
			    </c:when>
			    <c:otherwise>		
					<input type="radio" name="gender" value="female">여
			    </c:otherwise>
			</c:choose>

		</div>
		
		<div>
			<div class="settingLabel">체중</div>
			<input id="weight" type="number" name="weight" value="${dogVo.weight}"> kg
		</div>
		
		<div>
			<div class="settingLabel">견종</div>
			<input id="kind" type="text" name="kind" value="${dogVo.kind}">
		</div>
				
		<div class="genderSelect">
			<div class="settingLabel">중성화</div>
			<c:if test="${dogVo.neuter == 'T'}">
				<input type="radio" name="cast" value="T" checked="checked">했어요
				<input type="radio" name="cast" value="F">안 했어요
			</c:if>
			<c:if test="${dogVo.neuter == 'F'}">
			<input type="radio" name="cast" value="T">했어요
				<input type="radio" name="cast" value="F" checked="checked">안 했어요
			</c:if>
			<c:if test="${dogVo.neuter == null || dogVo.neuter == ''}">
				<input type="radio" name="cast" value="T">했어요
				<input type="radio" name="cast" value="F">안 했어요
			</c:if>
		</div>
		
		<div>
			<div class="settingLabel vertialTop">성격</div>
			<c:choose>
			    <c:when test="${dogVo.personality != null && dogVo.personality != ''}">
			   		<textarea name="personality" maxlength="30">${dogVo.personality}</textarea>
			    </c:when>
			    <c:otherwise>
					 <textarea name="personality" maxlength="30" placeholder="* 성격이나 성향을 간단하게 적어주세요"></textarea>
			    </c:otherwise>
			</c:choose>
			
		</div>

		<div>
			<div class="settingLabel vertialTop">프로필 색상</div>
			<c:choose>
			    <c:when test="${dogVo.color != null && dogVo.color != ''}">
			   		<input type="color" name="color" value="${dogVo.color}">
			    </c:when>
			    <c:otherwise>
					 <input type="color" name="color">
			    </c:otherwise>
			</c:choose>
		</div>
		
		<div class="noBorder marginBottom">
			<button type="submit" class="button">수정 완료</button>
			<a href="${pageContext.request.contextPath}/setting/deleteDog?no=${requestScope.dogVo.dogNo}" class="button deleteBtn">강아지 삭제</a>
		</div>
		
	</form>	
	
</div>

	



</body>
</html>