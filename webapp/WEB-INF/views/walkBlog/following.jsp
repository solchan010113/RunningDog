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


$(document).ready(function(){
    $('#dogCarousel').slick({
        infinite: true,
        slidesToShow: 4, // 동시에 표시할 슬라이드 수
        slidesToScroll: 1, // 스크롤할 슬라이드 수
        prevArrow: '<button type="button" class="slick-prev">이전</button>',
        nextArrow: '<button type="button" class="slick-next">다음</button>'
    });
});


var deleteLogNo; // 전역 변수로 선언

function setDeleteLogNo(logNo) {
    // 삭제할 로그의 walkLogNo를 전역 변수에 설정
    deleteLogNo = logNo;
}

function deleteLog() {
    // 삭제 버튼을 눌렀을 때 전역 변수에 설정된 walkLogNo를 사용하여 삭제 작업 수행
    if (deleteLogNo) {
        location.href = '${pageContext.request.contextPath}/walkBlog/delete?no=' + deleteLogNo;
    }
}




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

$( document ).ready(function() {
//댓글등록버튼 클릭했을때
$(".addCommentBtn").on("click", function(){
	console.log("클릭")
	
	let commentText = $(this).prev().children(".commentText").val();
	let walkLogNo = $(this).data("walklogno");
	
	console.log(walkLogNo)
    console.log(commentText)

	
    if (commentText.trim() !== "") { //글을 입력하면
    	$.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/walkBlog/addComment",
            data: {
                walkLogNo: walkLogNo,
                content: commentText,
                userNo: ${blogInfoVo.authNo}
            },
            success: function (cmt) {
                console.log(cmt);
            	                
                
            	var commentSection = $(".MRcomments");
            	var newCommentHtml = '';
            	newCommentHtml += '<div id="comment_'+cmt.walkLogCmtNo+'" class="MRcomment1">';
            	newCommentHtml += '    <img src="${pageContext.request.contextPath}/rdimg/userProfile/'+cmt.userSavename+'" alt="">';
            	newCommentHtml += '    <div class="replyDateCmtBox">';
            	newCommentHtml += '        <div class="MRreplyDate">'+cmt.regDate+'</div>';
            	newCommentHtml += '        <button class="deleteCommentButton" onclick="deleteComment('+cmt.walkLogCmtNo+')">삭제</button>';
            	newCommentHtml += '    </div>';
            	newCommentHtml += '    <div class="MRuserIdandContent">';
            	newCommentHtml += '        <div class="MRreplyUserId">'+cmt.name+'</div>';
            	newCommentHtml += '        <div class="MRreplyContent">'+cmt.content+'</div>';
            	newCommentHtml += '    </div>';
            	newCommentHtml += '</div>';
            	
            	                
                $(".MRcomments").append(newCommentHtml);
                console.log($(this))
                
                $(".commentText").val("");
                
                
                
                
            },
            error: function (error) {
                console.error("댓글 등록 실패: " + error);
            }
        });
    
    }else {
    	alert("글을 입력해주세요");
    }

}); 	
});



function redirectBasedOnSelection() {
    var selectedValue = document.getElementById("followSelector").value;

    if (selectedValue === "follower") {
        window.location.href = "${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/follower";
    } else if (selectedValue === "following") {
        window.location.href = "${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/following";
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
		            $('#comment_' + cmtNo).remove();
		          /*   location.reload(true); */
		           
		        },
		        error: function (error) {
		            console.error("댓글 삭제 실패: " + error);
		        }
		    });
		}
		
		/* $('#usedTrailModal').on('show.bs.modal', function (event) {
		    var modal = $(this);
		    var button = $(event.relatedTarget); // 클릭한 버튼 가져오기
		    var usedTrailList = button.data('usedTrailList'); // data-usedTrailList 속성에서 usedTrailList 값 가져오기
		    
		    console.log("usedTrailList:", usedTrailList); // 콘솔에 출력

		    modal.find('#usedTrailModalBody').empty(); // 모달 내용 초기화

		    // 이용 산책로 정보를 동적으로 추가
		    $.each(usedTrailList, function (index, usedTrail) {
		        var usedTrailHtml = `
		            <div class="usedTrailInfo">
		                <h5>${usedTrail.name}</h5>
		                <div class="trailInfo">
		                    <div class="info">
		                        <span class="detail-text">${usedTrail.distanceFormatted}KM</span> <span class="detail-info">거리</span>
		                    </div>
		                    <div class="info">
		                        <span class="detail-text">${usedTrail.etaFormatted}</span> <span class="detail-info">소요시간</span>
		                    </div>
		                    <div class="vr"></div>
		                    <div class="info cntInfo">
		                        <span class="detail-text">${usedTrail.trailHit}</span> <span class="detail-info">이용자</span>
		                    </div>
		                    <div class="info cntInfo">
		                        <span class="detail-text">${usedTrail.trailStar}</span> <span class="detail-info">찜</span>
		                    </div>
		                    <div class="info cntInfo">
		                        <span class="detail-text">${usedTrail.trailCmt}</span> <span class="detail-info">후기</span>
		                    </div>
		                </div>
		            </div>
		        `;
		        modal.find('#usedTrailModalBody').append(usedTrailHtml);
		    });
		}); */

		 $(document).ready(function(){
	            // Tooltip initialization
	            $('[data-toggle="tooltip"]').tooltip({
	                trigger: 'manual',  // 수동으로 툴팁을 열고 닫음
	                html: true,         // HTML 태그 사용 허용
	                template: '<div class="tooltip" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>',
	                title: function () {
	                    // 툴팁 내용을 지연 로딩하기 위해 함수 사용
	                    return $(this).attr('title');
	                }
	            });

	            // 툴팁 열기
	            $('.usedTrailButton').on('click', function () {
	                $(this).tooltip('toggle');
	            });

	            // 툴팁 닫기
	            $('.tooltip').on('click', function () {
	                $(this).tooltip('hide');
	            });
	        });
		
	


