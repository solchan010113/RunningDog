<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Walk Log Modify Form</title>
    <link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://kit.fontawesome.com/98aecd1b62.js" crossorigin="anonymous"></script>
    <!-- 추가로 필요한 스크립트 및 스타일은 여기에 추가할 수 있습니다. -->
</head>
<body>
    <jsp:include page="../global/header.jsp"></jsp:include>

    <section>
        <div class="contents">
            <div class="mainWrapper">
                <div class="mainPosts">
                    <div class="mainRecordSection">
                        <form action="${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/${selectedWalkLog.walkLogNo}/modify" method="post">
                            <div class="MRprofileBox">
                                <!-- 프로필 이미지, 이름, 등록일자 등은 수정 불가능하도록 readonly 속성 추가 -->
                                <div class="MRprofileWrapper1">
                                    <div class="MRprofileImg1">
                                        <img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
                                    </div>
                                    <div class="MRuserName1">
                                        <input type="text" name="name" value="${selectedWalkLog.name}" readonly>
                                    </div>
                                </div>
                                <div class="wrappingBox">
                                    <div class="MRtitleBox">
                                        <!-- 제목과 내용 수정 가능한 input -->
                                        <div class="MRtitle">
                                            <input type="text" name="title" value="${selectedWalkLog.title}">
                                        </div>
                                    </div>
                                    <div class="MRrecordBox">
                                        <div class="MRdistanceBox">
                                            <!-- 산책 거리 수정 가능한 input -->
                                            <div class="MRrecordData">
                                                <input type="text" name="distanceFormatted" value="${selectedWalkLog.distanceFormatted}">
                                            </div>
                                            <div class="MRlabel">산책거리</div>
                                        </div>
                                        <div class="MRtimeBox">
                                            <!-- 산책 시간 수정 가능한 input -->
                                            <div class="MRrecordData">
                                                <input type="text" name="logTimeFormatted" value="${selectedWalkLog.logTimeFormatted}">
                                            </div>
                                            <div class="MRlabel">산책시간</div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 수정 버튼 추가 -->
                                <div class="modifyDelete">
                                    <button type="submit" class="modifyButton">수정</button>
                                </div>
                            </div>
                            <!-- 내용 수정 가능한 textarea -->
                            <div class="walkLogContent">
                                <textarea name="content">${selectedWalkLog.content}</textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>