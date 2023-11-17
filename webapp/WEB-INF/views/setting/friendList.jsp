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
		
			<form action="${pageContext.request.contextPath}/setting/friendList?crtPage=1" method="post" id="searchUser">
				<div class="searchBox">
					<select name="what" id="searchUser">
						<option value="name">닉네임</option>
						<option value="code">회원코드</option>
					</select>
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
		        
		        <c:forEach items="${requestScope.friendMap.friendList}" var="friendsVo">
			        <tr id="t${friendsVo.friendNo}">
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
						<td><button data-friendno="${friendsVo.friendNo}" class="deleteBtn">친구 삭제</button></td>
						<!-- delete?no=${GuestVo.no} -->
					</tr>
		        </c:forEach>
		        
			</table>
			
			<div id="paging">
				<ul>
					<c:if test="${friendMap.prev}">
						<li><a href="${pageContext.request.contextPath}/setting/friendList?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${friendMap.startPageBtnNo-1}">◀</a></li>
					</c:if>
					
					<c:forEach begin="${friendMap.startPageBtnNo}" end="${friendMap.endPageBtnNo}" step="1" var="page">
						<c:choose>
							<c:when test="${param.crtPage == page}">
								<li class="active"><a href="${pageContext.request.contextPath}/setting/friendList?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${page}">${page}</a></li>										
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/setting/friendList?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					
					<c:if test="${friendMap.next}">
						<li><a href="${pageContext.request.contextPath}/setting/friendList?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${friendMap.endPageBtnNo+1}">▶</a></li>
					</c:if>

				</ul>
			</div>
			
		</div>
	</div>
	
</div>




<script type="text/javascript">

//친구 삭제 (ajax)
$(".deleteBtn").on("click", function(){
	
	let $this = $(this);
	let friendNo = parseInt($this.data("friendno"));
	
	$.ajax({
		url : "${pageContext.request.contextPath}/setting/deleteFriend",
		type : "post",
		//보낼 때
		/* contentType : "application/json", */
		data : {friendNo: friendNo},

		//받을 때
		dataType : "text",
		success : function(count){
			
			if(count == "1"){
				alert("삭제 성공");
				$("#t"+friendNo).remove();
			}else{
				alert("삭제 실패");
			}

		},
     
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});

	
});





</script>




</body>
</html>