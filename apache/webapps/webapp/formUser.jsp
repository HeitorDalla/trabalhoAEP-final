<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Novo Usuário</title>
  <link rel="stylesheet" href="style.css">
  <!-- SweetAlert2: feedback após cadastro -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <h2>Cadastro de Novo Usuário</h2>

  <form action="addUser.jsp" method="post">
    <table>
      <tr>
        <td><label for="nome">Nome:</label></td>
        <td><input type="text" id="nome" name="name" required></td>
      </tr>
      <tr>
        <td><label for="senha">Senha:</label></td>
        <td><input type="password" id="senha" name="password" required></td>
      </tr>
      <tr>
        <td><label for="email">E-mail:</label></td>
        <td><input type="email" id="email" name="email" required></td>
      </tr>
      <tr>
        <td>Sexo:</td>
        <td>
          <input type="radio" id="masc" name="gender" value="Masculino" required>
          <label for="masc">Masculino</label>
          <input type="radio" id="fem" name="gender" value="Feminino">
          <label for="fem">Feminino</label>
        </td>
      </tr>
      <tr>
        <td><label for="pais">País:</label></td>
        <td>
          <select name="country" id="pais" required>
            <option value="">-- Selecione --</option>
            <option value="Argentina">Argentina</option>
            <option value="Brasil">Brasil</option>
            <option value="Mexico">Mexico</option>
            <option value="Portugal">Portugal</option>
            <option value="USA">USA</option>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="Salvar">
        </td>
      </tr>
    </table>
  </form>

  <p><a href="viewUser.jsp">Voltar à lista</a></p>
  
  <c:if test="${resultado == 'sucess'}">
	  <script>
	    Swal.fire({
	      icon: 'success',
	      title: 'Usuário cadastrado!',
	      text: 'O novo usuário foi salvo com sucesso.',
	      confirmButtonColor: '#3085d6'
	    });
	  </script>
	</c:if>

  <c:if test="${resultado == 'error'}">
	  <script>
	    Swal.fire({
	      icon: 'error',
	      title: 'Erro ao salvar',
	      text: 'Não foi possível cadastrar o usuário. Tente novamente.',
	      confirmButtonColor: '#d33'
	    });
	  </script>
	</c:if> 
</body>
</html>
