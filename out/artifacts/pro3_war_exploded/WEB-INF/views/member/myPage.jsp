<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>
    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
</head>
<body>
<header id="header">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"/>
</header>

<section class="hero is-medium is-link">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                마이 페이지
            </h1>
            <h2 class="subtitle">
                개인 정보를 표시합니다.
            </h2>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="box">
            <table class="table is-fullwidth">
                <tbody>
                <tr>
                    <td>ID</td>
                    <td>${member.id}</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>${member.name}</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${member.email}</td>
                </tr>
                <!-- 필요한 회원 정보 항목을 추가하세요 -->
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <a class="button is-primary" href="${path1}/member/list">목록으로 돌아가기</a>
        </div>
    </div>
</section>

<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"/>
</footer>
</body>
</html>
