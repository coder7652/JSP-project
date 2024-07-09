<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
try {
    String payment_id = request.getParameter("payment_id");
    String emp_id = request.getParameter("emp_id");
    String amount= request.getParameter("amount"); 
    

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbpayroll", "root", "0506");
    Statement st = conn.createStatement();
    int i = st.executeUpdate("insert into payments(payment_id, emp_id, amount) values('" + payment_id + "','" + emp_id + "','" + amount + "')");
    out.println("Data is successfully inserted!");
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
}
%>

