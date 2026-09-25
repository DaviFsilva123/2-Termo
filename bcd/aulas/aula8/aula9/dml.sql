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
('Cafés'),('Bebidas Geladas'),('Bebidas Quentes'), ('salgados'), ('sobremesas'), ('combo')

INSERT INTO categoria (nome) VALUES
('Doces');

-- verificar ultimo insert realizado ou feito
SET @categoria = LAST_INSERT_ID();
SELECT @categoria;



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


