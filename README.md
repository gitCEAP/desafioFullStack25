# Desafio Técnico — Desenvolvedor Full Stack Júnior

Bem-vindo ao desafio técnico para a posição de Desenvolvedor Full Stack Júnior! 🚀

O objetivo é testar suas habilidades em desenvolvimento web, banco de dados, organização de projeto e comunicação técnica.

---

## 🟦 Estrutura do Desafio

O desafio ocorrerá das **9h45 às 11h30** (total de 1h 45min) e será dividido em três partes principais, seguidas da apresentação:

| Parte    | Descrição                                                  | Tempo estimado |
|----------|------------------------------------------------------------|----------------|
| Parte 1  | Setup do Ambiente e Desenvolvimento do CRUD de Alunos      | 75 min         |
| Parte 2  | Consultas SQL e Evolução do Banco (BD)                     | 20 min         |
| Parte 3  | Apresentação Final                                         | 5 min          |

---

# 🛠️ Ambiente fornecido:

- Visual Studio Code instalado
- Postman instalado
- Acesso ao banco de dados MySQL via phpMyAdmin
- Git instalado para versionamento

---

# 🟦 Parte 1 — Setup e Desenvolvimento do CRUD de Alunos

## 🎯 O que você deve fazer (Setup Inicial):

- Criar um banco de dados no MySQL chamado: `desafio_ceap`.
- Criar manualmente uma tabela chamada `alunos` no phpMyAdmin, respeitando a seguinte estrutura:

| Campo           | Tipo                   | Restrições                       |
|-----------------|-------------------------|----------------------------------|
| id              | Inteiro                 | Chave Primária, Auto incremento |
| nome            | Texto (até 100 caracteres) | Obrigatório |
| email           | Texto (até 100 caracteres) | Obrigatório |
| curso           | Texto (até 100 caracteres) | Obrigatório |
| data_nascimento | Data                    | Opcional                        |
| ativo           | Booleano                | Valor padrão: TRUE              |

> ❗ **Importante:**
> O candidato deverá interpretar esta estrutura e criar a tabela **manualmente** no phpMyAdmin.

## 📌 Desenvolvimento (CRUD)

- Criar uma **API RESTful** com os seguintes endpoints para gerenciar os alunos:
  - `POST /alunos` – Criar aluno
  - `GET /alunos` – Listar todos os alunos
  - `GET /alunos/{id}` – Obter dados de um aluno específico (necessário para edição)
  - `PUT /alunos/{id}` – Atualizar dados de um aluno
  - `DELETE /alunos/{id}` – Deletar um aluno
> A API deve aceitar e retornar dados no formato JSON. Utilize códigos de status HTTP apropriados (ex: 201 para criação, 200 para sucesso, 404 para não encontrado).

- Criar uma interface web simples para:
  - Cadastrar novos alunos (consumindo `POST /alunos`)
  - Listar todos os alunos (consumindo `GET /alunos`)
  - Atualizar alunos (carregando dados com `GET /alunos/{id}` e salvando com `PUT /alunos/{id}`)
  - Excluir alunos (consumindo `DELETE /alunos/{id}`)
> Não é necessário utilizar nenhum framework de front-end específico; HTML, CSS e JavaScript puros são suficientes.

---

# 📋 Banco de Dados — Informações de Conexão (Ambiente XAMPP Padrão)

- **Host**: `localhost`
- **Porta**: `3306`
- **Usuário**: `root`
- **Senha**: (vazia - sem senha)
- **Banco**: `desafio_ceap`

> Certifique-se de que seu serviço MySQL (parte do XAMPP) esteja rodando. A configuração da conexão no seu código deve usar estas credenciais.

## 📋 Entrega da Parte 1 — CRUD de Alunos

- Desenvolva a aplicação completa de cadastro de alunos conforme os requisitos acima.
- A aplicação deve conter:
  - API RESTful com as operações CRUD completas para alunos.
  - Interface web simples para consumir a API e realizar as operações.
  - Persistência dos dados em banco de dados MySQL.

- **Importante:**
  - A conexão com o banco de dados deve ser funcional.
  - A aplicação deve estar organizada de forma clara e compreensível.
  - Não é obrigatório seguir uma estrutura específica de pastas, mas a organização será avaliada.

