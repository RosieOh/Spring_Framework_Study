<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹사이트 홈페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">
    <style>
        body {
            padding: 20px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .menu-item {
            font-size: 18px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<section class="section">
    <div class="container">
        <h2 class="title">웹사이트 홈페이지</h2>
        <a href="${path}/user/loginForm" class="menu-item button is-link is-rounded">로그인</a>
        <a href="${path}/user/agree" class="menu-item button is-link is-rounded">회원가입</a>
        <a href="${path}/user/read" class="menu-item button is-link is-rounded">마이페이지</a>
        <a href="${path}/admin/list" class="menu-item button is-link is-rounded">사용자 목록</a>
        <a href="${path}/file/fileUpload" class="menu-item button is-link is-rounded">파일 업로드 (1개)</a>
        <a href="${path}/file/fileUpload2" class="menu-item button is-link is-rounded">파일 업로드 (여러 개, 운영 서버용)</a>
        <a href="${path}/file/fileUpload3" class="menu-item button is-link is-rounded">파일 업로드 (여러 개, 운영 서버용)</a>
        <a href="${path}/locale/lang1" class="menu-item button is-link is-rounded">다국어 지원</a>
        <a href="${path}/calendar/home" class="menu-item button is-link is-rounded">달력</a>
        <a href="${path}/chat/home" class="menu-item button is-link is-rounded">채팅</a>
    </div>
</section>
</body>
</html>
