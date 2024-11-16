-- 1. TABELA ALUNOS
CREATE TABLE ALUNOS (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Data_de_Nascimento DATE,
    Endereco VARCHAR(255)
);

-- 2. TABELA INSTRUTORES
CREATE TABLE INSTRUTORES (
    Matrícula INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(11),
    FOREIGN KEY (CPF) REFERENCES ALUNOS(CPF) -- Relaciona instrutores com alunos (caso o instrutor seja ex-aluno, por exemplo)
);

-- 3. TABELA MODALIDADES
CREATE TABLE MODALIDADES (
    Código INT PRIMARY KEY,
    Nome VARCHAR(50),
    Descrição VARCHAR(255)
);

-- 4. TABELA PLANOS_DE_TREINAMENTO
CREATE TABLE PLANOS_DE_TREINAMENTO (
    Código INT PRIMARY KEY,
    Descrição TEXT,
    Data_Início DATE,
    Data_Fim DATE,
    CPF_Aluno VARCHAR(11),
    Matrícula_Instrutor INT,
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNOS(CPF),
    FOREIGN KEY (Matrícula_Instrutor) REFERENCES INSTRUTORES(Matrícula)
);

-- 5. TABELA AULAS
CREATE TABLE AULAS (
    Código INT PRIMARY KEY,
    Data_Hora DATETIME,
    Capacidade INT,
    Matrícula_Instrutor INT,
    Código_Modalidade INT,
    FOREIGN KEY (Matrícula_Instrutor) REFERENCES INSTRUTORES(Matrícula),
    FOREIGN KEY (Código_Modalidade) REFERENCES MODALIDADES(Código)
);

-- 6. TABELA PAGAMENTOS
CREATE TABLE PAGAMENTOS (
    Código INT PRIMARY KEY,
    CPF_Aluno VARCHAR(11),
    Data_Pagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNOS(CPF)
);

-- 1. COMANDOS INSERT

-- Inserir alunos
INSERT INTO ALUNOS (CPF, Nome, Data_de_Nascimento, Endereco)
VALUES ('12345678901', 'João Silva', '1990-05-15', 'Rua A, 123, Bairro X');
INSERT INTO ALUNOS (CPF, Nome, Data_de_Nascimento, Endereco)
VALUES ('98765432100', 'Maria Oliveira', '1992-07-22', 'Rua B, 456, Bairro Y');
INSERT INTO ALUNOS (CPF, Nome, Data_de_Nascimento, Endereco)
VALUES ('11223344556', 'Carlos Souza', '1988-01-30', 'Rua C, 789, Bairro Z');

-- Inserir instrutores
INSERT INTO INSTRUTORES (Matrícula, Nome, CPF)
VALUES (101, 'Paula Costa', '12345678901');
INSERT INTO INSTRUTORES (Matrícula, Nome, CPF)
VALUES (102, 'Felipe Mendes', '98765432100');
INSERT INTO INSTRUTORES (Matrícula, Nome, CPF)
VALUES (103, 'Lucas Pereira', '11223344556');

-- Inserir modalidades
INSERT INTO MODALIDADES (Código, Nome, Descrição)
VALUES (1, 'Musculação', 'Treinamento de força e resistência muscular');
INSERT INTO MODALIDADES (Código, Nome, Descrição)
VALUES (2, 'Yoga', 'Atividade que trabalha o equilíbrio físico e mental');
INSERT INTO MODALIDADES (Código, Nome, Descrição)
VALUES (3, 'Pilates', 'Exercícios físicos para fortalecimento e alongamento muscular');

-- Inserir planos de treinamento
INSERT INTO PLANOS_DE_TREINAMENTO (Código, Descrição, Data_Início, Data_Fim, CPF_Aluno, Matrícula_Instrutor)
VALUES (1, 'Plano de musculação para aumento de massa muscular', '2024-01-01', '2024-06-30', '12345678901', 101);
INSERT INTO PLANOS_DE_TREINAMENTO (Código, Descrição, Data_Início, Data_Fim, CPF_Aluno, Matrícula_Instrutor)
VALUES (2, 'Plano de yoga para melhoria do equilíbrio', '2024-01-01', '2024-06-30', '98765432100', 102);
INSERT INTO PLANOS_DE_TREINAMENTO (Código, Descrição, Data_Início, Data_Fim, CPF_Aluno, Matrícula_Instrutor)
VALUES (3, 'Plano de pilates para fortalecimento muscular', '2024-01-01', '2024-06-30', '11223344556', 103);

