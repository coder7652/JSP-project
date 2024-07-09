<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/dbpayroll";%>
<%!String user = "root";%>
<%!String psw = "0506";%>
<%
String deptno = request.getParameter("deptno");
String dname=request.getParameter("dname");
String loc=request.getParameter("loc");

if(deptno != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update department set deptno=?,dname=?,loc=? where deptno="+deptno;
ps = con.prepareStatement(sql);
ps.setString(1,deptno);
ps.setString(2, dname);
ps.setString(3, loc);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>




