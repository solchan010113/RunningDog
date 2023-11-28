<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



function toggleFollowButton() {
    let followButton = document.getElementById("followButton");
    let followStatus = "${requestScope.blogInfoVo.followNo}";

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
                    location.reload(true);
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
		
		let commentArea = $(this).parent().prev();
		let commentText = $(this).prev().children(".commentText").val();
		let walkLogNo = $(this).data("walklogno");
		
		console.log("==================");
		console.log(walkLogNo);
	    console.log(commentText);
		console.log(commentArea);
	    
	    
		
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
	            	
	            	                
	            	commentArea.append(newCommentHtml);
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
		
		 $('#usedTrailModal').on('show.bs.modal', function (event) {
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
		}); 

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
						<a href="${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}">
							<div class="tab record active">산책기록</div>
						</a>
						<div class="tab meeting"></div>
						<div class="tab following"></div>
						<div class="tab blank">

							<button type="button" class="homeButton" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${requestScope.blogInfoVo.paramCode}?crtPage=1'">홈으로</button>
						</div>
					</div>


					<div class="mainRecordSection">





						<div class="mainRecord1">


							<div class="MRprofileBox">

								<div class="MRprofileWrapper1">
									<div class="MRprofileImg1">
										<img src="${pageContext.request.contextPath}/rdimg/userProfile/${walkLog.userSavename}" alt="">
									</div>

									<div class="MRuserName1">${walkLog.name}</div>
								</div>
								<div class="wrappingBox">
									<div class="MRtitleBox">
										<div class="MRtime">${walkLog.regDate}</div>
										<div class="MRtitle">${walkLog.title}</div>

									</div>

									<div class="MRrecordBox">
										<div class="MRdistanceBox">
											<div class="MRrecordData">${walkLog.distanceFormatted}km</div>
											<div class="MRlabel">산책거리</div>
										</div>
										<div class="MRtimeBox">
											<div class="MRrecordData">${walkLog.logTimeFormatted}</div>
											<div class="MRlabel">산책시간</div>
										</div>


									</div>
								</div>


								<div class="modifyDelete">
									<c:if test="${requestScope.blogInfoVo.authNo == requestScope.blogInfoVo.ownerNo }">
										<button type="button" class="deleteButton" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
										<button class="modifyButton" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/${walkLog.walkLogNo}/modifyForm'">수정</button>
										<!-- <button class="deleteButton">삭제</button> -->

										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">정말 삭제하시겠습니까?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/walkBlog/delete?no=${walkLog.walkLogNo}'">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</div>

								<div class="MRdogCardBox">

									<div class="MRpartnerDoglabel">함께한 강아지</div>
									<div class="MRdogCards">
										<c:forEach items="${walkLog.walkedDogList}" var="walkedDog">
											<div class="MRdogCard1">
												<img src="${pageContext.request.contextPath}/rdimg/dogProfile/${walkedDog.saveName}" alt="">
												<div class="MRdogName">${walkedDog.name}</div>
											</div>
										</c:forEach>

									</div>



								</div>

								<div class="logButton">
											<button type="button" class="usedTrailButton" data-toggle="tooltip" data-html="true"
												title="<c:forEach items='${walkLog.usedTrailList}' var='usedTrail'><div class='custom-tooltip'><strong>${usedTrail.name}</strong><br>거리: ${usedTrail.distanceFormatted}KM<br>소요시간: ${usedTrail.etaFormatted}<br>이용자: ${usedTrail.trailHit}<br>찜: ${usedTrail.trailStar}<br>후기: ${usedTrail.trailCmt}<br><a href='${pageContext.request.contextPath}/walkTrail/detail?trailNo=${usedTrail.trailNo}' class='custom-link'>상세보기</a><br><br></div></c:forEach>">
												이용 산책로</button>
											<button type="button" class="regButton" onclick="location.href='${pageContext.request.contextPath}/walkTrail/addForm?walkLogNo=${walkLog.walkLogNo}'">산책로 등록</button>
										</div>
										<div class="likeContentWrapper">
											<div class="likeWrapper">

												<div class="like">0 likes</div>
												<div class="likeButton">
													<c:if test="${requestScope.blogInfoVo.authNo != 0}">
														<c:if test="${requestScope.blogInfoVo.authNo != requestScope.blogInfoVo.ownerNo}">
															<button id="likeButton" onclick="toggleLike(${walkLog.walkLogNo})">
																<c:choose>
																	<c:when test="${likedWalkLogs.contains(walkLog.walkLogNo)}">
																		<span class="heart red-heart">&#10084;</span>
																		<!-- 이미 좋아요를 누른 경우 -->
																	</c:when>
																	<c:otherwise>
																		<span class="heart">&#10084;</span>
																		<!-- 좋아요를 누르지 않은 경우 -->
																	</c:otherwise>
																</c:choose>
																좋아요
															</button>
														</c:if>
													</c:if>
												</div>
											</div>
											<div class="walkLogContent">${walkLog.content}</div>
										</div>

							</div>



							<div class="MRwalkRecordSection">
								<div class="MRwalkData">
									<img src="${pageContext.request.contextPath}/rdimg/mapImg/${walkLog.walkLogMap}" alt="">
								</div>
								<div class="MRpictures">
									<!-- 이미지 가져오기 -->
									<c:forEach items="${walkLog.imageList}" var="image">
										<div class="MRpicture${image.imageOrder}">
											<img src="${pageContext.request.contextPath}/rdimg/conImg/${image.saveName}" alt="">
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="MRcommentSection">

								<div class="MRcomments">
									<c:forEach items="${walkLog.showLogCmtList}" var="cmt">
										<c:if test="${not empty walkLog.status and  String.valueOf(walkLog.status) eq 'T'}">
											<div id="comment_${cmt.walkLogCmtNo}" class="MRcomment1">

												<a href="${pageContext.request.contextPath}/walkBlog/${cmt.code}?crtPage=1"> <img src="${pageContext.request.contextPath}/rdimg/userProfile/${cmt.userSavename}" alt="">
												</a>
												<div class="replyDateCmtBox">
													<div class="MRreplyDate">${cmt.regDate}</div>
													<c:if test="${requestScope.blogInfoVo.authNo eq cmt.userNo}">
														<button class="deleteCommentButton" onclick="deleteComment('${cmt.walkLogCmtNo}')">삭제</button>
													</c:if>
												</div>
												<div class="MRuserIdandContent">
													<div class="MRreplyUserId">${cmt.name}</div>
													<div class="MRreplyContent">${cmt.content}</div>
												</div>



											</div>
										</c:if>
									</c:forEach>


								</div>
								<c:if test="${requestScope.blogInfoVo.authNo != 0}">
									<div class="MRcommentInputBox">
										<div class="MRinput-group">
											<textarea class="commentText form-control" aria-label="With textarea"></textarea>
										</div>
										<button class="MRreplyButton addCommentBtn" data-walklogno="${walkLog.walkLogNo}">등록</button>
									</div>
								</c:if>

							</div>



							<div class="MRborder"></div>
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