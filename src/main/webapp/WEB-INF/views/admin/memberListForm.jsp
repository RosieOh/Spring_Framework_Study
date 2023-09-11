<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 목록 조회 폼</title>
    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
</head>
<body>
<section class="section">
    <div class="container">
        <h1 class="title">회원 목록 조회</h1>
        <form action="<%= request.getContextPath() %>/member/admin/memberList.do" method="GET">
            <button class="button is-primary" type="submit">회원 목록 조회</button>
        </form>
    </div>
</section>
</body>
</html>
