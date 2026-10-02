-- Active: 1788519229702@@127.0.0.1@3306@smartcoffe_dml_davi
DROP DATABASE IF EXISTS SMARTCOFFE_DML_DAVI;
CREATE DATABASE IF NOT EXISTS SMARTCOFFE_DML_DAVI;
USE SMARTCOFFE_DML_DAVI;

CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60)NOT NULL UNIQUE
)

CREATE TABLE produto(
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)

);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO','PREPARANDO','FINALIZADO','CANCELADO')NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
)

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_uniatario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
)

CREATE TABLE forma_pagamento(
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
)

CREATE TABLE PAGAMENTO(
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
)

--INSERINDO DADOS NO BD
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Arthur Nunes', 'arthur@email.com', '19999901', 'Rondonia', TRUE),
('Beatriz Raissa', 'beatriz@email.com', '19999902', 'Limeira', TRUE),
('Dandara Dias', 'dandara@email.com', '19999903', 'Limeira', TRUE),
('Davi Ferreira', 'davi@email.com', 'NULL', 'Limeira', TRUE),
('Felipe Rodrigues', 'felipe@email.com', '19999905', 'Limeira', TRUE),
('Francisco Magri', 'chico@email.com', '19999904', 'Rondonia', TRUE),
('Franz Kramer','franz@email.com','199999904','Limeira',TRUE),
('Gabriel Nogueira','gabriel@email.com','199999905','Limeira',TRUE),
('Gabrielli Araujo','gabrielli@email.com','199999906','Americana',TRUE),
('Isabella Alves','isabella@email.com',NULL,'Limeira',TRUE),
('Keynan Santos','keynan@email.com','199999907','Santos',TRUE),
('Larissa Ramires','larissa@email.com','199999908','Limeira',TRUE),
('Leonardo Dias','leonardo@email.com','199999909','Valinhos',TRUE),
('Luana Lima','luana@email.com','199999910','Limeira',TRUE),
('Luccas Manfredi','lucas@email.com','199999911','Campinas',TRUE);


INSERT INTO categoria(nome) VALUES
('Cafés'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('salgados'),
('sobremesas'), 
('combo')

INSERT INTO categoria (nome) VALUES
('Doces');

INSERT INTO produto(nome, preco, ativo, id_categoria) VALUES
('Café tradicional', 7.00, TRUE, 1),
('Capuccino', 18.00, TRUE, 2),
('Soda italiana', 20.00, TRUE, 3),
('Leite com achocolatado', 10.00, TRUE, 4),
('Café gelado', 7.00, TRUE, 5),
('Suco de laranja', 14.00, TRUE, 6)

 INSERT INTO pedido(data_pedido,status_pedido,valor_total,id_cliente) VALUES
 (NOW(), 'ABERTO', 7.00, 1),
 (NOW(), 'PREPARANDO', 20.00, 2),
 (NOW(), 'FINALIZADO', 18.00, 3),
 (NOW(), 'CANCELADO', 7.00, 4);

INSERT INTO item_pedido(id_pedido,preco_uniatario,quantidade,observacao,id_produto)VALUES
(1, 7.00, 3, 'sem açúcar', 1 ),
(2, 10.00, 1, 'Com pouco achocolatado', 2 ),
(3, 20.00, 2, 'Com bastante açúcar', 3 ),
(4, 18.00, 6, 'Bem gelado', 4 )

INSERT INTO forma_pagamento(id_forma_pagamento,descricao) VALUES
(1, 'crédito'),
('2', 'debito')

INSERT INTO pagamento(id_pagamento,valor, id_forma_pagamento,data_pagamento,id_pedido) VALUES
(1,7.00,1,NOW(),1)


 SELECT * FROM pedido
 


-- verificar ultimo insert realizado ou feito
SET @categoria = LAST_INSERT_ID();
SELECT @categoria;

-- ----------------------------------------------------



-- ATUALIZANDO DADOS OU MODIFICANDO DADOS NO BD

-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPADTE)
-- E NUNCA, JAMAIS, NEVER FAÇA UM UPDATE SEM WHERE
-- EX 1: MODIFICANDO VALORES INDIVIDUAIS

UPDATE cliente
SET telefone = '1988888801'
WHERE id_cliente = 10

UPDATE cliente
SET telefone = '00000000000'

-- EX 2: MODIFICANDO VÁRIOS VALORES
UPDATE cliente 
SET telefone = '199999901',
    cidade = 'Piracicaba'
WHERE id_cliente = 9;

-- APAGAR DADOS DA TABELA NO BD
DELETE FROM cliente
WHERE id_cliente = 9;


--CONSULTAR DADOS NO BD
SELECT * FROM cliente;
WHERE id_cliente = 10

SELECT * FROM categoria;



-- -------------------------------------
-- PROCEDIMENTO DE UMA COMPRA
-- PASSO 1: REALIZAR CADASTRO CLIENTE
INSERT INTO cliente(nome,email,telefone,cidade,ativo) VALUES
('Davi Silva', 'davi1.silva@email.com', '199999999', 'Santos', TRUE)

SET @cliente_compra = LAST_INSERT_ID();

-- PASSO 2: REALIZAR PEDIDO
INSERT INTO pedido(data_pedido,status_pedido,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',0.00,@cliente_compra);
SET @pedido_compra = LAST_INSERT_ID();

--PASSO 3: INSERINDO ITENS
INSERT into item_pedido (id_pedido, id_produto, quantidade, preco_uniatario) VALUES
(@pedido_compra,4,1,13.00), (@pedido_compra,9,1,9.00);

-- PASSO 4 - ATUALIZANDO TOTAL E STATUS
UPDATE pedido
SET valor_total = 22.00,
status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5 - REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_compra, 2, 22.00, NOW());



-- PASSO 6 - CONSULTAR PEDIDO E RESULTADO
SELECT p.id_pedido,
       c.nome AS Nome_Cliente,
       p.status_pedido AS Status_Pedido,
       p.valor_total AS Compra_Total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

-- TRANSAÇÕES - SEGURANÇA PARA DML
START TRANSACTION;

UPDATE produto 
SET preco = preco * 2.80
WHERE id_categoria = 1;

SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1;
-- DESFAZ O QUE FIZEMOS ERRADO OU VOLTA UMA TRANSAÇÃO

ROLLBACK
-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO
COMMIT;

START TRANSACTION;

START TRANSACTION;
UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 121;

SELECT * FROM cliente WHERE id_cliente = 121;

COMMIT;
ROLLBACK;



