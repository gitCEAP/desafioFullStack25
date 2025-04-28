# Desafio Técnico — Desenvolvedor Full Stack Júnior

Bem-vindo ao desafio técnico para a posição de Desenvolvedor Full Stack Júnior! 🚀

O objetivo é testar suas habilidades em desenvolvimento web, banco de dados, organização de projeto e comunicação técnica.

---

## 🟦 Estrutura do Desafio

O desafio será dividido em duas partes:

| Parte    | Descrição                                          | Tempo estimado |
|----------|----------------------------------------------------|----------------|
| Parte 1  | Desenvolvimento de um CRUD completo de alunos      | 1h30           |
| Parte 2  | Consultas SQL avançadas e evolução do banco         | 30 min         |

---

# 🛠️ Ambiente fornecido:

- Visual Studio Code instalado
- Postman instalado
- Acesso ao banco de dados MySQL via phpMyAdmin
- Git instalado para versionamento

---

# 📋 Instruções Gerais

- Você terá **15 minutos iniciais** para:
  - Configurar seu ambiente de trabalho (abrir VSCode, phpMyAdmin, GitHub).
  - Criar seu repositório no GitHub e clonar na máquina local.
  - Conectar-se ao banco via phpMyAdmin.

- **Durante esses 15 minutos é proibido começar a codificar.**
- O desafio será oficialmente iniciado após esse tempo.

---

# 🟦 Parte 1 — Desenvolvimento do CRUD de Alunos

## 🎯 O que você deve fazer:

- Criar um banco de dados no MySQL chamado: `desafio_ceap`.
- Criar manualmente uma tabela chamada `alunos`, respeitando a seguinte estrutura:

| Campo           | Tipo                   | Restrições                       |
|-----------------|-------------------------|----------------------------------|
| id              | Inteiro                 | Chave Primária, Auto incremento |
| nome            | Texto (até 100 caracteres) | Obrigatório |
| email           | Texto (até 100 caracteres) | Obrigatório |
| curso           | Texto (até 100 caracteres) | Obrigatório |
| data_nascimento | Data                    | Opcional                        |
| ativo           | Booleano                | Valor padrão: TRUE              |

> ❗ **Importante:**  
> O candidato deverá interpretar esta estrutura e criar a tabela manualmente no phpMyAdmin.  

## 📌 Desenvolvimento

- Criar uma **API RESTful** com os seguintes endpoints:
  - `POST /alunos` – Criar aluno
  - `GET /alunos` – Listar todos os alunos
  - `PUT /alunos/{id}` – Atualizar aluno
  - `DELETE /alunos/{id}` – Deletar aluno
> A API deve aceitar e retornar dados no formato JSON. Utilize códigos de status HTTP apropriados (ex: 201 para criação, 200 para sucesso, 404 para não encontrado).

- Criar uma interface web simples para:
  - Cadastrar novos alunos
  - Listar todos os alunos
  - Atualizar e excluir alunos
> Não é necessário utilizar nenhum framework de front-end específico; HTML, CSS e JavaScript puros são suficientes.

---

# 📋 Banco de Dados — Informações de Conexão

- **Host**: `10.0.0.17`
- **Porta**: `3306`
- **Usuário**: `[credencial fornecida durante o desafio]`
- **Senha**: `[credencial fornecida durante o desafio]`
- **Banco**: `desafio_ceap`

> A configuração da conexão no seu sistema é de responsabilidade do candidato conforme a linguagem ou framework escolhido.

## 📋 Entrega da Parte 1 — CRUD de Alunos

- Desenvolva a aplicação completa de cadastro de alunos conforme os requisitos acima.
- A aplicação deve conter:
  - API RESTful com as operações de cadastro, listagem, atualização e exclusão de alunos.
  - Interface web simples para consumir a API.
  - Persistência dos dados em banco de dados MySQL.

- **Importante:**
  - A conexão com o banco de dados deve ser funcional.
  - A aplicação deve estar organizada de forma clara e compreensível.
  - Não é obrigatório seguir uma estrutura específica de pastas, mas a organização será avaliada.

- **Opcional:**
  - Criar um arquivo `.env.example` para exemplificar variáveis de ambiente usadas no projeto (ex: `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASS`, `DB_NAME`).

- Faça commits frequentes e claros ao longo do desenvolvimento.

---

# 🟦 Parte 2 — Consultas SQL e Evolução do Banco

Após a conclusão da Parte 1:

- Você deverá executar o script [`base-fase2.sql`](./base-fase2.sql) disponível neste repositório.

Esse script irá:

- Criar a tabela `cursos`.
- Criar a tabela `matriculas`.
- Alterar a tabela `alunos` para incluir a chave estrangeira `curso_id`.
- Popular todas as tabelas com dados consistentes.

## 📌 Consultas solicitadas:

1. Listar todos os alunos ativos, incluindo:
   - Nome do curso
   - Tipo do curso
   - Data da matrícula mais recente (se existir)
   > (Resultado esperado deve incluir colunas como `aluno_nome`, `curso_nome`, `curso_tipo`, `data_matricula_recente`).

2. Listar todos os alunos que **não possuem matrícula ativa** (`status != 'Ativa'`)
   > (Resultado esperado deve incluir colunas como `aluno_nome`, `aluno_email`, etc.).

3. Listar todos os **cursos que não possuem alunos ativos matriculados**
   > (Resultado esperado deve incluir colunas como `curso_nome`, `curso_tipo`).

4. Atualizar o status da matrícula para **"Concluída"** para alunos cuja matrícula tenha mais de 6 meses.
   > (Esta é uma operação de `UPDATE`, não retorna linhas diretamente, mas afeta a tabela `matriculas`).

5. Listar nome, e-mail e **idade atual** dos alunos, calculada a partir de `data_nascimento`.
   > (Resultado esperado deve incluir colunas como `aluno_nome`, `aluno_email`, `idade_atual`).

---

# 📋 Entrega da Parte 2 — Consultas SQL

- Crie uma pasta chamada `fase2/` no seu repositório.
- Dentro dela, crie um arquivo chamado `consultas.sql`.
- Insira todas as consultas solicitadas neste arquivo, separadas e comentadas.


Exemplo de estrutura esperada no repositório:

```
/
├── README.md
├── base-fase2.sql
├── src/                  # Código da API e Interface
└── fase2/
    └── consultas.sql     # Suas consultas SQL
```

---

# 🚀 Entrega Final

- Todo o código deverá ser versionado no repositório GitHub individual.
- Faça commits frequentes e claros durante o desenvolvimento.
- Ao finalizar, envie o link do repositório para a equipe avaliadora.

---

# 🧠 Apresentação Final

- Ao término do tempo, você terá **3 a 5 minutos** para apresentar sua solução.
- A apresentação deve abordar:
  - Organização do projeto
  - Funcionamento básico da API e da interface
  - Estratégias e decisões adotadas

---

# 📣 Boa sorte!
Estamos ansiosos para conhecer seu raciocínio, seu código e sua comunicação técnica! 🚀