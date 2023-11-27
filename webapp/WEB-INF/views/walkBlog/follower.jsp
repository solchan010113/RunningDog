<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://kit.fontawesome.com/98aecd1b62.js" crossorigin="anonymous"></script>
<script>
 /* function toggleFollowButton() {
    var followButton = document.getElementById("followButton");
    var followStatus = "${requestScope.blogInfoVo.followNo}";

    if (followStatus === "0") {
        // Follow
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/walkBlog/toggleFollow",
            data: {
                followeeNo: "${requestScope.blogInfoVo.ownerNo}"
            },
            success: function(response) {
                if (response === "success") {
                    followButton.innerText = "팔로잉";
                } else {
                    console.error("팔로우 실패");
                }
            },
            error: function(error) {
                console.error("팔로우 실패: " + error);
            }
        });
    } else if (followStatus === "1") {
        // Unfollow
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/walkBlog/toggleFollow",
            data: {
                followeeNo: "${requestScope.blogInfoVo.ownerNo}"
            },
            success: function(response) {
                if (response === "success") {
                    followButton.innerText = "팔로우";
                } else {
                    console.error("언팔로우 실패");
                }
            },
            error: function(error) {
                console.error("언팔로우 실패: " + error);
            }
        });
    }
}

	function addComment(walkLogNo) {
		var commentText = document.getElementById("commentText").value;
		console.log(commentText);
		console.log(${ShowLogVo.walkLogNo});
		
		if (commentText.trim() !== "") {
			// Ajax 호출
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/walkBlog/addComment",
				data : {
					walkLogNo : walkLogNo, // 적절한 walkLogNo 전달
					content : commentText,
					userNo: ${blogInfoVo.authNo}
				},
				success : function(response) {
					// 성공 시, 화면 갱신 등 추가 작업 가능
					console.log("댓글 등록 성공");
				},
				error : function(error) {
					console.error("댓글 등록 실패: " + error);
				}
			});
		}
	}
	
	function deleteComment(cmtNo) {
        // Ajax 호출
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/walkBlog/deleteComment",
            data: {
                walkLogCmtNo: cmtNo
            },
            success: function(response) {
                // 성공 시, 화면 갱신 등 추가 작업 가능
                console.log("댓글 삭제 성공");
                // 여기에 화면 갱신 등을 위한 코드를 추가할 수 있습니다.
            },
            error: function(error) {
                console.error("댓글 삭제 실패: " + error);
            }
        });
    }
	  */
	  function toggleFollowButton(followerUserNo) {
		    let followButton = document.getElementById("followButton");

		    // Follow
		    if (followButton.innerText === "팔로우") {
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/walkBlog/toggleFollow",
		            data: {
		                followeeNo: followerUserNo
		            },
		            success: function(response) {
		                if (response === "success") {
		                    followButton.innerText = "팔로잉";
		                    location.reload(true);
		                } else {
		                    console.error("팔로우 실패");
		                }
		            },
		            error: function(error) {
		                console.error("팔로우 실패: " + error);
		            }
		        });
		    }
		    // Unfollow
		    else {
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/walkBlog/toggleFollow",
		            data: {
		                followeeNo: followerUserNo
		            },
		            success: function(response) {
		                if (response === "success") {
		                    followButton.innerText = "팔로우";
		                    location.reload(true);
		                } else {
		                    console.error("언팔로우 실패");
		                }
		            },
		            error: function(error) {
		                console.error("언팔로우 실패: " + error);
		            }
		        });
		    }
		}

	  
	  function addComment(walkLogNo) {
		    var commentText = document.getElementById("commentText").value;
		    console.log(commentText);
		    console.log(${ShowLogVo.walkLogNo});
		    
		    if (commentText.trim() !== "") {
		        // Ajax 호출
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/walkBlog/addComment",
		            data: {
		                walkLogNo: walkLogNo,
		                content: commentText,
		                userNo: ${blogInfoVo.authNo}
		            },
		            success: function (response) {
		                // 성공 시, 화면 갱신 등 추가 작업 가능
		                console.log("댓글 등록 성공");
		                
		                // 새로운 댓글이 등록되면 화면 갱신
		                // 이 부분에서 필요한 화면 갱신 동작을 수행하면 됩니다.
		                // 예를 들어, 새로운 댓글을 바로 추가하는 등의 동작을 수행할 수 있습니다.
		                // ...

		                // 추가: 새로운 댓글이 등록되면 댓글 목록을 갱신
		                refreshCommentSection(walkLogNo);
		            },
		            error: function (error) {
		                console.error("댓글 등록 실패: " + error);
		            }
		        });
		    }
		}

		function deleteComment(cmtNo) {
		    // Ajax 호출
		    $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/walkBlog/deleteComment",
		        data: {
		            walkLogCmtNo: cmtNo
		        },
		        success: function (response) {
		            // 성공 시, 화면 갱신 등 추가 작업 가능
		            console.log("댓글 삭제 성공");

		            // 댓글이 삭제되면 화면 갱신
		            // 이 부분에서 필요한 화면 갱신 동작을 수행하면 됩니다.
		            // 예를 들어, 삭제된 댓글을 화면에서 감추는 등의 동작을 수행할 수 있습니다.
		            // ...

		            // 추가: 삭제된 댓글이 없어지면 댓글 목록을 갱신
		            refreshCommentSection(cmtNo);
		        },
		        error: function (error) {
		            console.error("댓글 삭제 실패: " + error);
		        }
		    });
		}

		// 추가: 댓글 섹션을 갱신하는 함수
		function refreshCommentSection(walkLogNo) {
		    // 필요한 화면 갱신 로직을 여기에 추가
		    // 예를 들어, 댓글 목록을 다시 불러와서 갱신하는 등의 동작을 수행할 수 있습니다.
		    // ...

		    // 간단한 예시: 해당 walkLogNo에 대한 댓글 목록을 갱신
		    $.ajax({
		        type: "GET",
		        url: "${pageContext.request.contextPath}/walkBlog/getComments",
		        data: {
		            walkLogNo: walkLogNo
		        },
		        success: function (response) {
		            // 새로운 댓글 목록을 받아와서 화면에 적용하는 로직
		            // 이 부분에서는 댓글 목록을 갱신하는 등의 동작을 수행할 수 있습니다.
		            // ...
		        },
		        error: function (error) {
		            console.error("댓글 목록 불러오기 실패: " + error);
		        }
		    });
		}
		
		function redirectBasedOnSelection() {
	        var selectedValue = document.getElementById("followSelector").value;

	        if (selectedValue === "follower") {
	            window.location.href = "${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/follower";
	        } else if (selectedValue === "following") {
	            window.location.href = "${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/following";
	        }
	    }
		
		
		
	
