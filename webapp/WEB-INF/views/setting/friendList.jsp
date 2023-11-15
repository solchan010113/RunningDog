<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 목록</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<div id="friendProfile">

		<div class="firstElement">
			<h1>친구 목록</h1>
			<div>#${sessionScope.authUser.code}</div>
		</div>
		
		<div class="listBox">
		
			<form action="list" method="get">
				<div class="searchBox">
					<input type="text" name="keyword">
					<button type="submit" class="button" id="searchBtn">검색</button>
				</div>
			</form>
			
			<table class="friendList">
				<colgroup>
					<col style="width: 15%;" />
	    			<col style="width: 20%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 30%;" />
					<col style="width: 15%;" />
				</colgroup>
				<tr>
		            <th>프로필</th>
		            <th>닉네임(#회원코드)</th>
		            <th>나이</th>
		            <th>성별</th>
		            <th>동네</th>
		            <th>친구 삭제</th>
		        </tr>
		        
		        <c:forEach items="${requestScope.friendList}" var="friendsVo">
			        <tr>
						<td><img src="${pageContext.request.contextPath}/rdimg/userProfile/${friendsVo.saveName}"></td>
						<td>${friendsVo.name}(#${friendsVo.code})</td>
						<c:choose>
						    <c:when test="${friendsVo.birth == null || friendsVo.birth == ''}">
						   		<td>-</td>
						    </c:when>
						    <c:otherwise>
						    	<td>${friendsVo.birth}</td>
						    </c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${friendsVo.gender == 'male'}">
						   		<td>남</td>
						    </c:when>
						    <c:when test="${friendsVo.gender == 'female'}">
						   		<td>여</td>
						    </c:when>
						    <c:otherwise>
						    	<td>-</td>
						    </c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${friendsVo.locationNo == 1100000000}">
						   		<td>${friendsVo.si}&nbsp;&nbsp;${friendsVo.gu}</td>
						    </c:when>
						    <c:otherwise>
						    	<td>${friendsVo.si}&nbsp;&nbsp;${friendsVo.gu}&nbsp;&nbsp;${friendsVo.dong}</td>
						    </c:otherwise>
						</c:choose>
						<td><a href="${pageContext.request.contextPath}/setting/deleteFriend?no=${friendsVo.friendNo}" class="deleteBtn">친구 삭제</a></td>
						<!-- delete?no=${GuestVo.no} -->
					</tr>
		        </c:forEach>
		        
			</table>
			
			<div id="paging">
				<ul>
					<li><a href="">◀</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li class="selectedBold"><a href="">5</a></li>
					<li><a href="">6</a></li>
					<li><a href="">7</a></li>
					<li><a href="">8</a></li>
					<li><a href="">9</a></li>
					<li><a href="">10</a></li>
					<li><a href="">▶</a></li>
				</ul>
			</div>
			
		</div>
	</div>
	
</div>

</body>
</html>