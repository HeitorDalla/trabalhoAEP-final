<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sistemaestagio.bean.User" %>
<%@ page import="com.sistemaestagio.dao.UserDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Listagem de usuários</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%
  int currentPage = 1;
  int pageSize = 10;

  if (request.getParameter("page") != null) {
      try {
          currentPage = Integer.parseInt(request.getParameter("page"));
      } catch (NumberFormatException e) {
    	  currentPage = 1;
      }
  }

  List<User> list = UserDao.getUsersByPage(currentPage, pageSize);
  int totalUsers = UserDao.getUserCount();
  int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

  request.setAttribute("list", list);
  request.setAttribute("currentPage", currentPage);
  request.setAttribute("totalPages", totalPages);
%>
<p><a href="index.html" class="btn">[home]</a></p>
<h1>Listagem de Usuários</h1>


<p><a href="formUser.jsp" class="btn">➕ Novo Usuário</a></p>

<table class="table-user">
  <tr>
    <th>ID</th>
    <th>Nome</th>
    <th>E-mail</th>
    <th>Gênero</th>
    <th>País</th>
    <th>Ações</th>
  </tr>
  <c:forEach items="${list}" var="user">
    <tr>
      <td>${user.id}</td>
      <td>${user.name}</td>
      <td>${user.email}</td>
      <td>${user.gender}</td>
      <td>${user.country}</td>
      <td>
        <a href="editformUser.jsp?id=${user.id}" class="btn">✏️ Editar</a>
        <a href="deleteUser.jsp?id=${user.id}" class="btn" onclick="return confirm('Deseja realmente excluir este usuário?');">🗑️ Excluir</a>
      </td>
    </tr>
  </c:forEach>
</table>

<div class="pagination">
  <c:if test="${currentPage > 1}">
    <a href="viewUser.jsp?page=${currentPage - 1}">⬅ Anterior</a>
  </c:if>

  <c:forEach begin="1" end="${totalPages}" var="i">
    <a href="viewUser.jsp?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
  </c:forEach>

  <c:if test="${currentPage < totalPages}">
    <a href="viewUser.jsp?page=${currentPage + 1}">Próxima ➡</a>
  </c:if>
</div>

</body>
</html>
