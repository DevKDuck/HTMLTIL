
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User insert form</title>
    <style>
        label {
            display: inline-block;
            width: 120px;
        }
        input {
            margin-bottom: 10px; 
        }
    </style>
</head>
<body>
    <h1>
        회원정보 수정양식 
    </h1>
    <form action="users" method="post">
		<input type="hidden" name="action" value="update">
		<label>아이디 : </label> <input type="text" id="userid" name="userid" value="${user.userid}" readonly="readonly"> <br/>
		<label>비밀번호 : </label>   <input type="password" id="userpassword" name="userpassword" required="required" ><br/>
		<label>비밀번호확인 : </label>   <input type="password" id="userpassword2" name="userpassword2" required="required" ><br/>
		<label>이름 : </label>   <input type="text" id="username" name="username" value="${user.username}"><br/>
		<label>나이: </label>    <input type="text" id="userage" name="userage" value="${user.userage}"><br/>
		<label>이메일: </label>  <input type="text" id="useremail" name="useremail" value="${user.useremail}"><br/>
    <div>
        <input type="submit" value="수정">
        <a href="users?action=view&userid=${user.userid}}">취소</a>
    </div>
    
    </form>
    
</body>
</html>