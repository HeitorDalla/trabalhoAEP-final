<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${not empty error}">
  <script>
    Swal.fire({
      icon: 'error',
      title: 'Erro no CPF',
      text: '${error}',
      confirmButtonColor: '#d33'
    });
  </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Aluno</title>
  <link rel="stylesheet" href="style.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
  <h2>Cadastro de Aluno</h2>

  <form action="addAluno.jsp" method="post">
    <table>
      <tr>
        <td><label for="nome">Nome:</label></td>
        <td><input type="text" id="nome" name="nome" required></td>
      </tr>
      <tr>
        <td><label for="matricula">Matrícula:</label></td>
        <td><input type="text" id="matricula" name="matricula" required></td>
      </tr>
      <tr>
        <td><label for="cpf">CPF:</label></td>
        <td><input type="text" id="cpf" name="cpf" required></td>
      </tr>
      <tr>
        <td><label for="dataNascimento">Data de Nascimento:</label></td>
        <td><input type="date" id="dataNascimento" name="dataNascimento" required></td>
      </tr>
      <tr>
        <td><label for="email">E-mail:</label></td>
        <td><input type="email" id="email" name="email" required></td>
      </tr>
      <tr>
        <td><label for="telefone">Telefone:</label></td>
        <td><input type="text" id="telefone" name="telefone"></td>
      </tr>
      <tr>
        <td><label for="curso">Curso:</label></td>
        <td><input type="text" id="curso" name="curso" required></td>
      </tr>
      <tr>
        <td><label for="periodo">Período:</label></td>
        <td><input type="number" id="periodo" name="periodo" required></td>
      </tr>
      <tr>
        <td><label for="instituicaoId">ID Instituição:</label></td>
        <td><input type="number" id="instituicaoId" name="instituicaoId"></td>
      </tr>
      <tr>
        <td><label for="endereco">Endereço:</label></td>
        <td><textarea id="endereco" name="endereco" rows="3"></textarea></td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" value="Salvar"></td>
      </tr>
    </table>
  </form>

  <p><a href="viewAluno.jsp">Voltar à lista</a></p>
</body>
</html>