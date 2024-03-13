<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//매개변수 설정  
String userid = request.getParameter("userid");
String userpassword = request.getParameter("userpassword");
String username = request.getParameter("username");
String userage = request.getParameter("userage");
String useremail = request.getParameter("useremail");

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
	
	String sql = "insert into users (userid, userpassword,username, userage, useremail) values (?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, userpassword);
	pstmt.setString(3, username);
	pstmt.setString(4, userage);
	pstmt.setString(5, useremail);
	int updated = pstmt.executeUpdate();
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>사용자 등록</title>
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
        등록 결과 화면
    </h1>
    <div>
       	<%if (updated == 1) { %>
           <a class = "updatecomplete">등록 되었습니다</a>
       	<%} %>
       <a href="list.jsp">목록</a>
    </div>
</body>
</html>
    
    
<%
	pstmt.close();
	conn.close();
} catch(SQLException e) {
	e.printStackTrace();
} catch(Exception e) {
	e.printStackTrace();
}
%>    