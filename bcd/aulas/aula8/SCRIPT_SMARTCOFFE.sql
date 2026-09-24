-- Geração de Modelo Físico
-- Banco de Dados: Projeto_SmartCoffee

CREATE DATABASE IF NOT EXISTS Projeto_SmartCoffee;
USE Projeto_SmartCoffee;


CREATE TABLE IF NOT EXISTS Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    cpf_funcionario VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(30),
    carga_horaria TIME,
    salario DECIMAL(10, 2),
    nome_funcionario VARCHAR(60),
    data_admissao DATE
);


CREATE TABLE IF NOT EXISTS Delivery (
    id_delivery INT AUTO_INCREMENT PRIMARY KEY,
    preparando int,
    saiu_para_entrega int,
    data_hora_saida DATETIME DEFAULT CURRENT_TIMESTAMP,
    taxa_entrega DECIMAL(10, 2),
    horario_pedido TIME,
    endereco VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS Avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_delivery INT,
    data_de_avaliacao DATE,
    funcionario_que_recebeu VARCHAR(60),
    quem_fez VARCHAR(60),
    nota INT,
    mensagem TEXT,
    FOREIGN KEY (id_delivery) REFERENCES Delivery(id_delivery)
);


CREATE TABLE IF NOT EXISTS Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(60),
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(14),
    email VARCHAR(150),
    endereco_fornecedor VARCHAR(150)
);


CREATE TABLE IF NOT EXISTS Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(40),
    descricao VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_fornecedor INT,
    nome_produto VARCHAR(40),
    data_de_fabricacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    validade DATE,
    descricao TEXT,
    preco DECIMAL(10, 2),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);


CREATE TABLE IF NOT EXISTS Estoque (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nome_insumo VARCHAR(50),
    quantidade_atual INT,
    quantidade_minima INT,
    data_de_entrada DATE,
    unidade_medida VARCHAR(10)  
);


CREATE TABLE IF NOT EXISTS Ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    id_insumo INT,
    tipo_ingrediente VARCHAR(100),
    data_de_validade DATE,
    quem_forneceu VARCHAR(60),
    codigo_ingrediente INT,
    quantidade INT,
    FOREIGN KEY (id_insumo) REFERENCES Estoque(id_insumo)
);


CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(50),
    telefone_cliente VARCHAR(15),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS Programa_Fidelidade (
    id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNIQUE,
    saldo_pontos INT DEFAULT 0,
    data_ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


CREATE TABLE IF NOT EXISTS Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    id_delivery INT,
    presencial TINYINT(1) DEFAULT 1,
    status_preparo VARCHAR(20), 
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    numero_mesa INT,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_delivery) REFERENCES Delivery(id_delivery)
);


CREATE TABLE IF NOT EXISTS Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNIQUE,
    forma_pagamento VARCHAR(20), 
    status_pagamento VARCHAR(20), 
    valor_do_pagamento DECIMAL(10, 2),
    data_hora_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    informacoes_de_pagamento VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);


CREATE TABLE IF NOT EXISTS Item_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE IF NOT EXISTS Produto_Insumo (
    id_produto INT,
    id_insumo INT,
    quantidade_utilizada DECIMAL(10, 3),
    PRIMARY KEY (id_produto, id_insumo),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_insumo) REFERENCES Estoque(id_insumo)
);