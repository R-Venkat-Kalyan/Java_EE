<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Timetable</title>
</head>
 <style>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to right, #0f0c29, #302b63, #24243e);
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        table {
            width: 100%; /* Increase the size of the table */
            max-width: 1100px; /* Set a maximum width to avoid over-expanding on larger screens */
            border-collapse: collapse;
            margin: 20px;
            border: 2px solid rgba(0, 0, 0, 0.8);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
            animation: borderAnimation 5s infinite;
        }

        @keyframes borderAnimation {
            0% {
                border-color: rgba(255, 0, 0, 0.8);
            }
            25% {
                border-color: rgba(0, 255, 0, 0.8);
            }
            50% {
                border-color: rgba(0, 0, 255, 0.8);
            }
            75% {
                border-color: rgba(255, 255, 0, 0.8);
            }
            100% {
                border-color: rgba(0, 0, 0, 0.8);
            }
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr {
            background-color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
            transition: background-color 0.2s ease-in-out;
            box-shadow: 0 0 5px #8fd9d8;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>

<body>
    <h1>Timetable</h1>
    <table border="1">
        <tr>
            <th>Days</th>
            <th>Hour 1-2</th>
            <th>Hour 3-4</th>
            <th>Hour 5-6</th>
            <th>Hour 7</th>
            <th>Hour 8-9</th>
            <th>Hour 10-11</th>
        </tr>

<%
try {

    // Create a database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","Kalyan959@");

    // Query to retrieve the entire timetable data
    PreparedStatement ps = conn.prepareStatement("select * from `2100030959`");
    ResultSet rs = ps.executeQuery();

    // Loop through the resultSet and display the data in the table
    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("Days") %></td>
            <td><%= rs.getString("hour1-2") %></td>
            <td><%= rs.getString("hour3-4") %></td>
            <td><%= rs.getString("hour5-6") %></td>
            <td><%= rs.getString("hour7") %></td>
            <td><%= rs.getString("hour8-9") %></td>
            <td><%= rs.getString("hour10-11") %></td>
        </tr>
<%
    }

    // Close the resources
    rs.close();
    //statement.close();
    conn.close();

} catch (Exception ex) {
    ex.printStackTrace();
}
%>
    </table>
</body>
</html>
