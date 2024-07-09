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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from department where deptno="+deptno;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<!DOCTYPE html>
<html>
<head>
<style>
    body {
        font-family: Arial;
        background-color: lightblue;
        margin: 0;
        padding: 0;
        justify-content: center; 
            align-items: center; 
    }
    h1 {
        text-align: center;
        color: black;
        font: bold;
    }
    form {
            width: 80%;
            margin: auto;
            
        }
    table {
        width: 80%;
        margin:  auto; 
        border-collapse: collapse;
        background-color: #fff;
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
    input[type="submit"] {
        width: 80%; 
        padding: 20px;
        background-color: lightpink;
        border: none;
        color: black;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
    }
    input[type="submit"]:hover {
        background-color: pink;
    }
</style>

</head>
<body>
<h1>Update department </h1>

<form method="post" action="UpdateDept_process.jsp">
<input type="hidden" name="deptno" value="<%=resultSet.getString("deptno") %>">
<input type="text" name="deptno" value="<%=resultSet.getString("deptno") %>">
<br>

dname:<br>
<input type="text" name="dname" value="<%=resultSet.getString("dname") %>">
<br>
loc :<br>
<input type="text" name="loc" value="<%=resultSet.getString("loc") %>">

<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>