$(function() {
	

	
	
	$(".datepicker").datepicker({
		dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식
        onSelect: function(dateString) {
        	
        		      let paramCode = "${blogInfoVo.paramCode}" ;
        	          let crtPage = "1"	
        			  let dogNo = "${param.dogNo}"
        	          console.log(dateString);
                      console.log(paramCode);
                      console.log(crtPage);
            
                      $(location).prop("href", "${pageContext.request.contextPath}/walkBlog/"+paramCode+"?crtPage="+crtPage+"&date="+dateString+"&dogNo="+dogNo );
                      
                      
                      /* href="${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}?crtPage=${page}&date=${param.date} */
                      /*  */
                  }


    });
});


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
						<%-- <c:if test="${ requestScope.blogInfoVo.authNo != 0  }">
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
						</c:if> --%>
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
						<div class="tab record " onclick="location.href='${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}?crtPage=1'">산책일지</div>

						<a href="${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/meeting?crtPage=1">
							<div class="tab record">모임일지</div>
						</a> <a href="${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}/following">
							<div class="tab following active">팔로잉</div>
						</a>
						<div class="tab blank">

							<button type="button" class="homeButton" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}?crtPage=1'">홈으로</button>
						</div>
					</div>

					<div class="followingSection">
						<h2>팔로잉</h2>
						<div class="selector">
							<select id="followSelector" class="form-select form-select-sm" aria-label="Small select example" onchange="redirectBasedOnSelection()">
								<option value="following" selected>팔로잉</option>
								<option value="follower">팔로워</option>

							</select>
						</div>
						<div class="followings">
							<c:forEach items="${blogInfoVo.followingList}" var="following">
								<div class="following1">
									<c:if test="${requestScope.blogInfoVo.authNo != 0 && requestScope.blogInfoVo.authNo != following.userNo}">
										<c:if test="${fn:length(blogInfoVo.authFollowList) > 0}">
											<c:if test="${fn:contains(blogInfoVo.authFollowList, following.userNo)}">
												<button id="followButton" class="followButton" onclick="toggleFollowButton(${following.userNo})">팔로잉</button>
											</c:if>
											<c:if test="${not fn:contains(blogInfoVo.authFollowList, following.userNo)}">
												<button id="followButton" class="followButton" onclick="toggleFollowButton(${following.userNo})">팔로우</button>
											</c:if>
										</c:if>
										<c:if test="${fn:length(blogInfoVo.authFollowList) == 0}">
											<button id="followButton" class="followButton" onclick="toggleFollowButton(${following.userNo})">팔로우</button>
										</c:if>
									</c:if>
									<div class="followprofile" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${following.code}?crtPage=1'">
									<img src="${pageContext.request.contextPath}/rdimg/userProfile/${following.userSavename}" alt="">
									<div class="followingNickname">${following.name}</div>
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
							<div class="followingBox" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/following'">
								<div class="followText"  >팔로잉</div>
								<div class="followNum">${blogInfoVo.followingNum}</div>
							</div>
							<div class="followerBox " onclick="location.href='${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/follower'">
								<div class="followText">팔로워</div>
								<div class="followNum">${blogInfoVo.followerNum}</div>
							</div>
						</div>


					</div>
					<div class="stats">

						<h3 class="statslabel">${blogInfoVo.name}님의 기록</h3>

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