<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" isErrorPage="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <title>기본 에러</title>
</head>
<body>
    <h3>Spring : 기본 에러페이지</h3>
    <p>${exception.message}</p>
</body>
</html>