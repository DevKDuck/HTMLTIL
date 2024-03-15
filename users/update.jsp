<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User insert form</title>
    <style>
        .updatecomplete {
            color: red;
            font-weight: bold;
            font-size: 16px;
            padding-bottom: 20px;
            display: inline-block; 
        }
    </style>
</head>
<body>
    <h1>
        수정 결과 화묜
    </h1>
    
    <c:if test="${updated}  != 0}">
    수정되었ㅅ브니다.
    </c:if>
    <div>
    <a href="users?action=list">목록</a>
    <a href="users?action=view&userid=${param.userid}"> 상세보기</a> 
    
    <!-- <form action = "users" method="post">    
    </form> -->
    </div>
</body>
</html>
 