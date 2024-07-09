<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>EMPLOYEE PAYROLL SYSTEM</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #4682B4;
        }
        nav {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 20px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        nav ul li a:hover {
            color: #ffd700; 
        }
        h1 {
            text-align: center;
            margin-top: 50px;
            color: #333;
        }
        img {
            display: block;
            margin: 0 auto;
            margin-top: 20px;            
            width: 100%;
            max-width: 600px; 
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 50px;
            background-color: #ADD8E6;
            border-radius: 10px;
            
            
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            z-index: 1;
        }
        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
            color: black;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Department</a>
                <div class="dropdown-content">
                    <a href="newinsert.jsp">Insert Department</a>
                    <a href="UpdateDept3.jsp">Update Department</a>
                    <a href="DeleteDept.jsp">Delete Department</a>
                </div>
            </li>
            
            <li><a href="employee.jsp">Employee </a></li>
            <li><a href="salary.jsp">Salary</a></li>
            <li><a href="payment.html">Payment</a></li>
            <li><a href="SignIn.jsp">Sign In</a></li>
            <li><a href="SignUp.jsp">Sign Up</a></li>
        </ul>
    </nav>
    <div class="container">
        <h1>Welcome to Employee Payroll System</h1>
        <img src="images/payroll.jpg" alt="Payroll Image">
    </div>
</body>
</html>