- **Opcional (Recomendado):**
  - Criar um arquivo `.env.example` para exemplificar variáveis de ambiente usadas no projeto (ex: `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASS`, `DB_NAME`, `API_PORT`).
  - Criar um arquivo `.env` (e adicioná-lo ao `.gitignore`) com os valores reais para o seu ambiente.

- Faça commits frequentes e claros ao longo do desenvolvimento.

---

# 🟦 Parte 2 — Consultas SQL e Evolução do Banco (BD)

Após a conclusão da Parte 1:

- Você deverá executar o script [`base-fase2.sql`](./base-fase2.sql) disponível neste repositório.

**Observação Importante sobre Impacto no CRUD:**
A execução deste script altera a estrutura da tabela `alunos` (removendo a coluna `curso` e utilizando `curso_id` com referência à tabela `cursos`). Isso significa que a API e a interface web desenvolvidas na Parte 1, que atualmente trabalham com a coluna `curso`, precisarão de ajustes para funcionar corretamente com a nova estrutura (por exemplo, usando JOINs na API para buscar/exibir o nome do curso).

> **A adaptação da aplicação CRUD da Parte 1 *não* é uma tarefa obrigatória para a conclusão desta Parte 2.** O foco principal aqui são as consultas SQL solicitadas abaixo. No entanto, reconhecer esse impacto e, se o tempo permitir, implementar ou discutir a solução durante a apresentação final será um diferencial.

Esse script irá:

- Criar a tabela `cursos`.
- Criar a tabela `matriculas`.
- Alterar a tabela `alunos` para incluir a chave estrangeira `curso_id` e remover a coluna `curso` original.
- Popular todas as tabelas com dados consistentes.

## 📌 Consultas solicitadas:

1. Listar todos os alunos ativos, incluindo:
   - Nome do curso
   - Tipo do curso
   - Data da matrícula mais recente (se existir)
   > (Resultado esperado deve incluir colunas como `aluno_nome`, `curso_nome`, `curso_tipo`, `data_matricula_recente`).

2. Listar todos os alunos que **não possuem matrícula ativa**
   > (Resultado esperado deve incluir colunas como `aluno_nome`, `aluno_email`, etc.).

3. Listar todos os **cursos que não possuem alunos ativos matriculados**
   > (Resultado esperado deve incluir colunas como `curso_nome`, `curso_tipo`).

4. Atualizar o status da matrícula para **"Concluída"** para alunos cuja matrícula tenha mais de 6 meses.
   > (Esta é uma operação de `UPDATE`, não retorna linhas diretamente, mas afeta a tabela `matriculas`).

5. Listar nome, e-mail e **idade atual** dos alunos, calculada a partir de `data_nascimento`.
   > (Resultado esperado deve incluir colunas como `aluno_nome`, `aluno_email`, `idade_atual`).

---

# 📋 Entrega da Parte 2 — Consultas SQL

- Crie uma pasta chamada `fase2/` no seu repositório (se ainda não existir).
- Dentro dela, crie um arquivo chamado `consultas.sql`.
- Insira todas as consultas solicitadas neste arquivo, separadas e comentadas.


Exemplo de estrutura esperada no repositório:

```
/
├── README.md
├── base-fase2.sql      # Script SQL para a Parte 2
├── src/                  # Código da API e Interface (exemplo)
├── public/               # Arquivos da Interface Web (exemplo)
├── fase2/
│   └── consultas.sql     # Suas consultas SQL da Parte 2
├── .env.example        # Exemplo de variáveis de ambiente
├── package.json          # Exemplo se usar Node.js
└── ...                   # Outros arquivos do seu projeto
```

---

# 🚀 Entrega Final

- Todo o código deverá ser versionado no repositório GitHub individual.
- Faça commits frequentes e claros durante o desenvolvimento.
- Ao finalizar, envie o link do repositório para a equipe avaliadora.

---

# 🧠 Parte 3 — Apresentação Final

- Ao término do tempo (previsto para 11h20), você terá **5 minutos** para apresentar sua solução.
- A apresentação deve abordar:
  - Organização do projeto
  - Funcionamento básico da API e da interface
  - Estratégias e decisões adotadas

---

# 📣 Boa sorte!
Estamos ansiosos para conhecer seu raciocínio, seu código e sua comunicação técnica! 🚀
