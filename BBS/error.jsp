<%@ page contentType="text/html; charset=GB2312" %>
<%
//request.setCharacterEncoding("GB2312");
String s_error=request.getParameter("error");
%>
<link href="maincss.css" rel="stylesheet" type="text/css">

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="td">
  <tr>
    <td><font color="#FF0000"><%=s_error%></font>&nbsp;&nbsp;<div align="center"><a href="javascript:history.go(-1);" >用户名或密码错误！！点击返回</a></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
