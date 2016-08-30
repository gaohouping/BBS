<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*,java.sql.*"%>
<%
  request.setCharacterEncoding("GB2312");
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection conn = DriverManager.getConnection("jdbc:odbc:BBS","sa","");
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
  ResultSet rs=null;
  String s_userid=request.getParameter("userid");
  String s_subject=request.getParameter("subject");
  String s_context=request.getParameter("context");
  rs = stmt.executeQuery("select max(id) from notes");
		rs.next();
		int id = rs.getInt(1)+1;
  String s_sql="insert into notes(id,userid,subject,date1,context) "+
             "values('"+id+"','"+s_userid+"','"+s_subject+"',getdate(),'"+s_context+"')" ;
  stmt.executeUpdate(s_sql);
  response.sendRedirect("leaveword.jsp");
%>