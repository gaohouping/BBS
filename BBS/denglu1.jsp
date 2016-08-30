<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=GB2312" %>
<%@page import="java.util.*,java.sql.*"%>
<%
  request.setCharacterEncoding("GB2312");
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection conn= DriverManager.getConnection("jdbc:odbc:BBS","sa","");
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
  ResultSet rs=null; 
%>
<%@ page import="java.util.*,java.sql.*"%>
<%
    String s_userid=request.getParameter("username");
    String s_password=request.getParameter("password");
    rs=stmt.executeQuery("select * from userinfo where userid='"+s_userid+"' and password='"+s_password+"'");
     if(rs.next())
	 {
      session.setAttribute("userid",s_userid);
      response.sendRedirect("leaveword.jsp");
    }
    else
    {
      response.sendRedirect("error.jsp?error=");
    }
%>