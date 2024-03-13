<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//매개변수 설정  
String userid = request.getParameter("userid");

Connection conn;
try {
	//JDBC Driver 등록
	Class.forName("oracle.jdbc.OracleDriver");
	
	//연결하기
	conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521/xe", 
		"bituser", 
		"1004"
	);
	
	String sql = "SELECT * FROM users where userid=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	ResultSet rs = pstmt.executeQuery();
%>
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
<!--    <form id="updateForm" action="update.jsp"method="post">
   <input type="text" id="userid" name="userid">
   </form>-->  
     <form action="update.jsp" method="get">
<%
		if(rs.next()) {
			String userpassword = rs.getString("userpassword");
			String username = rs.getString("username");
			String userage = rs.getString("userage");
			String useremail = rs.getString("useremail");
%>
            <label>아이디 : </label> <input type="text" id="userid" name="userid" value="<%=userid%>" readonly="readonly"> <br/>
            <label>비밀번호 : </label>   <input type="password" id="userpassword" name="userpassword" ><br/>
            <label>비밀번호확인 : </label>   <input type="password" id="userpassword2" name="userpassword2" ><br/>
            <label>이름 : </label>   <input type="text" id="username" name="username" value="<%=username%>"><br/>
            <label>나이: </label>    <input type="text" id="userage" name="userage" value="<%=userage%>"><br/>
            <label>이메일: </label>  <input type="text" id="useremail" name="useremail" value="<%=useremail%>"><br/>
<%
		}
%>        
    <div>
        <input type="submit" value="수정">
        <a href="view.jsp?userid=<%=userid%>">취소</a>
    </div>
    
 </form>
    
</body>

</html>

<%
	rs.close();
	pstmt.close();
	conn.close();
} catch(SQLException e) {
	e.printStackTrace();
} catch(Exception e) {
	e.printStackTrace();
}
%>