-- Inserir aulas
INSERT INTO AULAS (Código, Data_Hora, Capacidade, Matrícula_Instrutor, Código_Modalidade)
VALUES (1, '2024-02-01 08:00:00', 20, 101, 1);
INSERT INTO AULAS (Código, Data_Hora, Capacidade, Matrícula_Instrutor, Código_Modalidade)
VALUES (2, '2024-02-02 09:00:00', 15, 102, 2);
INSERT INTO AULAS (Código, Data_Hora, Capacidade, Matrícula_Instrutor, Código_Modalidade)
VALUES (3, '2024-02-03 10:00:00', 10, 103, 3);

-- Inserir pagamentos
INSERT INTO PAGAMENTOS (Código, CPF_Aluno, Data_Pagamento, Valor, Status)
VALUES (1, '12345678901', '2024-01-10', 200.00, 'Pago');
INSERT INTO PAGAMENTOS (Código, CPF_Aluno, Data_Pagamento, Valor, Status)
VALUES (2, '98765432100', '2024-01-15', 180.00, 'Pago');
INSERT INTO PAGAMENTOS (Código, CPF_Aluno, Data_Pagamento, Valor, Status)
VALUES (3, '11223344556', '2024-01-20', 150.00, 'Pendente');

-- 2. COMANDOS UPDATE

-- Atualizar dados de um aluno
UPDATE ALUNOS
SET Nome = 'João Silva Santos', Endereco = 'Rua A, 456, Bairro X'
WHERE CPF = '12345678901';

-- Atualizar a data de nascimento de um aluno
UPDATE ALUNOS
SET Data_de_Nascimento = '1991-05-15'
WHERE CPF = '98765432100';

-- Atualizar nome do instrutor
UPDATE INSTRUTORES
SET Nome = 'Paula Costa Silva'
WHERE Matrícula = 101;

-- Atualizar CPF de um instrutor
UPDATE INSTRUTORES
SET CPF = '99988877766'
WHERE Matrícula = 102;

-- Atualizar descrição de uma modalidade
UPDATE MODALIDADES
SET Descrição = 'Treinamento com foco em força e resistência'
WHERE Código = 1;

-- Atualizar nome de uma modalidade
UPDATE MODALIDADES
SET Nome = 'Alongamento'
WHERE Código = 2;

-- Atualizar descrição do plano de treinamento
UPDATE PLANOS_DE_TREINAMENTO
SET Descrição = 'Plano de musculação para aumento de força e resistência'
WHERE Código = 1;

-- Atualizar data de término do plano de treinamento
UPDATE PLANOS_DE_TREINAMENTO
SET Data_Fim = '2024-12-31'
WHERE Código = 2;

-- Atualizar horário de uma aula
UPDATE AULAS
SET Data_Hora = '2024-02-01 10:00:00'
WHERE Código = 1;

-- Atualizar a capacidade de uma aula
UPDATE AULAS
SET Capacidade = 25
WHERE Código = 2;

-- Atualizar status do pagamento
UPDATE PAGAMENTOS
SET Status = 'Pago'
WHERE Código = 3;

-- Atualizar valor do pagamento
UPDATE PAGAMENTOS
SET Valor = 220.00
WHERE Código = 1;

-- 3. COMANDOS DELETE

-- Excluir um aluno
DELETE FROM ALUNOS WHERE CPF = '12345678901';

-- Excluir um instrutor
DELETE FROM INSTRUTORES WHERE Matrícula = 101;

-- Excluir uma modalidade
DELETE FROM MODALIDADES WHERE Código = 1;

-- Excluir um plano de treinamento
DELETE FROM PLANOS_DE_TREINAMENTO WHERE Código = 1;

-- Excluir uma aula
DELETE FROM AULAS WHERE Código = 1;

-- Excluir um pagamento
DELETE FROM PAGAMENTOS WHERE Código = 1;
