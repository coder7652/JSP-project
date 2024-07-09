<!DOCTYPE html>
<html>
<head>
    <title>Employee Salary</title>
    <style>
        body {
            font-family: Arial;
            background-color: lightblue;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: pink;
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; 
        }
        .salary-details {
            margin-top: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee  Details</h1>
        <form method="post" action="employee_salary.jsp">
            <label for="emp_id">Employee ID:</label>
            <input type="text" id="emp_id" name="emp_id" required><br>
            <input type="submit" value="Get Salary Details">
        </form>
        <div class="salary-details">
          
            <%@page import="java.sql.*" %>
            <%@page import="javax.sql.*" %>
            <% 
                String emp_id = request.getParameter("emp_id");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbpayroll", "root", "0506");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM salaries WHERE emp_id = '" + emp_id + "'");
                   
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </div>
    </div>
</body>
</html>


