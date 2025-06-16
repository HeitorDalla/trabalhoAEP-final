<%@ page import="com.sistemaestagio.dao.AlunoDao, com.sistemaestagio.bean.Aluno, java.text.*, java.net.URLEncoder" %>
<jsp:useBean id="aluno" class="com.sistemaestagio.bean.Aluno" />

<%
try {
    // Conversão segura da data
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    aluno.setDataNascimento(sdf.parse(request.getParameter("dataNascimento")));
    
    // Preenche todos os campos
    aluno.setNome(request.getParameter("nome"));
    aluno.setMatricula(request.getParameter("matricula"));
    aluno.setCpf(request.getParameter("cpf"));
    aluno.setEmail(request.getParameter("email"));
    aluno.setTelefone(request.getParameter("telefone"));
    aluno.setCurso(request.getParameter("curso"));
    aluno.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
    
    // Campo opcional
    String instituicaoId = request.getParameter("instituicaoId");
    aluno.setInstituicaoId(instituicaoId == null || instituicaoId.isEmpty() ? 0 : Integer.parseInt(instituicaoId));
    
    aluno.setEndereco(request.getParameter("endereco"));

    // Persiste no banco
    int idGerado = AlunoDao.save(aluno);
    
    if (idGerado > 0) {
        response.sendRedirect("viewAluno.jsp?success=true&id=" + idGerado);
    } else {
        response.sendRedirect("formAluno.jsp?error=" + URLEncoder.encode(idGerado == -1 ? "CPF inválido" : "Erro ao cadastrar", "UTF-8"));
    }
} catch (Exception e) {
    response.sendRedirect("formAluno.jsp?error=" + URLEncoder.encode("Erro: " + e.getMessage(), "UTF-8"));
}
%>