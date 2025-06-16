<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sistemaestagio.bean.Aluno" %>
<%@ page import="com.sistemaestagio.dao.AlunoDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Listagem de Alunos</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%
List<Aluno> list = AlunoDao.getAllAlunos();
request.setAttribute("list", list);
%>

<p><a href="index.html" class="btn">[home]</a></p>
<h1>Listagem de Alunos</h1>

<p><a href="formAluno.jsp" class="btn">➕ Novo Aluno</a></p>

<table class="table-user">
  <tr>
    <th>ID</th>
    <th>Nome</th>
    <th>Matrícula</th>
    <th>CPF</th>
    <th>Curso</th>
    <th>Período</th>
    <th>Ações</th>
  </tr>
  <c:forEach items="${list}" var="aluno">
    <tr>
      <td>${aluno.id}</td>
      <td>${aluno.nome}</td>
      <td>${aluno.matricula}</td>
      <td>${aluno.cpf}</td>
      <td>${aluno.curso}</td>
      <td>${aluno.periodo}</td>
      <td>
        <a href="editformAluno.jsp?id=${aluno.id}" class="btn">✏️ Editar</a>
        <a href="deleteAluno.jsp?id=${aluno.id}" class="btn" onclick="return confirm('Deseja realmente excluir este aluno?');">🗑️ Excluir</a>
      </td>
    </tr>
  </c:forEach>
</table>

</body>
</html>