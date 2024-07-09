<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salary Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: lightblue;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
           
        }
        
        h2 {
            text-align: center;
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
        <h2>Salary Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Salary</th>
                   
                </tr>
            </thead>
            <tbody>
                <%@page import="java.sql.*" %>
                <%@page import="javax.sql.*" %>
                <% 
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbpayroll", "root", "0506");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * FROM salaries");
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("emp_id") + "</td>");
                            out.println("<td>" + rs.getString("salary") + "</td>");
                            
                            out.println("</tr>");
                        }
                        con.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

