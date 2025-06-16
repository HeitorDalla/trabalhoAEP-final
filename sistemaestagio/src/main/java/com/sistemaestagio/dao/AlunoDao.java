package com.sistemaestagio.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.sistemaestagio.bean.Aluno;

public class AlunoDao {
    // Configurações atualizadas para garantir conexão
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sistemaestagio?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            conn.setAutoCommit(true); // Importante!
            return conn;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver não encontrado", e);
        }
    }

    public static int save(Aluno aluno) throws SQLException {
        if (!isValidCPF(aluno.getCpf())) {
            return -1;
        }

        String sql = "INSERT INTO aluno (nome, matricula, cpf, data_nascimento, email, telefone, curso, periodo, instituicao_id, endereco) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setString(3, aluno.getCpf());
            stmt.setDate(4, new java.sql.Date(aluno.getDataNascimento().getTime()));
            stmt.setString(5, aluno.getEmail());
            stmt.setString(6, aluno.getTelefone());
            stmt.setString(7, aluno.getCurso());
            stmt.setInt(8, aluno.getPeriodo());
            stmt.setInt(9, aluno.getInstituicaoId());
            stmt.setString(10, aluno.getEndereco());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1); // Retorna o ID gerado
                    }
                }
            }
            return 0;
        }
    }

    public static int update(Aluno aluno) {
        System.out.println("[AlunoDao] Iniciando atualização para aluno ID: " + aluno.getId());

        String sql = "UPDATE aluno SET nome=?, matricula=?, cpf=?, data_nascimento=?, email=?, telefone=?, curso=?, periodo=?, instituicao_id=?, endereco=? WHERE id=?";

        try (Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            // teste
            System.out.println("[AlunoDao] Valores para atualização:");
            System.out.println("Nome: " + aluno.getNome());
            
            ps.setString(1, aluno.getNome());
            ps.setString(2, aluno.getMatricula());
            ps.setString(3, aluno.getCpf());
            ps.setDate(4, new java.sql.Date(aluno.getDataNascimento().getTime()));
            ps.setString(5, aluno.getEmail());
            ps.setString(6, aluno.getTelefone());
            ps.setString(7, aluno.getCurso());
            ps.setInt(8, aluno.getPeriodo());
            ps.setInt(9, aluno.getInstituicaoId());
            ps.setString(10, aluno.getEndereco());
            ps.setInt(11, aluno.getId());

            System.out.println("[AlunoDao] Query preparada: " + ps.toString());

            System.out.println("[DEBUG] Executando update: " + ps.toString());
            
            int result = ps.executeUpdate();
            if (result == 0) {
                System.err.println("[ERRO] Nenhum registro foi atualizado para o ID: " + aluno.getId());
            }
            return result;
            
        } catch (SQLException e) {
            System.err.println("[ERRO] Falha ao atualizar aluno ID: " + aluno.getId());
            e.printStackTrace();
            return 0;
        }
    }

    public static int delete(Aluno aluno) {
        String sql = "DELETE FROM aluno WHERE id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, aluno.getId());
            System.out.println("[DEBUG] Executando delete: " + ps.toString());
            
            return ps.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("[ERRO] Falha ao excluir aluno ID: " + aluno.getId());
            e.printStackTrace();
            return 0;
        }
    }

    public static List<Aluno> getAllAlunos() {
        List<Aluno> alunos = new ArrayList<>();
        String sql = "SELECT * FROM aluno ORDER BY nome";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id"));
                aluno.setNome(rs.getString("nome"));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setDataNascimento(rs.getDate("data_nascimento"));
                aluno.setEmail(rs.getString("email"));
                aluno.setTelefone(rs.getString("telefone"));
                aluno.setCurso(rs.getString("curso"));
                aluno.setPeriodo(rs.getInt("periodo"));
                aluno.setInstituicaoId(rs.getInt("instituicao_id"));
                aluno.setEndereco(rs.getString("endereco"));
                alunos.add(aluno);
            }
            
        } catch (SQLException e) {
            System.err.println("[ERRO] Falha ao listar alunos");
            e.printStackTrace();
        }
        return alunos;
    }

    public static Aluno getAlunoById(int id) {
        String sql = "SELECT * FROM aluno WHERE id = ?";
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Aluno aluno = new Aluno();
                    aluno.setId(rs.getInt("id"));
                    aluno.setNome(rs.getString("nome"));
                    aluno.setMatricula(rs.getString("matricula"));
                    aluno.setCpf(rs.getString("cpf"));
                    aluno.setDataNascimento(rs.getDate("data_nascimento"));
                    aluno.setEmail(rs.getString("email"));
                    aluno.setTelefone(rs.getString("telefone"));
                    aluno.setCurso(rs.getString("curso"));
                    aluno.setPeriodo(rs.getInt("periodo"));
                    aluno.setInstituicaoId(rs.getInt("instituicao_id"));
                    aluno.setEndereco(rs.getString("endereco"));
                    return aluno;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("[ERRO] Falha ao buscar aluno ID: " + id);
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isValidCPF(String cpf) {
        if (cpf == null || cpf.length() != 11 || !cpf.matches("\\d{11}")) {
            return false;
        }

        // Cálculo do primeiro dígito verificador
        int soma = 0;
        for (int i = 0; i < 9; i++) {
            soma += (cpf.charAt(i) - '0') * (10 - i);
        }
        int digito1 = 11 - (soma % 11);
        if (digito1 >= 10) digito1 = 0;
        
        // Cálculo do segundo dígito verificador
        soma = 0;
        for (int i = 0; i < 10; i++) {
            soma += (cpf.charAt(i) - '0') * (11 - i);
        }
        int digito2 = 11 - (soma % 11);
        if (digito2 >= 10) digito2 = 0;
        
        return (cpf.charAt(9) - '0' == digito1) && (cpf.charAt(10) - '0' == digito2);
    }
}