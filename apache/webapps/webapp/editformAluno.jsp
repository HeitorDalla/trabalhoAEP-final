<c:if test="${not empty param.error}">
  <script>
    Swal.fire({
      icon: 'error',
      title: 'Erro na atualização',
      text: 'Ocorreu um erro ao atualizar o aluno. Verifique os logs para mais detalhes.',
      confirmButtonColor: '#d33'
    });
  </script>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sistemaestagio.dao.AlunoDao"%>
<%@ page import="com.sistemaestagio.bean.Aluno"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar Aluno</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));
Aluno aluno = AlunoDao.getAlunoById(id);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String dataNascimento = sdf.format(aluno.getDataNascimento());
%>

<h2>Editar Aluno</h2>

<form action="editAluno.jsp" method="post">
  <input type="hidden" name="id" value="<%=aluno.getId()%>" />
  <table>
    <tr>
      <td><label for="nome">Nome:</label></td>
      <td><input type="text" id="nome" name="nome" value="<%=aluno.getNome()%>" required></td>
    </tr>
    <tr>
      <td><label for="matricula">Matrícula:</label></td>
      <td><input type="text" id="matricula" name="matricula" value="<%=aluno.getMatricula()%>" required></td>
    </tr>
    <tr>
      <td><label for="cpf">CPF:</label></td>
      <td><input type="text" id="cpf" name="cpf" value="<%=aluno.getCpf()%>" required></td>
    </tr>
    <tr>
      <td><label for="dataNascimento">Data de Nascimento:</label></td>
      <td><input type="date" id="dataNascimento" name="dataNascimento" value="<%=dataNascimento%>" required></td>
    </tr>
    <tr>
      <td><label for="email">E-mail:</label></td>
      <td><input type="email" id="email" name="email" value="<%=aluno.getEmail()%>" required></td>
    </tr>
    <tr>
      <td><label for="telefone">Telefone:</label></td>
      <td><input type="text" id="telefone" name="telefone" value="<%=aluno.getTelefone()%>"></td>
    </tr>
    <tr>
      <td><label for="curso">Curso:</label></td>
      <td><input type="text" id="curso" name="curso" value="<%=aluno.getCurso()%>" required></td>
    </tr>
    <tr>
      <td><label for="periodo">Período:</label></td>
      <td><input type="number" id="periodo" name="periodo" value="<%=aluno.getPeriodo()%>" required></td>
    </tr>
    <tr>
      <td><label for="instituicaoId">ID Instituição:</label></td>
      <td><input type="number" id="instituicaoId" name="instituicaoId" value="<%=aluno.getInstituicaoId()%>"></td>
    </tr>
    <tr>
      <td><label for="endereco">Endereço:</label></td>
      <td><textarea id="endereco" name="endereco" rows="3"><%=aluno.getEndereco()%></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" value="Atualizar"></td>
    </tr>
  </table>
</form>

<p><a href="viewAluno.jsp">Voltar à lista</a></p>
</body>
</html>