<%@ page import="com.sistemaestagio.dao.AlunoDao"%>
<%@ page import="com.sistemaestagio.bean.Aluno"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="a" class="com.sistemaestagio.bean.Aluno"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>

<%
System.out.println("=== INÍCIO DA ATUALIZAÇÃO ===");
System.out.println("ID recebido: " + a.getId());

// Log de todos os parâmetros recebidos
java.util.Enumeration<String> params = request.getParameterNames();
while(params.hasMoreElements()) {
    String paramName = params.nextElement();
    System.out.println(paramName + ": " + request.getParameter(paramName));
}

try {
    String dataNascimento = request.getParameter("dataNascimento");
    System.out.println("Data recebida: " + dataNascimento);
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    a.setDataNascimento(sdf.parse(dataNascimento));
    
    System.out.println("Aluno preparado para atualização: " + a.toString());
    
    int i = AlunoDao.update(a);
    System.out.println("Resultado da atualização: " + i + " linhas afetadas");
    
    if(i > 0) {
        System.out.println("Atualização bem-sucedida");
    } else {
        System.out.println("Nenhum registro foi atualizado");
    }
    
    response.sendRedirect("viewAluno.jsp");
} catch(Exception e) {
    System.out.println("ERRO durante a atualização: ");
    e.printStackTrace();
    response.sendRedirect("editformAluno.jsp?id=" + a.getId() + "&error=1");
}
%>