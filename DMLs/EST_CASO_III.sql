-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS TechSolutionDB;
USE TechSolutionDB;

-- Tabela CLIENTES
CREATE TABLE CLIENTES (
    Codigo INT PRIMARY KEY,
    CNPJ VARCHAR(18) NOT NULL,
    RazaoSocial VARCHAR(100) NOT NULL,
    RamoDeAtividade VARCHAR(50),
    DataDeCadastramento DATE,
    PessoaDeContato VARCHAR(50)
);


-- Tabela EMPREGADOS
CREATE TABLE EMPREGADOS (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
    DataDeAdmissao DATE,
    Qualificacoes TEXT,
    Endereco VARCHAR(100)
);

-- Tabela EMPRESAS
CREATE TABLE EMPRESAS (
    CNPJ VARCHAR(18) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    PessoaDeContato VARCHAR(50),
    Endereco VARCHAR(100)
);

-- Tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    CNPJ VARCHAR(18) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(100),
    PessoaDeContato VARCHAR(50)
);


-- Tabela TIPO_ENDERECO
CREATE TABLE TIPO_ENDERECO (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);


-- Tabela ENDERECOS
CREATE TABLE ENDERECOS (
    Numero INT,
    Logradouro VARCHAR(100),
    Complemento VARCHAR(50),
    CEP VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    TipoEndereco INT,
    FOREIGN KEY (TipoEndereco) REFERENCES TIPO_ENDERECO(Codigo)
);

-- Tabela ENCOMENDAS
CREATE TABLE ENCOMENDAS (
    Numero INT PRIMARY KEY,
    DataDeInclusao DATE,
    ValorTotal DECIMAL(10, 2),
    ValorDesconto DECIMAL(10, 2),
    ValorLiquido DECIMAL(10, 2),
    IDFormaDePagamento INT,
    QuantidadeParcelas INT,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES CLIENTES(Codigo)
);


-- Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cor VARCHAR(20),
    Dimensoes VARCHAR(50),
    Peso DECIMAL(5, 2),
    Preco DECIMAL(10, 2),
    TempoDeFabricacao TIME,
    DesenhoDoProduto TEXT,
    HorasDeMaoDeObra DECIMAL(5, 2)
);


-- Tabela TIPOS_COMPONENTE
CREATE TABLE TIPOS_COMPONENTE (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);


-- Tabela COMPONENTES
CREATE TABLE COMPONENTES (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    QuantidadeEmEstoque INT,
    PrecoUnitario DECIMAL(10, 2),
    Unidade VARCHAR(10),
    TipoComponente INT,
    FOREIGN KEY (TipoComponente) REFERENCES TIPOS_COMPONENTE(Codigo)
);


-- Tabela MAQUINAS
CREATE TABLE MAQUINAS (
    ID INT PRIMARY KEY,
    TempoDeVida INT,
    DataDaCompra DATE,
    DataFimDaGarantia DATE
);


-- Tabela RE (Recursos Específicos)
CREATE TABLE RE (
    ID INT PRIMARY KEY,
    QuantidadeNecessaria INT,
    Unidade VARCHAR(10),
    TempoDeUso TIME,
    HorasDeMaoDeObra DECIMAL(5, 2),
    ProdutoID INT,
    FOREIGN KEY (ProdutoID) REFERENCES PRODUTOS(Codigo)
);


-- Tabela RM (Registro de Manutenção)
CREATE TABLE RM (
    ID INT PRIMARY KEY,
    Data DATE,
    Descricao TEXT,
    MaquinaID INT,
    FOREIGN KEY (MaquinaID) REFERENCES MAQUINAS(ID)
);


-- Tabela RS (Registro de Suprimentos)
CREATE TABLE RS (
    ID INT PRIMARY KEY,
    Quantidade INT,
    DataDeNecessidade DATE,
    ComponenteID INT,
    FOREIGN KEY (ComponenteID) REFERENCES COMPONENTES(Codigo)
);

