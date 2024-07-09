<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert values in department table</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lightblue;
            margin: 0;
            padding: 0;
        }
        h1{
        font-family:bold;
        margin:0;
        width:100%;
        text-align: center;
         font-size: 60px;
          margin-bottom: 20px;
        }
        

        form {
            max-width: 600px;
            margin: 100px auto;
            margin-top: 20px;
            padding: 50px;
            background-color: #fff;
            border-radius: 50px;
            
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid black;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: darkgreen;
        }
    </style>
</head>
<body>
<h1>Insert new Department</h1>
    <form method="post" action="newinsert.jsp">
        deptno:<br>
        <input type="text" name="deptno">
        <br>
        dname:<br>
        <input type="text" name="dname">
        <br>
        loc:<br>
        <input type="text" name="loc">
        <br>
        <br>
        <br>
        <input type="submit" value="submit">
    </form>

    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*" %>

    <%
    try {
        String deptno = request.getParameter("deptno");
        String dname = request.getParameter("dname");
        String loc= request.getParameter("loc");

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbpayroll", "root", "0506");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("insert into department(deptno, dname, loc) values('" + deptno + "','" + dname + "','" + loc + "')");
        out.println("Data is successfully inserted!");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    }
    %>
</body>
</html>
