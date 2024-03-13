<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	
	String sql = "SELECT * FROM users ORDER BY username";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
	

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .button-container {
            margin-top: 20px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px; 
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h1>회원목록</h1>
  
    <form id="listForm" action="view.jsp" method="post">
    	<input type="hidden" id="userid" name="userid" >
    </form>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>나이</th>
            <th>이메일</th>
        </tr>
<%
		while(rs.next()) {
			String userid = rs.getString("userid");
			String userpassword = rs.getString("userpassword");
			String username = rs.getString("username");
			String userage = rs.getString("userage");
			String useremail = rs.getString("useremail");
%>
        <tr>
            <td onclick="jsView('<%=userid%>')"  style="cursor:pointer;"><%=userid %></a></td>
            <td><%=username%></td>
            <td><%=userage%></td>
            <td><%=useremail%></td>
        </tr>
<%
		}
%>        
    </table>
<script>
function jsView(uid) {
	//인자의 값을 설정한다 
	userid.value = uid;
	
	//양식을 통해서 서버의 URL로 값을 전달한다
	listForm.submit();
	
}
</script>      
    <div class="button-container">
        <a href="insertform.html">등록</a>
    </div>
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