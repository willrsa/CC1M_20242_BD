CREATE DATABASE IF NOT EXISTS EmpresaDB;
USE EmpresaDB;

CREATE TABLE FORNECEDORES (
    FORNECEDORES_COD INT PRIMARY KEY,
    FORNECEDORES_NOME VARCHAR(45) NOT NULL,
    FORNECEDORES_RUA VARCHAR(45),
    FORNECEDORES_NUMRUA INT,
    FORNECEDORES_BAIRRO VARCHAR(45),
    FORNECEDORES_CIDADE VARCHAR(45),
    FORNECEDORES_ESTADO VARCHAR(45),
    FORNECEDORES_PAIS VARCHAR(30),
    FORNECEDORES_CODPOSTAL VARCHAR(10),
    FORNECEDORES_TELEFONE VARCHAR(15),
    FORNECEDORES_CONTATO TEXT
);

ALTER TABLE FORNECEDORES ADD COLUMN FORNECEDORES_EMAIL VARCHAR(50);

DROP TABLE IF EXISTS FORNECEDORES;

CREATE TABLE PRODUTOS (
    PRODUTOS_COD INT PRIMARY KEY,
    PRODUTOS_NOME VARCHAR(50) NOT NULL,
    PRODUTOS_DESCRICAO TEXT,
    PRODUTOS_ESPECIF TEXT,
    PRODUTOS_QUANT DECIMAL(10,3),
    PRODUTOS_PRECOUNIT DECIMAL(10,2),
    PRODUTOS_UNIDADEMEDIDA VARCHAR(10),
    PRODUTOS_ESTOQ_MIN DECIMAL(10,3)
);

ALTER TABLE PRODUTOS ADD COLUMN PRODUTOS_CATEGORIA VARCHAR(30);

DROP TABLE IF EXISTS PRODUTOS;

CREATE TABLE PEDIDOS (
    PEDIDOS_COD INT PRIMARY KEY,
    PEDIDOS_DATA DATE,
    PEDIDOS_HORA TIME,
    PEDIDOS_PREVISAO DATE,
    PEDIDOS_STATUS VARCHAR(20),
    FORNECEDORES_FORNECEDORES_COD INT,
    FOREIGN KEY (FORNECEDORES_FORNECEDORES_COD) REFERENCES FORNECEDORES(FORNECEDORES_COD)
);

ALTER TABLE PEDIDOS ADD COLUMN PEDIDOS_OBSERVACAO TEXT;

DROP TABLE IF EXISTS PEDIDOS;

CREATE TABLE RECEBIMENTOS (
    RECEBIMENTOS_DATA DATE,
    RECEBIMENTOS_HORA TIME,
    RECEBIMENTOS_QUANT_PROD DECIMAL(10,3),
    RECEBIMENTOS_CONDICAO TEXT,
    PEDIDOS_PEDIDOS_COD INT,
    FOREIGN KEY (PEDIDOS_PEDIDOS_COD) REFERENCES PEDIDOS(PEDIDOS_COD)
);

ALTER TABLE RECEBIMENTOS ADD COLUMN RECEBIMENTOS_NOTA_FISCAL VARCHAR(20);

DROP TABLE IF EXISTS RECEBIMENTOS;

CREATE TABLE FILIAIS (
    FILIAIS_COD INT PRIMARY KEY,
    FILIAIS_NOME VARCHAR(30) NOT NULL,
    FILIAIS_RUA VARCHAR(100),
    FILIAIS_NUMRUA INT,
    FILIAIS_BAIRRO VARCHAR(50),
    FILIAIS_CIDADE VARCHAR(50),
    FILIAIS_ESTADO VARCHAR(30),
    FILIAIS_PAIS VARCHAR(30),
    FILIAIS_CODPOSTAL VARCHAR(10),
    FILIAIS_CAPACIDADE TEXT
);

ALTER TABLE FILIAIS ADD COLUMN FILIAIS_TELEFONE VARCHAR(15);

DROP TABLE IF EXISTS FILIAIS;

CREATE TABLE FORNECEDORES_PRODUTOS (
    FORNECEDORES_FORNECEDORES_COD INT,
    PRODUTOS_PRODUTOS_COD INT,
    PRIMARY KEY (FORNECEDORES_FORNECEDORES_COD, PRODUTOS_PRODUTOS_COD),
    FOREIGN KEY (FORNECEDORES_FORNECEDORES_COD) REFERENCES FORNECEDORES(FORNECEDORES_COD),
    FOREIGN KEY (PRODUTOS_PRODUTOS_COD) REFERENCES PRODUTOS(PRODUTOS_COD)
);

ALTER TABLE FORNECEDORES_PRODUTOS ADD COLUMN DATA_ADICIONADO DATE;

DROP TABLE IF EXISTS FORNECEDORES_PRODUTOS;

CREATE TABLE PEDIDOS_PRODUTOS (
    PEDIDOS_PEDIDOS_COD INT,
    PRODUTOS_PRODUTOS_COD INT,
    PEDIDOS_PRODUTOS_QUANT DECIMAL(10,3),
    PRIMARY KEY (PEDIDOS_PEDIDOS_COD, PRODUTOS_PRODUTOS_COD),
    FOREIGN KEY (PEDIDOS_PEDIDOS_COD) REFERENCES PEDIDOS(PEDIDOS_COD),
    FOREIGN KEY (PRODUTOS_PRODUTOS_COD) REFERENCES PRODUTOS(PRODUTOS_COD)
);

ALTER TABLE PEDIDOS_PRODUTOS ADD COLUMN DATA_ENTREGA_PREVISTA DATE;

DROP TABLE IF EXISTS PEDIDOS_PRODUTOS;

CREATE TABLE FILIAIS_PRODUTOS (
    FILIAIS_FILIAIS_COD INT,
    PRODUTOS_PRODUTOS_COD INT,
    FILIAIS_PRODUTOS_QUANT DECIMAL(10,3),
    PRIMARY KEY (FILIAIS_FILIAIS_COD, PRODUTOS_PRODUTOS_COD),
    FOREIGN KEY (FILIAIS_FILIAIS_COD) REFERENCES FILIAIS(FILIAIS_COD),
    FOREIGN KEY (PRODUTOS_PRODUTOS_COD) REFERENCES PRODUTOS(PRODUTOS_COD)
);

ALTER TABLE FILIAIS_PRODUTOS ADD COLUMN DATA_ULTIMA_ENTRADA DATE;

DROP TABLE IF EXISTS FILIAIS_PRODUTOS;
