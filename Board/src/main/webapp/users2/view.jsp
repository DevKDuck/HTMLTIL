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
            width: 100px;
        }
        input {
            margin-bottom: 10px; 
        }
    </style>
</head>
<body>
    <h1>
        view 임시 화면
    </h1>
    
<%
		if(rs.next()) {
			String userpassword = rs.getString("userpassword");
			String username = rs.getString("username");
			String userage = rs.getString("userage");
			String useremail = rs.getString("useremail");
%>
            <label>아이디 : <%=userid %></label> <br/>
            <label>이름 : <%=username%></label><br/>
            <label>나이: <%=userage%></label><br/>
            <label>이메일: <%=useremail%></label><br/>
<%
		}

%>       
<script>
function jsDelete() {
	if (confirm("정말로 삭제하시겠습니까?")) {
		//서버의 URL을 설정한다 
		viewForm.action = "delete.jsp";
	
		//서버의 URL로 전송한다 
		viewForm.submit();
	}
}

function jsUpdateForm() {
	if (confirm("정말로 수정하시겠습니까?")) {
		//서버의 URL을 설정한다 
		viewForm.action = "updateForm.jsp";
	
		//서버의 URL로 전송한다 
		viewForm.submit();
	}	
}
</script>
<!-- 두개의 폼을 하나로 합치는 방법 , js를 사용하여 처리  -->
	<form id="viewForm" action="" method="post">
		<input type="hidden" name="userid" value="<%=userid%>">
		<input type="button" value="삭제" onclick="jsDelete()">
		<input type="button" value="수정" onclick="jsUpdateForm()">
	</form>     
 
	<form action="delete.jsp" method="post">
		<input type="hidden" name="userid" value="<%=userid%>">
		<input type="submit" value="삭제">
	</form>     
	<form action="updateForm.jsp" method="post">
		<input type="hidden" name="userid" value="<%=userid%>">
		<input type="submit" value="수정">
	</form>     
	
    <div>
        <a href="list.jsp">목록</a>
        <a href="updateForm.jsp?userid=<%=userid%>">수정</a>
        <a href="delete.jsp?userid=<%=userid%>">삭제</a>
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