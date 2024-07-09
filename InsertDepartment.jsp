<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

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


