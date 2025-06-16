<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Usuários</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ page import="com.sistemaestagio.dao.UserDao"%>
	<%@ page import="com.sistemaestagio.bean.User"%>

	<%
	// Recupera o ID do usuário enviado pela URL
	int id = Integer.parseInt(request.getParameter("id"));

	// Busca o usuário no banco de dados pelo ID
	User usuario = UserDao.getRegistroById(id);
	%>

	<h2>Editar Usuário</h2>

	<form action="editUser.jsp" method="post">
		<input type="hidden" name="id" value="<%=usuario.getId()%>" />
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="name"
					value="<%=usuario.getName()%>" /></td>
			</tr>
			<tr>
				<td>Senha:</td>
				<td><input type="password" name="password"
					placeholder="Deixe em branco para manter a senha atual"
					value="<%=usuario.getPassword()%>" /></td>
			</tr>
			<tr>
				<td>e-mail:</td>
				<td><input type="email" name="email"
					value="<%=usuario.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Sexo:</td>
				<td><input type="radio" name="gender" value="Masculino"
					<%=usuario.getGender().equals("Masculino") ? "checked" : ""%> />Masculino
					<input type="radio" name="gender" value="Feminino"
					<%=usuario.getGender().equals("Feminino") ? "checked" : ""%> />Feminino
				</td>
			</tr>
			<tr>
				<td>País:</td>
				<td><select name="country" class="form-control">
						<option value="Argentina"
							<%="Argetina".equals(usuario.getCountry()) ? "selected" : ""%>>Argetina</option>
						<option value="Brasil"
							<%="Brasil".equals(usuario.getCountry()) ? "selected" : ""%>>Brasil</option>
						<option value="Mexico"
							<%="Mexico".equals(usuario.getCountry()) ? "selected" : ""%>>Mexico</option>
						<option value="Portugal"
							<%="Portugal".equals(usuario.getCountry()) ? "selected" : ""%>>Portugal</option>
						<option value="USA"
							<%="USA".equals(usuario.getCountry()) ? "selected" : ""%>>USA</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Atualizar"></input></td>
			</tr>
		</table>
	</form>


	<p>
		<a href="viewUser.jsp">Voltar à lista</a>
	</p>
</body>
</html>