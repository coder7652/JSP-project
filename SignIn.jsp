<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <style>
        <style>
        body {
            font-family: Arial;
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
            
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"] {
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
            background-color:darkgreen;
        }
    </style>

</head>
<body>
    <div class="container">
        <h2>Sign In</h2>
        <form method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Sign In">
        </form>
       
       <%@ page import="java.sql.*,java.util.*" %>

	<%
	String username = request.getParameter("username");
	String pass = request.getParameter("password");
	
	System.out.println(username);
	System.out.println(pass);
	
	Connection conn = null;
	try{
		String connStr = "jdbc:mysql://localhost:3306/dbpayroll";
		String user = "root";
		String password = "0506";
		
		conn = DriverManager.getConnection(connStr, user, password);
		if(conn != null)
		{
			System.out.println("Connection Successful");
		}
		
		Statement st = conn.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM users where username='"+username+"' AND password='"+pass+"'");
		{
		if(!rs.next())
		{
			out.println("Incorrect Username or Password!!!! Try again");
			//response.sendRedirect("error.jsp");
		}
		else
		{
			session.setAttribute("Username",username);
			out.println("You've successfully logged in");
			//response.sendRedirect("wrongcred.html");
		}
	}
			
		
	}
	catch(SQLException e){
		e.printStackTrace();
	}
	finally {
		if(conn != null)
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	%>
    </div>
</body>
</html>





