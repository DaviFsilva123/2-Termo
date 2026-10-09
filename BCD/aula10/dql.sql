-- Active: 1788519229702@@127.0.0.1@3306@smartcoffe_dml_davi
-- AULA 09 - DQL (DATA QERY LANGUAGE) - LINGUAGEM DE CONSULTA DE DADOS
-- EX 1: SELECT SIMPLES
-- SELECT coluna
-- FROM tabela

SELECT * FROM cliente;
-- CONSULTA TODAS AS COLUNAS NA TABELA 

SELECT nome, telefone FROM cliente;
SELECT nome, preco FROM produto;

-- CONSULTA DADOS COM VÁRIAS COLUNAS

-- EX 2: CONSULTANDO E PERSONALIZANDO A CONSULTA
SELECT nome AS Nome_Cliente, telefone AS Contato_Cliente 
FROM cliente;

SELECT nome, preco, preco * 1.00 AS preco_ajustado
FROM produto;

-- EX 3: DISTINCT - ELIMINAR REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente

select cidade from cliente;
-- COM DISTINCT CADA RESULTADO É APRESENTADO APENAS UMA VEZ, E SEM O DISTINCT O RESULTADO É APRESENTADO VÁRIAS VEZES

-- EX 4: USO DE WERE - FILTRO DE REGISTROS
-- INSERIR CONDIÇÕES E UTILIZAR OPERADORES DE COMPARAÇÃO

-- = IGUAL
-- <> OU != DIFERENTE
-- > MAIOR QUE
-- => MAIOR OU IGUAL
-- < MENOR QUE
-- <= MENOR OU IGUAL
SELECT nome, preco FROM produto WHERE preco > 15.00;
-- CONSULTAR PREÇOS QUE POSSUEM O VALOR ACIMA DE 15 R$

SELECT nome, preco FROM produto WHERE ativo = FALSE;
-- CONSULTAR PRODUTOS ATIVOS OU INATIVOS (TRUE OU FALSE)

SELECT id_pedido, data_pedido, valor_total
FROM pedido WHERE valor_total >= 25.00;
-- CONSULTAR VALOR TOTAL DE PRODUTOS ACIMA DE 25.00 REAIS

-- EX 5: USO DE AND, OR E NOT
-- AN - TODAS AS CONDIÇÕES VERDADEIRAS
SELECT nome, preco FROM produto
WHERE preco >= 8.00 AND preco <= 25.00;

-- OR - UMA DAS CONDIÇÕES PRECISA SER VERDADEIRA
SELECT nome, cidade FROM cliente
WHERE cidade = 'Boston' OR cidade = 'NYC';

-- NOT CRIAR UMA CONDIÇÃO DE NEGAÇÃO
SELECT nome, cidade FROM cliente
WHERE NOT cidade = 'Limeira';

-- AND E OR JUNTOS PECISAMOS INSERIR ()
SELECT nome, cidade, ativo FROM cliente
WHERE ativo = TRUE AND (cidade = 'Boston' OR cidade = 'NYC')

-- EX 6: BETWEEN - PESQUISAR POR INTERVALOS
-- LIMITE INICIAL E FINAL
SELECT nome, preco FROM produto 
WHERE preco BETWEEN 8.00 AND 15.00;
-- CONSULTA POR INTERVALOS DE VALOR
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';
-- CONSULTAR DADOS POR INTERVALO DE DATA

-- EX 7: IN - MUITAS POSSIBILIDADES
SELECT nome, cidade FROM cliente 
WHERE cidade IN('Limeira', 'Piracicaba', 'NYC');

SELECT nome, cidade FROM cliente
WHERE cidade NOT IN ('limeira', 'Piracicaba');

-- EX 8: LIKE - PESQUISA POR TEXTOS
-- CORINGAS
-- % VÁRIOS CHARACTERES
-- _APENAS UM CARACTER
SELECT nome FROM produto
WHERE nome LIKE 'Café%';
-- CONSULTA PELA PALAVRA QUE DESEJA E QUAL COMEÇA

