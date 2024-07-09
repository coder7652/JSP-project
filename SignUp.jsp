<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: lightblue;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: lightpink;
            border-radius: 8px;
            border:3px solid black;
            box-sizing: border-box;
            
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: green;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: darkgreen;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form action="" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Sign Up">
        </form>
       
        <%@page import="java.sql.*" %>
        <%!
            
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/dbpayroll";
            String databaseUser = "root";
            String databasePassword = "0506";
        %>
        <%
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            
            Connection connection = null;
            Statement statement = null;

            try {
              
                Class.forName(driver);

                
                connection = DriverManager.getConnection(connectionUrl, databaseUser, databasePassword);

            
                statement = connection.createStatement();

          
                String query = "INSERT INTO users (username, email, password) VALUES ('" + username + "', '" + email + "', '" + password + "')";
                statement.executeUpdate(query);

              
                statement.close();
                connection.close();

                
                
                out.println("You've successfully signed up.");
            


            } catch (Exception e) {
                
                e.printStackTrace();
            } finally {
                
                try {
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                 
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>
