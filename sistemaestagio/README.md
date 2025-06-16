# sistemaEstagio
Sistema Estagio PML
---
# 🧾 Sistema de Gestão de Estágios
Uma aplicação web, desenvolvida em Java com JSP para gerenciar cadastros, acompanhamento e avaliação de oportunidades de estágios supervisionados no ambiente da saúde para alunos da rede particular de ensino de Londrina/PR.

---

## 📚 Descrição
Este sistema permite que instituições de ensino gerenciem a alocação de alunos e docentes em estágios supervisionados, promovendo eficiência no acompanhamento e na avaliação.
O projeto foi utilizado dentro da disciplina de Análise e Projeto Orientado à Objetos da Unicesumar - Campus Londrina.
Tem como objetivo apoiar as instituições de ensino nos processos de :
- Cadastro de campos de estágio.
- Alocação de alunos a locais de estágio conforme critérios acadêmicos.
- Vinculação de docentes supervisores.
- Geração de relatórios e acompanhamento das atividades.

---

## 🚀 Tecnologias Utilizadas

- Java 11+
- JSP (JavaServer Pages)
- Servlets
- Apache Tomcat 9
- MariaDB
- JDBC
- HTML5, CSS3 e Bootstrap
- JSTL
- Eclipse

---

## ⚙️ Como Executar o Projeto

### 1. Clonar o repositório
git clone https://github.com/edenilsonburity/sistemaEstagio.git

### 2. Importar no Eclipse
Dynamic Web Project

### 3. Configurar o Tomcat
Configure o Tomcat como servidor local.

### 4. Configurar o Banco de Dados MySQL
Configurar o Banco de Dados
Criar o banco no MySQL conforme script << incluir aqui >>.

Atualizar o arquivo db.properties com os dados de conexão:
db.url=jdbc:mysql://localhost:3306/sistemaestagio
db.user=root
db.password=senha

### 5. Executar a aplicação
Inicie o servidor Tomcat.
Acesse no navegador:
http://localhost:8080/sistemaestagio

## 🧪 Testes
Atualmente o sistema não possui testes automatizados. Apenas testes manuais para verificação dos fluxos principais. 
Nas versões futuras incluirão testes automatizados com JUnit e Selenium.

## 👨‍💻 Contribuindo
### 1. Faça um fork do repositório
Crie uma branch com sua feature:
git checkout -b minha-feature

### 2. Commit suas alterações:
git commit -m 'Minha nova feature'

### 3. Faça o push da sua branch:
git push origin minha-feature

### 4. Abra um Pull Request

## 📄 Licença
Este projeto está sob a Licença MIT.

## 📬 Contato
✉️ Email: edenilson.burity@unicesumar.edu.br
🌐 Site: https://www.unicesumar.edu.br/presencial-londrina/
