<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String deptno = request.getParameter("deptno");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "dbpayroll";
String userid = "root";
String password = "0506";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
 <style>
        body {
            font-family: Arial;
            background-color: lightblue;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: black;
            font:bold;
        }
         table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 5px;
           
        }
      
        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid black;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="UPDATE"] {
            width: 80%;
            padding: 10px;
            background-color: lightpink;
            
            color: lightpink;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none; 
            display: block;
            font-weight: bold;
        }
        input[type="UPDATE"]:hover {
            background-color: pink;
        }
    </style>
</head>
<body>

<h1>DEPARTMENT DATA</h1>

<table border="3">
<tr>
<td>Department Number</td>
<td>Department Name </td>
<td>Location</td>
<td>UPDATE</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from department";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("deptno") %></td>
<td><%=resultSet.getString("dname") %></td>
<td><%=resultSet.getString("loc") %></td>

<td><a href="UpdateDept.jsp?deptno=<%=resultSet.getString("deptno")%>">UPDATE</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>

