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
    <title>회원 목록</title>
    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
</head>
<body>
<header id="header">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp" />
</header>

<section class="hero is-medium is-link">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                회원 목록
            </h1>
            <h2 class="subtitle">
                회원 목록을 표시합니다.
            </h2>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
    <div class="column is-8 is-offset-2">
        <div class="box">
            <table class="table is-fullwidth">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <!-- 필요한 회원 정보 항목을 추가하세요 -->
                </tr>
                </thead>
                <tbody>
                <c:forEach var="member" items="${memberList}">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.name}</td>
                        <td>${member.email}</td>
                        <!-- 필요한 회원 정보 항목을 추가하세요 -->
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <a class="button is-primary" href="${path1}/member/admin/memberListForm.do">회원 등록</a>
        </div>
    </div>
    </div>
</section>
<%--<section class="hero is-medium is-link">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                회원 등록 목록
            </h1>
            <h2 class="subtitle">
                회원 목록을 관리합니다.
            </h2>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns">
            <div class="column is-8 is-offset-2">
                <div class="box">
                    <table class="table is-fullwidth">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>이름</th>
                            <th>가입일</th>
                            <th>방문 횟수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${memberList}" var="member" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td><a href="${path1}/member/list.do?seq=${member.id}">${member.name}</a></td>
                                <td>
                                    <fmt:parseDate value="${member.regdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                    <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd" />
                                </td>
                                <td>${member.visited}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <a class="button is-primary" href="${path1}/member/detail.do">회원 등록</a>
                </div>
            </div>
        </div>
    </div>
</section> --%>

<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"/>
</footer>
</body>
</html>