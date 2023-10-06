<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 업로드4</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<h2>파일 삭제</h2>
<p>삭제할 파일을 선택하세요:</p>

<form method="POST" action="${path1}/fileupload/deleteFile">
    <select name="filename">
        <c:forEach items="${fileList}" var="file">
            <option value="${file}">${file}</option>
        </c:forEach>
    </select>
    <br><br>
    <input type="submit" value="삭제">
</form>

<a href="${path1}/fileupload/fileUpload4">뒤로 가기</a>
</body>
</html>
