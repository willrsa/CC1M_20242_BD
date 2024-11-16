-- 1. TABELA CLIENTES
CREATE TABLE CLIENTES (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Data_de_Nascimento DATE,
    Endereco VARCHAR(255),
    Status_Fidelidade VARCHAR(50)
);

-- 2. TABELA PRODUTOS
CREATE TABLE PRODUTOS (
    Código INT PRIMARY KEY,
    Nome VARCHAR(100),
    Categoria VARCHAR(50),
    Preço DECIMAL(10, 2),
    Quantidade_Estoque INT,
    Código_Fornecedor INT,
    FOREIGN KEY (Código_Fornecedor) REFERENCES FORNECEDORES(CNPJ)
);

-- 3. TABELA FORNECEDORES
CREATE TABLE FORNECEDORES (
    CNPJ VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefones VARCHAR(255)
);

-- 4. TABELA VENDAS
CREATE TABLE VENDAS (
    Código INT PRIMARY KEY,
    Data_Venda DATETIME,
    CPF_Cliente VARCHAR(11),
    Forma_Pagamento VARCHAR(50),
    Valor_Total DECIMAL(10, 2),
    FOREIGN KEY (CPF_Cliente) REFERENCES CLIENTES(CPF)
);

-- 5. TABELA PAGAMENTOS
CREATE TABLE PAGAMENTOS (
    Código INT PRIMARY KEY,
    CPF_Cliente VARCHAR(11),
    Data_Pagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CPF_Cliente) REFERENCES CLIENTES(CPF)
);

-- 1. COMANDOS INSERT

-- Inserir clientes
INSERT INTO CLIENTES (CPF, Nome, Data_de_Nascimento, Endereco, Status_Fidelidade)
VALUES ('12345678901', 'Ana Oliveira', '1985-11-25', 'Rua das Flores, 100, Bairro A', 'Ativo');
INSERT INTO CLIENTES (CPF, Nome, Data_de_Nascimento, Endereco, Status_Fidelidade)
VALUES ('98765432100', 'Bruno Santos', '1990-03-15', 'Av. Central, 500, Bairro B', 'Inativo');
INSERT INTO CLIENTES (CPF, Nome, Data_de_Nascimento, Endereco, Status_Fidelidade)
VALUES ('11122233344', 'Carlos Lima', '1987-07-30', 'Rua dos Lírios, 200, Bairro C', 'Ativo');

-- Inserir fornecedores
INSERT INTO FORNECEDORES (CNPJ, Nome, Endereco, Telefones)
VALUES ('12345678000123', 'Tech Supplies', 'Rua da Indústria, 500, Distrito Industrial', '(11) 1234-5678');
INSERT INTO FORNECEDORES (CNPJ, Nome, Endereco, Telefones)
VALUES ('98765432000100', 'Electro Parts', 'Av. Tecnológica, 1000, Bairro E', '(21) 8765-4321');
INSERT INTO FORNECEDORES (CNPJ, Nome, Endereco, Telefones)
VALUES ('11223344000111', 'Giga Components', 'Rua de Componentes, 50, Centro', '(31) 9999-1234');

-- Inserir produtos
INSERT INTO PRODUTOS (Código, Nome, Categoria, Preço, Quantidade_Estoque, Código_Fornecedor)
VALUES (1, 'Laptop Gamer', 'Informática', 5000.00, 10, '12345678000123');
INSERT INTO PRODUTOS (Código, Nome, Categoria, Preço, Quantidade_Estoque, Código_Fornecedor)
VALUES (2, 'Mouse Óptico', 'Informática', 100.00, 50, '98765432000100');
INSERT INTO PRODUTOS (Código, Nome, Categoria, Preço, Quantidade_Estoque, Código_Fornecedor)
VALUES (3, 'Teclado Mecânico', 'Informática', 300.00, 30, '11223344000111');

-- Inserir vendas
INSERT INTO VENDAS (Código, Data_Venda, CPF_Cliente, Forma_Pagamento, Valor_Total)
VALUES (1, '2024-11-01 10:00:00', '12345678901', 'Cartão de Crédito', 5300.00);
INSERT INTO VENDAS (Código, Data_Venda, CPF_Cliente, Forma_Pagamento, Valor_Total)
VALUES (2, '2024-11-02 11:30:00', '98765432100', 'Boleto', 400.00);
INSERT INTO VENDAS (Código, Data_Venda, CPF_Cliente, Forma_Pagamento, Valor_Total)
VALUES (3, '2024-11-03 14:00:00', '11122233344', 'Cartão de Crédito', 600.00);

-- Inserir pagamentos
INSERT INTO PAGAMENTOS (Código, CPF_Cliente, Data_Pagamento, Valor, Status)
VALUES (1, '12345678901', '2024-11-01', 5300.00, 'Pago');
INSERT INTO PAGAMENTOS (Código, CPF_Cliente, Data_Pagamento, Valor, Status)
VALUES (2, '98765432100', '2024-11-02', 400.00, 'Pendente');
INSERT INTO PAGAMENTOS (Código, CPF_Cliente, Data_Pagamento, Valor, Status)
VALUES (3, '11122233344', '2024-11-03', 600.00, 'Pago');

-- 2. COMANDOS UPDATE

-- Atualizar o status de fidelidade de um cliente
UPDATE CLIENTES
SET Status_Fidelidade = 'Ativo'
WHERE CPF = '98765432100';

-- Atualizar o endereço de um cliente
UPDATE CLIENTES
SET Endereco = 'Rua Nova, 350, Bairro F'
WHERE CPF = '11122233344';

-- Atualizar o preço de um produto
UPDATE PRODUTOS
SET Preço = 5200.00
WHERE Código = 1;

-- Atualizar a quantidade de estoque de um produto
UPDATE PRODUTOS
SET Quantidade_Estoque = 5
WHERE Código = 2;

-- Atualizar o nome de um fornecedor
UPDATE FORNECEDORES
SET Nome = 'Tech Parts'
WHERE CNPJ = '12345678000123';

-- Atualizar o telefone de um fornecedor
UPDATE FORNECEDORES
SET Telefones = '(11) 4321-8765'
WHERE CNPJ = '98765432000100';

-- Atualizar a forma de pagamento de uma venda
UPDATE VENDAS
SET Forma_Pagamento = 'Pix'
WHERE Código = 2;

-- Atualizar o valor total de uma venda
UPDATE VENDAS
SET Valor_Total = 5400.00
WHERE Código = 3;

-- Atualizar o status de pagamento de um pagamento
UPDATE PAGAMENTOS
SET Status = 'Pago'
WHERE Código = 2;

-- Atualizar o valor de pagamento
UPDATE PAGAMENTOS
SET Valor = 1500.00
WHERE Código = 1;

-- 3. COMANDOS DELETE

-- Excluir um cliente
DELETE FROM CLIENTES WHERE CPF = '98765432100';

-- Excluir um fornecedor
DELETE FROM FORNECEDORES WHERE CNPJ = '11223344000111';

-- Excluir um produto
DELETE FROM PRODUTOS WHERE Código = 2;

-- Excluir uma venda
DELETE FROM VENDAS WHERE Código = 1;

-- Excluir um pagamento
DELETE FROM PAGAMENTOS WHERE Código = 3;
