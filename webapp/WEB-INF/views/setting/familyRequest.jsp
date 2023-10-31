<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<jsp:include page="../includes/header.jsp"></jsp:include>

<div class="pageContainer">

	<ul id="settingsMenu">
		<li class=""><a href="">내 정보</a></li>
		<li class=""><a href="">강아지</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="">강아지 카드</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="">강아지 등록</a></li>
		<li class="selected"><a href="">패밀리</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="">패밀리 목록</a></li>
		<li class="settingSubLi noTopBorder selectedBold"><a class="setting_sub" href="">패밀리 신청 관리</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="">패밀리 추가</a></li>
		<li class="last_li"><a href="">회원탈퇴</a></li>
	</ul>
	
	
	<div id="familyProfile">

		<div class="firstElement">
			<h1>패밀리 신청</h1>
			<div>#12345</div>
		</div>
		
		<div class="listBox">
		

			<div class="borderBottom"></div>

			<table class="familyList">
				<colgroup>
					<col style="width: 10%;" />
	    			<col style="width: 22%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 32%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
				</colgroup>
				<tr>
		            <th>프로필</th>
		            <th>닉네임(#회원코드)</th>
		            <th>나이</th>
		            <th>성별</th>
		            <th>동네</th>
		            <th>수락</th>
		            <th>거절</th>
		        </tr>
				<tr>
					<td><img src="/teamproject/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn ok">수락</a></td>
					<td><a href="" class="deleteBtn">거절</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			</table>
			
			<table class="familyList">
				<colgroup>
					<col style="width: 10%;" />
	    			<col style="width: 22%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 32%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
				</colgroup>
				<tr>
					<td><img src="/teamproject/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn ok">수락</a></td>
					<td><a href="" class="deleteBtn">거절</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			</table>
			
			<table class="familyList">
				<colgroup>
					<col style="width: 10%;" />
	    			<col style="width: 22%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 32%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
				</colgroup>
				<tr>
					<td><img src="/teamproject/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn ok">수락</a></td>
					<td><a href="" class="deleteBtn">거절</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			</table>
			
			<table class="familyList">
				<colgroup>
					<col style="width: 10%;" />
	    			<col style="width: 22%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 32%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
				</colgroup>
				<tr>
					<td><img src="/teamproject/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn ok">수락</a></td>
					<td><a href="" class="deleteBtn">거절</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			</table>
			
			<table class="familyList">
				<colgroup>
					<col style="width: 10%;" />
	    			<col style="width: 22%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 32%;" />
					<col style="width: 8%;" />
					<col style="width: 8%;" />
				</colgroup>
				<tr>
					<td><img src="/teamproject/assets/images/Yoshi.jpg"></td>
					<td>닉네임(#회원코드)</td>
					<td>나이</td>
					<td>성별</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn ok">수락</a></td>
					<td><a href="" class="deleteBtn">거절</a></td>
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