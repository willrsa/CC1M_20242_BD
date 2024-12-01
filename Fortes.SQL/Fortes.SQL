CREATE TABLE funcionario_fortes (
    func_id INT PRIMARY KEY,
    func_nome VARCHAR(50),
    func_email VARCHAR(35),
    func_cargo VARCHAR(20),
    func_datanasc DATE,
    func_rg VARCHAR(25)
);

CREATE TABLE enderecos (
    end_rua VARCHAR(40),
    end_bairro VARCHAR(50),
    end_numrua INT,
    end_cidade VARCHAR(30),
    end_uf CHAR(2),
    end_pais VARCHAR(30),
    end_cep VARCHAR(20),
    funcionario_fortes_func_id INT,
    donatarios_dona_id INT,
    FOREIGN KEY (funcionario_fortes_func_id) REFERENCES funcionario_fortes(func_id),
    FOREIGN KEY (donatarios_dona_id) REFERENCES donatarios(dona_id)
);

CREATE TABLE donatarios (
    dona_id INT PRIMARY KEY,
    dona_cnpj VARCHAR(45),
    dona_pessoacont VARCHAR(25),
    dona_nomerepresentante VARCHAR(30),
    dona_cpfrepresentante VARCHAR(25)
);

CREATE TABLE vistoria (
    vistoria_id INT PRIMARY KEY,
    vist_valorpendente DECIMAL(10, 2),
    vist_docpendente TEXT,
    vist_doc TEXT,
    vist_valorpago DECIMAL(10, 2),
    funcionario_fortes_func_id INT,
    donatarios_dona_id INT,
    FOREIGN KEY (funcionario_fortes_func_id) REFERENCES funcionario_fortes(func_id),
    FOREIGN KEY (donatarios_dona_id) REFERENCES donatarios(dona_id)
);

CREATE TABLE reunioes (
    reun_id INT PRIMARY KEY,
    reun_data DATE,
    vistoria_vistoria_id INT,
    FOREIGN KEY (vistoria_vistoria_id) REFERENCES vistoria(vistoria_id)
);

CREATE TABLE relatorios (
    relatorio_id INT PRIMARY KEY,
    relatorio_data DATE,
    relatorio_gastos DECIMAL(10, 2),
    vistoria_vistoria_id INT,
    FOREIGN KEY (vistoria_vistoria_id) REFERENCES vistoria(vistoria_id)
);

CREATE TABLE edital (
    edital_id INT PRIMARY KEY,
    edital_inicio DATE,
    edital_fim DATE,
    edital_obj TEXT,
    edital_bem_atica VARCHAR(45),
    edital_metodologia TEXT,
    edital_metas TEXT,
    edital_orgam_envinvest DECIMAL(10, 2),
    donatarios_dona_id INT,
    funcionario_fortes_func_id INT,
    FOREIGN KEY (donatarios_dona_id) REFERENCES donatarios(dona_id),
    FOREIGN KEY (funcionario_fortes_func_id) REFERENCES funcionario_fortes(func_id)
);
