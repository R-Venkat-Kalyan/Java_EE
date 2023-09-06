<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.PreparedStatement, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Validation</title>

<script>
  function showLoginSuccessPopup() {
    alert("Login Successful..😊");
    window.location.href = "Modules.jsp";
  }
</script>

<script>
  function showLoginFailPopup() {
    alert("Login Failed..😌\nInvalid credentials OR user not registered");
    window.location.href = "login.html";
  }
</script>
</head>
<body>

<%!
Connection conn;
Statement stmt;
PreparedStatement ps;
ResultSet rs;
%>

<%
int id  = Integer.parseInt(request.getParameter("logID"));
String password = request.getParameter("logPWD");
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin");
	stmt = conn.createStatement();
    ps = conn.prepareStatement("select * from UmsUsers where Id =? AND password =?");
	ps.setInt(1, id);
	ps.setString(2, password);
	rs = ps.executeQuery();
	if(rs.next()) {
		// Show the login success popup before opening "Modules.html"
		out.println("<script>");
		out.println("showLoginSuccessPopup();");
		out.println("</script>");

	}
	else {
		// Show the login fail popup before opening "login.html"
		out.println("<script>");
		out.println("showLoginFailPopup();");
		out.println("</script>");		
	}
}
catch(Exception e) {
	System.out.println(e);
}
%>
</body>
</html>