<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get 방식으로 데이터 값 전송</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <ul>
        <li><a href="${path1}/ajax/">Home</a></li>
    </ul>
    <button id="btn5" type="button" age="26" name="오태훈">Get 전송</button>
    <script>
        $(document).read(function () {
            $("#btn5").click(function()  {
                var human = {
                    "age" : parseInt($(this).attr("age")),
                    "name" : $(this).attr("name")
                };
                $.ajax({
                    type : "get",
                    url : "${path1}/ajax/test5pro",
                    data : human,
                    success:function(res) { console.log("성공", res) },
                    error:function(err) { console.log("실패", err) }
                });
            });
        });
    </script>
</body>
</html>