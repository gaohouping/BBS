<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	request.setCharacterEncoding("utf-8");
	String op = request.getParameter("op");
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection conn=DriverManager.getConnection("jdbc:odbc:BBS","sa","");
	Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs=null;
%>
<%
	String subject=(String)session.getAttribute("subject");	
try{
  Statement sta=conn.createStatement();
   sta.executeUpdate("CREATE TABLE "+subject+" " +
    "(COF_NAME VARCHAR(32), SUP_ID INTEGER, PRICE FLOAT, " +
    "SALES INTEGER, TOTAL INTEGER)");
}catch(Exception e){}
	  response.sendRedirect("huifu.jsp");
%>