</script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>


	<c:if test="${ requestScope.blogInfoVo.bannerSavename == null  }">
		<div class="backgroundImg">
			<img src="${pageContext.request.contextPath}/assets/images/bannerDefault.png" alt="">
		</div>
	</c:if>
	<c:if test="${ requestScope.blogInfoVo.bannerSavename != null  }">
		<div class="backgroundImg">
			<img src="${pageContext.request.contextPath}/rdimg/blogBanner/${blogInfoVo.bannerSavename}" alt="">

		</div>
	</c:if>



	<section>
		<div class="contents">




			<div class="profileSection">
				<div class="calendar"></div>

				<div class="profileWrapper">
					<div class="wrap">
						<div class="profileImg">
							<img src="${pageContext.request.contextPath}/rdimg/userProfile/${blogInfoVo.userSavename}" alt="">
						</div>
						<h1 class="userName">${blogInfoVo.name}</h1>
						<c:if test="${ requestScope.blogInfoVo.authNo != 0  }">
							<c:if test="${requestScope.blogInfoVo.authNo != requestScope.blogInfoVo.ownerNo }">
								<button id="followButton" class="followButton" onclick="toggleFollowButton()">
									<c:if test="${requestScope.blogInfoVo.followNo == 0}">
						팔로우
						
						</c:if>
							</c:if>
							<c:if test="${requestScope.blogInfoVo.followNo == 1}">
						팔로잉
						
						</c:if>

							</button>
						</c:if>
					</div>
					<div class="mainDogCard">
						<div class="coworkingDog">산책 파트너</div>
						<div class="maindogCardBox">
							<c:forEach items="${blogInfoVo.blogDogList}" var="blogDogVo">
								<div class="mainDogCard1">
									<img src="${pageContext.request.contextPath}/rdimg/dogProfile/${blogDogVo.saveName}" alt="">
									<div class="mainDogCardName">${blogDogVo.name}</div>
								</div>

							</c:forEach>
						</div>

					</div>


				</div>



			</div>

			<div class="mainWrapper">

				<div class="mainPosts">

					<div class="category">
						<div class="tab record" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}?crtPage=1'">산책기록</div>

						<a href="${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/meeting?crtPage=1">
							<div class="tab record">산책모임</div>
						</a> <a href="${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/following">
							<div class="tab following active">팔로잉</div>
						</a>
						<div class="tab blank">

							<button type="button" class="homeButton" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}?crtPage=1'">홈으로</button>
						</div>
					</div>

					<div class="followingSection">
						<h2>팔로워</h2>
						<div class="selector">
							<select id="followSelector" class="form-select form-select-sm" aria-label="Small select example" onchange="redirectBasedOnSelection()">
								<option value="follower" selected>팔로워</option>
								<option value="following">팔로잉</option>


							</select>
						</div>
						<div class="followings">
							<c:forEach items="${blogInfoVo.followerList}" var="follower">
								<div class="following1">
									<c:if test="${requestScope.blogInfoVo.authNo != 0 && requestScope.blogInfoVo.authNo != follower.userNo}">
										<c:if test="${fn:length(blogInfoVo.authFollowList) > 0}">
											<c:if test="${fn:contains(blogInfoVo.authFollowList, follower.userNo)}">
												<button id="followButton" class="followButton" onclick="toggleFollowButton(${follower.userNo})">팔로잉</button>
											</c:if>
											<c:if test="${not fn:contains(blogInfoVo.authFollowList, follower.userNo)}">
												<button id="followButton" class="followButton" onclick="toggleFollowButton(${follower.userNo})">팔로우</button>
											</c:if>
										</c:if>
										<c:if test="${fn:length(blogInfoVo.authFollowList) == 0}">
											<button id="followButton" class="followButton" onclick="toggleFollowButton(${follower.userNo})">팔로우</button>
										</c:if>
									</c:if>
									<div class="followprofile" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${follower.code}?crtPage=1'">
									<img src="${pageContext.request.contextPath}/rdimg/userProfile/${follower.userSavename}" alt="">
									<div class="followingNickname">${follower.name}</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="mainSidebar">
				<%-- <div class="clubsWrapper">
					<h3 class="clubs">동아리</h3>
					<div class="clubBox">
						<div class="clubCard1">
							<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
							<div class="clubCardName">동아리1</div>
						</div>
						<div class="clubCard2">
							<img src="${pageContext.request.contextPath}/assets/images/산책로3.png" alt="">
							<div class="clubCardName">동아리2</div>
						</div>
						<div class="clubCard3">
							<img src="${pageContext.request.contextPath}/assets/images/산책로2.png" alt="">
							<div class="clubCardName">동아리3</div>
						</div>
						<div class="clubCard4">
							<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
							<div class="clubCardName">동아리4</div>
						</div>
					</div>
				</div> --%>
				<div class="socialWrapper">
					<div class="socialBox">
						<h3 class="social">소셜 네트워크</h3>
						<div class="followingBox">
							<div class="followText">팔로잉</div>
							<div class="followNum">${blogInfoVo.followingNum}</div>
						</div>
						<div class="followerBox">
							<div class="followText">팔로워</div>
							<div class="followNum">${blogInfoVo.followerNum}</div>
						</div>
					</div>


				</div>
				<div class="stats">

					<h3 class="statslabel">${blogInfoVo.name}님의기록</h3>

					<table class="statsTable">
						<tr>
							<th>이번 달</th>
						</tr>
						<tr>
							<td>산책횟수</td>
							<td>${blogInfoVo.monthlyStatsThisMonth.walkCountThisMonth}</td>
						</tr>
						<tr>
							<td>산책거리</td>
							<td>${blogInfoVo.monthlyStatsThisMonth.totalDistanceThisMonthFormatted}</td>
						</tr>
						<tr>
							<td>산책시간</td>
							<td>${blogInfoVo.monthlyStatsThisMonth.totalLogTimeThisMonthFormatted}</td>
						</tr>
					</table>

					<table class="statsTableAll">
						<tr>
							<th>총 기록</th>
						</tr>
						<tr>
							<td>산책횟수</td>
							<td>${blogInfoVo.monthlyStatsTotal.walkCountTotal}</td>
						</tr>
						<tr>
							<td>산책거리</td>
							<td>${blogInfoVo.monthlyStatsTotal.totalDistanceTotalFormatted}</td>
						</tr>
						<tr>
							<td>산책시간</td>
							<td>${blogInfoVo.monthlyStatsTotal.totalLogTimeTotalFormatted}</td>
						</tr>
					</table>
				</div>
			</div>





			</div>


			
		</div>



		

	</section>


</body>





</html>