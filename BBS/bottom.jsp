<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*,java.sql.*"%>
<%
  request.setCharacterEncoding("GB2312");
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection conn = DriverManager.getConnection("jdbc:odbc:BBS","sa","");
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
  ResultSet rs=null;
	String id=(String)session.getAttribute("id");	 	 
	 try{
	rs=stmt.executeQuery("delete from notes where id='"+id+"'");

    }catch(Exception e){
	  response.sendRedirect("leaveword.jsp");
	  }
%>