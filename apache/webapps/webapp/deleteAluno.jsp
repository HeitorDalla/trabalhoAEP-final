<%@ page import="com.sistemaestagio.dao.AlunoDao"%>
<jsp:useBean id="a" class="com.sistemaestagio.bean.Aluno"></jsp:useBean>
<jsp:setProperty property="id" name="a"/>

<%
AlunoDao.delete(a);
response.sendRedirect("viewAluno.jsp");
%>