<%@ page contentType="text/html; charset=GB2312" errorPage="error.jsp"%>
<%@ page import="java.util.*,java.sql.*"%>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.registerform.userid.value == "" )
     { alert("�������û���!"); document.registerform.userid.focus(); return false; } 
  if( document.registerform.password.value == "" )
     { alert("����������!"); document.registerform.password.focus(); return false; } 	 		 
  return true;                                                                                          
 } 
</SCRIPT>
<%
  request.setCharacterEncoding("GB2312");
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection conn = DriverManager.getConnection("jdbc:odbc:BBS","sa","");
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
  ResultSet rs=null;
%>
<%
  String op = request.getParameter("op");
  if(op!=null&&op.equals("register")){
    String s_userid=request.getParameter("userid");
    String s_password=request.getParameter("password");
    String s_sql="insert into userinfo(userid,password,state) "+
             "values('"+s_userid+"','"+s_password+"','0')" ;
    try{
      stmt.executeUpdate(s_sql);
    }catch(Exception e){
      response.sendRedirect("error.jsp?error=ע��ʧ��,"+e.getMessage());
     }
  }
%>
<link href="maincss.css" rel="stylesheet" type="text/css">
<div align="center">
<table width="750" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td >&nbsp;</td>
  </tr>
  <tr> 
    <td ><div align="center">
  <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
<%
  if(op==null){
%>
<form name="registerform" action="register.jsp?op=register" method="post">
    <tr> 
      <td width="15%"><div align="right">�û���</div></td>
      <td><div align="left"><input name="userid" type="text" size="20"><font color="red">*</font></div></td>
    </tr>
    <tr> 
      <td><div align="right">����</div></td>
      <td><div align="left"><input name="password" type="password" size="20"><font color="red">*</font></div></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td><div align="left"> 
        <input name="submit" type="submit" value=" ע�� " onClick="return CheckSubmit();">&nbsp;&nbsp;
        <input name="reset" type="reset" value=" ������д ">
         </div></td>
    </tr>		  
</form>
<%}else{%>
 	<tr> 
       <td colspan="2">&nbsp;&nbsp;��ϲ,ע��ɹ�,���ס�����û���������!���ھ�ȥ<a href="denglu.jsp">��ҳ��½</a>.</td>
    </tr>
<%}%>		  		  
  </table>
   </div>    </td>
  </tr>
</table>
</div>  