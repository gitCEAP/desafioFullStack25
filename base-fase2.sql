-- ATENÇÃO: Este script deve ser executado apenas após a criação da tabela 'alunos'.

-- Criação da tabela 'cursos'
CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL -- Técnico ou Livre
);

-- Inserção de cursos
INSERT INTO cursos (nome, tipo) VALUES
('Desenvolvimento de Sistemas', 'Técnico'),
('Administração', 'Técnico'),
('Programação para Iniciantes', 'Livre'),
('Robótica Básica', 'Livre');

-- Adição da coluna 'curso_id' na tabela 'alunos'
ALTER TABLE alunos
ADD COLUMN curso_id INT;

-- Criação da chave estrangeira
ALTER TABLE alunos
ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES cursos(id);

-- Atualização dos alunos existentes para vincular aos cursos
UPDATE alunos SET curso_id = 1 WHERE curso LIKE '%Desenvolvimento%';
UPDATE alunos SET curso_id = 2 WHERE curso LIKE '%Administração%';
UPDATE alunos SET curso_id = 3 WHERE curso LIKE '%Programação%';
UPDATE alunos SET curso_id = 4 WHERE curso LIKE '%Robótica%';
UPDATE alunos SET curso_id = NULL WHERE curso_id IS NULL;

-- Criação da tabela 'matriculas'
CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

-- Inserção de matrículas
INSERT INTO matriculas (aluno_id, data_matricula, status) VALUES
(1, '2024-01-15', 'Ativa'),
(2, '2024-02-01', 'Concluída'),
(3, '2023-09-10', 'Cancelada'),
(4, '2024-03-05', 'Ativa'),
(5, '2024-04-10', 'Ativa');