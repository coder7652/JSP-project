<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Salary Details</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee  Detail</h1>

       
        <% String emp_id = request.getParameter("emp_id");
        
        
        String url = "jdbc:mysql://localhost:3306/dbpayroll";
        String username = "root";
        String password = "0506";
        
        
        String query = "SELECT * FROM employees WHERE emp_id = ?";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, emp_id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                
                String emp_name = resultSet.getString("emp_name");
                String deptno = resultSet.getString("deptno");
                
                
                out.println("<table>");
                out.println("<tr><th>Employee Name</th><th>deptno</th></tr>");
                out.println("<tr><td>" + emp_name + "</td><td>" + deptno + "</td><td>" );
                
            } else {
                out.println("No salary details found for the given employee ID.");
            }


            connection.close();
            } catch (Exception e) {
                out.println("<p>An error occurred: " + e.getMessage() + "</p>");
            }

        %>
    </div>
</body>
</html>
