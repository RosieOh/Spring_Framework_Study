<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="/pro3_war" />
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼 메인페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
    <style>

    </style>
</head>
<body>
<nav>
    <h2>티스푼 메인 페이지</h2>
</nav>
    <div class="container">
        이름 : ${myName }
        <hr>
        현재 : ${today }
    </div>
    <ul class="list">
        <li><a href="${path1}/sample/main.do">RequestMapping 방식 : Get</a></li>
        <li><a href="${path1}/sample/get1.do?id=dhxogns&pw=1234">GetMapping 방식 : request+model</a></li>
        <li><a href="${path1}/sample/get2.do?id=dhxogns&pw=1234">RequestMapping.GET 방식 : request+model</a></li>
        <li><a href="${path1}/sample/get3.do?id=dhxogns&pw=1234">RequestMapping.GET 방식 : RequestParam+model</a></li>
        <li><a href="${path1}/sample/get4.do?id=dhxogns&pw=1234">RequestMapping.GET 방식 : dto+model</a></li>
        <li><a href="${path1}/sample/get5.do?id=dhxogns&pw=1234">RequestMapping.GET 방식 : ModelAttribute+model</a></li>
        <li><a href="${path1}/sample/get6.do/dhxogns/1234">RequestMapping.GET 방식 : PathVariable+model</a></li>
        <li><a href="${path1}/sample/get7.do?id=dhxogns&pw=1234">RequestMapping.GET 방식 : RequestParam+ModelAndView</a></li>
        <li><a href="${path1}/sample/get7.do?id=dhxogns&pw=1234">RequestMapping.GET 방식 : RequestParam+ModelAndView</a></li>
        <li><a href="${path1}/board/list.do">게시판 보기</a></li>
    </ul>
</body>
</html>