-- 1. CLIENTES
-- Inserção de dados na tabela CLIENTES
INSERT INTO CLIENTES (CNPJ, Razão_Social, Ramo_de_Atividade, Data_de_Cadastramento, Pessoa_de_Contato) 
VALUES ('12345678000195', 'TechSolution Ltda.', 'Tecnologia', '2024-01-01', 'João Silva');
INSERT INTO CLIENTES (CNPJ, Razão_Social, Ramo_de_Atividade, Data_de_Cadastramento, Pessoa_de_Contato) 
VALUES ('98765432000102', 'NovaTech Soluções', 'Consultoria', '2024-02-20', 'Maria Oliveira');
INSERT INTO CLIENTES (CNPJ, Razão_Social, Ramo_de_Atividade, Data_de_Cadastramento, Pessoa_de_Contato) 
VALUES ('12398745000123', 'GlobalCorp', 'Importação', '2024-03-15', 'Carlos Souza');
INSERT INTO CLIENTES (CNPJ, Razão_Social, Ramo_de_Atividade, Data_de_Cadastramento, Pessoa_de_Contato) 
VALUES ('55667788000188', 'Distribuidora XYZ', 'Varejo', '2024-04-05', 'Patrícia Alves');
INSERT INTO CLIENTES (CNPJ, Razão_Social, Ramo_de_Atividade, Data_de_Cadastramento, Pessoa_de_Contato) 
VALUES ('11002233000144', 'Alpha Partners', 'Consultoria', '2024-05-10', 'Eduardo Costa');

-- Atualização de dados na tabela CLIENTES
UPDATE CLIENTES 
SET Razão_Social = 'TechSolution Ltda. - Nova Unidade', Ramo_de_Atividade = 'Desenvolvimento de Software'
WHERE CNPJ = '12345678000195';

UPDATE CLIENTES 
SET Pessoa_de_Contato = 'Maria Clara Souza' 
WHERE CNPJ = '98765432000102';

-- Exclusão de dados na tabela CLIENTES
DELETE FROM CLIENTES WHERE CNPJ = '12345678000195';

-- 2. EMPREGADOS
-- Inserção de dados na tabela EMPREGADOS
INSERT INTO EMPREGADOS (Matrícula, Nome, Cargo, Salário, Data_de_Admissão) 
VALUES (1001, 'Ana Lima', 'Analista de Sistemas', 5000, '2023-01-10');
INSERT INTO EMPREGADOS (Matrícula, Nome, Cargo, Salário, Data_de_Admissão) 
VALUES (1002, 'Bruno Santos', 'Desenvolvedor', 6000, '2022-11-20');
INSERT INTO EMPREGADOS (Matrícula, Nome, Cargo, Salário, Data_de_Admissão) 
VALUES (1003, 'Carlos Pereira', 'Gerente de Projetos', 8000, '2021-08-15');
INSERT INTO EMPREGADOS (Matrícula, Nome, Cargo, Salário, Data_de_Admissão) 
VALUES (1004, 'Diana Costa', 'Assistente Administrativa', 3500, '2024-04-01');
INSERT INTO EMPREGADOS (Matrícula, Nome, Cargo, Salário, Data_de_Admissão) 
VALUES (1005, 'Elisa Martins', 'Diretora de TI', 12000, '2020-06-05');

-- Atualização de dados na tabela EMPREGADOS
UPDATE EMPREGADOS 
SET Cargo = 'Gerente de TI', Salário = 9000 
WHERE Matrícula = 1003;

UPDATE EMPREGADOS 
SET Salário = 7500 
WHERE Matrícula = 1002;

-- Exclusão de dados na tabela EMPREGADOS
DELETE FROM EMPREGADOS WHERE Matrícula = 1001;

