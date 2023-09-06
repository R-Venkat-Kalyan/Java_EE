 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Validation</title>

<script>
  function showRegisterSuccessPopup() {
    alert("Registered Successfully..😀 \n You can Login now.");
    window.location.href = "login.html";
  }
</script>
</head>
<body>

<%! 
Connection con;
Statement stmt;
%>

<%
int ID = Integer.parseInt(request.getParameter("id"));
String email = request.getParameter("email");
String password = request.getParameter("pwd");
String rePassword = request.getParameter("cpswd");
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin");
    stmt = con.createStatement();
   // stmt.execute("create table UmsUsers(Id NUMBER, Email varchar(30), password varchar(30), Repassword varchar(30))");	
    PreparedStatement ps = con.prepareStatement("insert into UmsUsers values(?, ?, ?, ?)");
    ps.setInt(1, ID);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setString(4, rePassword);
    ps.execute();
    con.close();
	out.println("<script>");
	out.println("showRegisterSuccessPopup();");
	out.println("</script>");
} 
catch(Exception e) {
    System.out.println(e);
}
%>

</body>
</html>