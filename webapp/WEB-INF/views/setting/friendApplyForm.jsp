<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패밀리 신청</title>
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
			<h1>내가 한 신청</h1>
			<div>#${sessionScope.authUser.code}</div>
		</div>
		
		<div class="listBox">
		

			<div class="borderBottom"></div>

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
		            <th>취소</th>
		        </tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn">취소</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			
				<tr>
					<td><img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn">취소</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			
				<tr>
					<td><img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn">취소</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			
				<tr>
					<td><img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn">취소</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			
				<tr>
					<td><img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn">취소</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
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