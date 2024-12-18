
CREATE DATABASE IF NOT EXISTS SaudeEmMovimentoDB;
USE SaudeEmMovimentoDB;

CREATE TABLE ALUNOS (
    AlunoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    DataNascimento DATE,
    Endereco VARCHAR(200),
    ModalidadeInteresse VARCHAR(100)  
);
ALTER TABLE ALUNOS ADD COLUMN Email VARCHAR(100);
DROP TABLE IF EXISTS ALUNOS;

CREATE TABLE INSTRUTORES (
    InstrutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    DataNascimento DATE,
    Especialidade VARCHAR(100)  
);
ALTER TABLE INSTRUTORES ADD COLUMN Telefone VARCHAR(15);
DROP TABLE IF EXISTS INSTRUTORES;

CREATE TABLE MODALIDADES (
    ModalidadeID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT
);
ALTER TABLE MODALIDADES ADD COLUMN Duracao INT; 
DROP TABLE IF EXISTS MODALIDADES;

CREATE TABLE ALUNOS_MODALIDADES (
    AlunoID INT,
    ModalidadeID INT,
    DataMatricula DATE,
    PRIMARY KEY (AlunoID, ModalidadeID),
    FOREIGN KEY (AlunoID) REFERENCES ALUNOS(AlunoID),
    FOREIGN KEY (ModalidadeID) REFERENCES MODALIDADES(ModalidadeID)
);
ALTER TABLE ALUNOS_MODALIDADES ADD COLUMN Status VARCHAR(10);
DROP TABLE IF EXISTS ALUNOS_MODALIDADES;

CREATE TABLE PLANOS_TREINAMENTO (
    PlanoID INT PRIMARY KEY AUTO_INCREMENT,
    AlunoID INT,
    InstrutorID INT,
    DataInicio DATE,
    DataFim DATE,
    Descricao TEXT,
    FOREIGN KEY (AlunoID) REFERENCES ALUNOS(AlunoID),
    FOREIGN KEY (InstrutorID) REFERENCES INSTRUTORES(InstrutorID)
);
ALTER TABLE PLANOS_TREINAMENTO ADD COLUMN Objetivo VARCHAR(200);
DROP TABLE IF EXISTS PLANOS_TREINAMENTO;

CREATE TABLE AULAS (
    AulaID INT PRIMARY KEY AUTO_INCREMENT,
    ModalidadeID INT,
    InstrutorID INT,
    Horario TIME,
    Capacidade INT,
    Localizacao VARCHAR(100),
    FOREIGN KEY (ModalidadeID) REFERENCES MODALIDADES(ModalidadeID),
    FOREIGN KEY (InstrutorID) REFERENCES INSTRUTORES(InstrutorID)
);
ALTER TABLE AULAS ADD COLUMN Data DATE;
DROP TABLE IF EXISTS AULAS;

CREATE TABLE PRESENCA_AULAS (
    AulaID INT,
    AlunoID INT,
    Data DATE,
    PRIMARY KEY (AulaID, AlunoID),
    FOREIGN KEY (AulaID) REFERENCES AULAS(AulaID),
    FOREIGN KEY (AlunoID) REFERENCES ALUNOS(AlunoID)
);
ALTER TABLE PRESENCA_AULAS ADD COLUMN Presente BOOLEAN DEFAULT FALSE;
DROP TABLE IF EXISTS PRESENCA_AULAS;

CREATE TABLE PAGAMENTOS (
    PagamentoID INT PRIMARY KEY AUTO_INCREMENT,
    AlunoID INT,
    DataPagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(10) CHECK (Status IN ('Pago', 'Pendente')),
    FOREIGN KEY (AlunoID) REFERENCES ALUNOS(AlunoID)
);
ALTER TABLE PAGAMENTOS ADD COLUMN MetodoPagamento VARCHAR(20);
DROP TABLE IF EXISTS PAGAMENTOS;

CREATE TABLE INSTRUTORES_MODALIDADES (
    InstrutorID INT,
    ModalidadeID INT,
    PRIMARY KEY (InstrutorID, ModalidadeID),
    FOREIGN KEY (InstrutorID) REFERENCES INSTRUTORES(InstrutorID),
    FOREIGN KEY (ModalidadeID) REFERENCES MODALIDADES(ModalidadeID)
);
ALTER TABLE INSTRUTORES_MODALIDADES ADD COLUMN Nível VARCHAR(10);
DROP TABLE IF EXISTS INSTRUTORES_MODALIDADES;