-- 3. EMPRESAS
-- Inserção de dados na tabela EMPRESAS
INSERT INTO EMPRESAS (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('12345678000195', 'TechPartners', 'Felipe Gomes');
INSERT INTO EMPRESAS (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('87654321000123', 'SmartTech', 'Carla Mendes');
INSERT INTO EMPRESAS (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('11122233000110', 'NextGen Solutions', 'Lucas Oliveira');
INSERT INTO EMPRESAS (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('33221144000122', 'Innovatech Ltda.', 'Juliana Ramos');
INSERT INTO EMPRESAS (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('55443322000143', 'B2B Technologies', 'Paulo Almeida');

-- Atualização de dados na tabela EMPRESAS
UPDATE EMPRESAS 
SET Razão_Social = 'TechPartners Global', Pessoa_de_Contato = 'Fernando Gomes' 
WHERE CNPJ = '12345678000195';

UPDATE EMPRESAS 
SET Razão_Social = 'SmartTech Solutions', Pessoa_de_Contato = 'Luciana Mendes' 
WHERE CNPJ = '87654321000123';

-- Exclusão de dados na tabela EMPRESAS
DELETE FROM EMPRESAS WHERE CNPJ = '12345678000195';

-- 4. FORNECEDORES
-- Inserção de dados na tabela FORNECEDORES
INSERT INTO FORNECEDORES (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('78945612000190', 'TecnoSupplies', 'Sérgio Nunes');
INSERT INTO FORNECEDORES (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('45612379000100', 'CompoMakers', 'Rita Santana');
INSERT INTO FORNECEDORES (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('12332145000155', 'MegaParts', 'Cláudia Mendes');
INSERT INTO FORNECEDORES (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('56789012000175', 'ProComp', 'André Costa');
INSERT INTO FORNECEDORES (CNPJ, Razão_Social, Pessoa_de_Contato) 
VALUES ('12365478000112', 'Global Components', 'Marcos Silva');

-- Atualização de dados na tabela FORNECEDORES
UPDATE FORNECEDORES 
SET Razão_Social = 'TecnoSupplies Ltda.', Pessoa_de_Contato = 'Roberto Nunes' 
WHERE CNPJ = '78945612000190';

UPDATE FORNECEDORES 
SET Pessoa_de_Contato = 'Ana Costa' 
WHERE CNPJ = '45612379000100';

-- Exclusão de dados na tabela FORNECEDORES
DELETE FROM FORNECEDORES WHERE CNPJ = '78945612000190';

-- 5. ENCOMENDAS
-- Inserção de dados na tabela ENCOMENDAS
INSERT INTO ENCOMENDAS (Número, Data_da_Inclusão, Valor_Total, Valor_do_Desconto, Valor_Líquido, Quantidade_de_Parcelas) 
VALUES (1, '2024-06-01', 15000, 2000, 13000, 3);
INSERT INTO ENCOMENDAS (Número, Data_da_Inclusão, Valor_Total, Valor_do_Desconto, Valor_Líquido, Quantidade_de_Parcelas) 
VALUES (2, '2024-07-15', 25000, 3000, 22000, 6);
INSERT INTO ENCOMENDAS (Número, Data_da_Inclusão, Valor_Total, Valor_do_Desconto, Valor_Líquido, Quantidade_de_Parcelas) 
VALUES (3, '2024-08-10', 50000, 5000, 45000, 12);
INSERT INTO ENCOMENDAS (Número, Data_da_Inclusão, Valor_Total, Valor_do_Desconto, Valor_Líquido, Quantidade_de_Parcelas) 
VALUES (4, '2024-09-05', 12000, 1500, 10500, 4);
INSERT INTO ENCOMENDAS (Número, Data_da_Inclusão, Valor_Total, Valor_do_Desconto, Valor_Líquido, Quantidade_de_Parcelas) 
VALUES (5, '2024-10-25', 18000, 2500, 15500, 5);

-- Atualização de dados na tabela ENCOMENDAS
UPDATE ENCOMENDAS 
SET Valor_Total = 14000, Valor_Líquido = 12000 
WHERE Número = 1;

UPDATE ENCOMENDAS 
SET Quantidade_de_Parcelas = 4 
WHERE Número = 2;

-- Exclusão de dados na tabela ENCOMENDAS
DELETE FROM ENCOMENDAS WHERE Número = 1;
