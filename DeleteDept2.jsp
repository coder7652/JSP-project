<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
String deptno = request.getParameter("deptno");
if (deptno != null && !deptno.isEmpty()) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbpayroll", "root", "0506");
        String sql = "DELETE FROM department WHERE deptno=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, deptno);
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Data Deleted Successfully!");
        } else {
            out.println("No data found for department number: " + deptno);
        }
        conn.close();
    } catch (SQLException e) {
        out.print("SQL Exception: " + e.getMessage());
        e.printStackTrace();
    } catch (Exception e) {
        out.print("Exception: " + e.getMessage());
        e.printStackTrace();
    }
} else {
    out.println("Department number parameter is null or empty.");
}
%>
