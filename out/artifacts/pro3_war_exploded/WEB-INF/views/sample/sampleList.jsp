<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>샘플 목록</title>
</head>
<body>
    <h2>샘플 목록</h2>
    <ul>
        <c:forEach items="${sampleList }" var="sample">
            <li>
                <span>번호 : ${sample.no}</span>
                <span></span>
            </li>
        </c:forEach>
    </ul>
</body>
</html>