SELECT nome FROM produto
WHERE nome LIKE '%chocolate%';
-- CONSULTA PELA PALAVRA QUE CONTÊM CHOCOLATE

SELECT nome FROM cliente 
WHERE nome LIKE '%Santos';
-- CONSULTA PELA PALAVRA QUE DESEJA E QUAL TERMINA

SELECT nome FROM produto
WHERE nome LIKE '%o_o%';

-- EX 9: NULL - AUSÊNCIA DE VALOR
SELECT nome, telefone FROM cliente 
WHERE telefone IS NULL;

SELECT nome, telefone FROM cliente 
WHERE telefone IS NOT NULL;

SELECT nome, telefone FROM cliente 
WHERE telefone = 'NULL';

-- EX 10: ORDER BY - ORDENAR RESULTADOS
-- ASC É CERSCENTE
-- DESC É DECRESCENTE
SELECT nome, preco FROM produto 
ORDER BY preco ASC;

SELECT nome, preco FROM produto 
ORDER BY preco DESC;

SELECT nome, preco FROM produto
ORDER BY nome ASC, preco DESC

SELECT cidade, nome FROM cliente
ORDER BY cidade ASC, nome DESC;
-- ORDENAR POR MAIS UMA COLUNA 

-- EX 11: LIMIT DETERMINAR UMA QUANTIDADE DE LINHAS
SELECT nome, preco
FROM produto 
ORDER BY preco DESC 
LIMIT 10;

SELECT nome, preco 
FROM produto
ORDER BY nome
LIMIT 10 OFFSET 5;

-- EX 12: CÁUCULOS EM COLUNAS
SELECT nome, preco, preco * 1.30 AS Preço_Reajuste
FROM produto;

SELECT id_item, quantidade, preco_uniatario, quantidade * preco_uniatario AS Subtotal FROM item_pedido;

-- EX 13: FUNÇÕES
SELECT UPPER(nome) AS NOME_M, LOWER(cidade) AS cidade_m
FROM cliente;
-- USO DE MAIUSCULO(UPPER) E MINUSCULO(LOWER)
SELECT CONCAT(nome, ' -- ', cidade) AS Cliente_Cidade
FROM cliente;

-- NÚMEROS 
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido, valor_total, DATE(data_pedido) AS datas, MONTH (data_pedido) AS MÊS, YEAR (data_pedido) AS ANO, DAY(data_pedido) AS DIAS, TIME(data_pedido) AS HORÁRIO
FROM pedido;

-- SUBSTITUIR O NULL NO RESULTADO COALESCE
SELECT nome, COALESCE(telefone, 'Não Informado') AS Telefone 
FROM cliente;

-- EX 14 : FUNÇÕES DE AGREGAÇÃO
-- COUNT = CONTAR UMA QUANTIDADE
-- SUM = SOMAR VALORES 
-- AVG = CALCULAR MÉDIA 
-- MIN = MÍNIMO VALOR 
-- MAX = MÁXIMO VALOR
SELECT COUNT(*) AS TOTAL_CLIENTE
FROM cliente;
-- QUANTOS CLIENTES EXISTEM NA TABELA

SELECT ROUND(AVG(preco),2) AS Preço_Médio_Produtos
FROM produto;
-- PRECO MÉDIO DOS PRODUTOS

SELECT ROUND(MIN(preco),2) AS Preços_Baixos,
ROUND(MAX(preco),2) AS Preço_Alto,
ROUND(AVG(preco),2) AS Preço_Baixo
FROM produto;

SELECT SUM(valor_total) AS FATURAMENTO
FROM pedido
WHERE status = 'PREPARANDO';
-- TOTAL DE PEDIDOS COM CRITÉRIO

-- EX 15: GROUP BY - AGRUPAR DADDOS
SELECT cidade, COUNT(*) AS  QTDE_CLIENTES
FROM cliente
GROUP BY cidade;
-- QUANTOS CLIENTES TENHO EM CADA CIDADE

SELECT id_categoria, COUNT(*) AS QTDE_PRODUTOS
FROM produto
GROUP BY id_categoria;
-- QUANRIDADE DE PRODUTOS POR CATEGORIA














































































































