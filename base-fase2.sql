-- ======================================================
-- Script Fase 2: Criação de Cursos, Matrículas e
-- Atualização/População de Alunos
-- ======================================================
-- ATENÇÃO: Execute este script APÓS ter criado o banco 'desafio_ceap'
-- e a estrutura inicial da tabela 'alunos' (id, nome, email, curso, data_nascimento, ativo).

USE desafio_ceap;

DROP TABLE IF EXISTS matriculas;

ALTER IGNORE TABLE alunos DROP FOREIGN KEY fk_curso;

DROP TABLE IF EXISTS cursos;

CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

INSERT INTO cursos (id, nome, tipo) VALUES
(1, 'Desenvolvimento de Sistemas', 'Técnico'),
(2, 'Administração', 'Técnico'),
(3, 'Programação Web Frontend', 'Livre'),
(4, 'Excel Avançado', 'Livre'),
(5, 'Logística', 'Técnico');

SET @col_exists = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
                    WHERE TABLE_SCHEMA = 'desafio_ceap' AND TABLE_NAME = 'alunos' AND COLUMN_NAME = 'curso_id');

SET @sql = IF(@col_exists = 0, 'ALTER TABLE alunos ADD COLUMN curso_id INT', 'SELECT \'Coluna curso_id já existe\';');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

ALTER TABLE alunos DROP FOREIGN KEY IF EXISTS fk_curso;
ALTER TABLE alunos ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES cursos(id);

TRUNCATE TABLE alunos;

INSERT INTO alunos (id, nome, email, data_nascimento, ativo, curso_id) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '2003-05-15', TRUE, 1),
(2, 'Bruno Costa', 'bruno.costa@email.com', '2002-11-21', TRUE, 2),
(3, 'Carlos Dias', 'carlos.dias@email.com', '2004-02-10', FALSE, 1),
(4, 'Daniela Lima', 'daniela.lima@email.com', '2002-09-30', TRUE, 3),
(5, 'Eduardo Martins', 'eduardo.martins@email.com', '2001-08-30', TRUE, 5),
(6, 'Fernanda Alves', 'fernanda.alves@email.com', '2003-12-05', TRUE, 4),
(7, 'Gabriel Souza', 'gabriel.souza@email.com', '2002-07-18', TRUE, NULL),
(8, 'Helena Santos', 'helena.santos@email.com', '2004-01-25', TRUE, 1);

CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

INSERT INTO matriculas (aluno_id, data_matricula, status) VALUES
(1, '2024-01-15', 'Ativa'),
(2, '2023-08-20', 'Concluída'),
(3, '2023-09-10', 'Cancelada'),
(4, '2024-03-05', 'Ativa'),
(5, '2022-11-01', 'Concluída'),
(5, '2024-05-10', 'Ativa'),
(6, '2024-02-28', 'Ativa'),
(8, '2023-07-01', 'Ativa');

SET @col_exists_curso = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
                         WHERE TABLE_SCHEMA = 'desafio_ceap' AND TABLE_NAME = 'alunos' AND COLUMN_NAME = 'curso');

SET @sql_drop = IF(@col_exists_curso > 0, 'ALTER TABLE alunos DROP COLUMN curso', 'SELECT \'Coluna curso não existe\';');
PREPARE stmt_drop FROM @sql_drop;
EXECUTE stmt_drop;
DEALLOCATE PREPARE stmt_drop;

-- Script finalizado --