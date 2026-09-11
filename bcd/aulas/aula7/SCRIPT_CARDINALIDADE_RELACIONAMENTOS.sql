-- Active: 1788519229702@@127.0.0.1@3306@sesi_cr_ta

-- Sql ANSI 2003 - brModelo.

CREATE DATABASE IF NOT EXISTS SESI_CR_TA;

USE SESI_CR_TA;

CREATE TABLE Pedido (
data_pedido date,
Id_pedido int PRIMARY KEY,
Id_cliente int not null unique
)

CREATE TABLE Cliente (
Nome_cliente Varchar(60),
Id_cliente Int PRIMARY KEY
);

CREATE TABLE Estoque (
Id_produto int auto_increment primary key,
Nome_produto varchar(60),
Id_estoque int auto_increment primary key,
Quantidade int,
PRIMARY KEY(Id_produto,Id_estoque)
);

CREATE TABLE Produto (
Id_produto int auto_increment primary key PRIMARY KEY,
Nome_produto varchar(60)
);

CREATE TABLE Fornecedor (
Id_fornecedor int auto_increment primary key PRIMARY KEY
);

CREATE TABLE item_produto (
Id_item int auto_increment primary KEY,
Id_fornecedor int not null unique,
Id_produto int not null unique,
Valor decimal,
FOREIGN KEY(Id_fornecedor) REFERENCES Fornecedor (Id_fornecedor),
FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
);

CREATE TABLE Realiza (
Id_pedido int not null unique,
Id_Cliente int not null unique,
FOREIGN KEY(Id_pedido) REFERENCES Pedido (Id_pedido),
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

ALTER TABLE Pedido ADD FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente);

