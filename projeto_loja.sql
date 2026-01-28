-- Olá! Este é o meu projeto de Banco de Dados para uma loja de hardware. 
-- Aqui, eu estruturei toda a lógica de produtos e vendas do zero.

-- Primeiro, eu crio o meu banco de dados chamado 'loja' e entro nele para começar a trabalhar.
CREATE DATABASE loja;
USE loja;

-- Agora, eu vou criar a minha tabela principal de 'produtos'.
-- Eu defini o 'id_produto' como minha chave primária e usei o AUTO_INCREMENT para o banco gerar os números sozinho.
-- Também tive o cuidado de usar DECIMAL(10,2) no preço para garantir a precisão total nos centavos.
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT,
    id_nome VARCHAR(100),
    id_preco DECIMAL(10, 2),
    descricao TEXT,
    PRIMARY KEY (id_produto)
);

-- Aqui eu faço o cadastro inicial dos meus produtos.
-- Comecei com a placa mãe e fui expandindo para teclados, monitores e outros periféricos.
INSERT INTO produtos (id_produto, id_nome, id_preco, descricao) VALUES 
(1, 'placa mae', 500.00, 'placa mancer nova'),
(2, 'Teclado Gamer', 150.00, 'RGB Mecânico'),
(3, 'Mouse Óptico', 80.00, '1200 DPI'),
(4, 'Monitor 24pol', 900.00, 'Full HD 75Hz'),
(5, 'Headset USB', 250.00, 'Som Surround 7.1'),
(6, 'Gabinete ATX', 300.00, 'Lateral de Vidro'),
(7, 'Memória RAM 8GB', 200.00, 'DDR4 3200MHz'),
(8, 'SSD 480GB', 180.00, 'SATA III'),
(9, 'Fonte 500W', 350.00, '80 Plus Bronze'),
(10, 'Webcam 1080p', 120.00, 'Foco Automático'),
(11, 'Cabo HDMI 2m', 30.00, '4K Ultra HD');

-- Agora eu vou criar a minha tabela de 'vendas_mensais'.
-- O ponto mais importante aqui é a FOREIGN KEY: eu conectei o 'id_produto' desta tabela com a tabela de 'produtos'.
-- Isso garante que eu só consiga registrar vendas de produtos que realmente existam no meu estoque.
CREATE TABLE vendas_mensais (
    id_venda INT AUTO_INCREMENT,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    PRIMARY KEY (id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Chegou a hora de registrar as minhas vendas! 
-- Eu preenchi as informações de quantidade, data e o valor final de cada transação que realizei.
INSERT INTO vendas_mensais (id_produto, quantidade, data_venda, valor_total) VALUES 
(1, 1, '2026-01-27', 500.00),
(2, 2, '2026-01-27', 300.00),
(5, 1, '2026-01-27', 250.00),
(11, 3, '2026-01-27', 90.00),
(1, 2, '2026-01-25', 1000.00),
(10, 1, '2026-01-24', 120.00);

-- Para finalizar, eu rodo um JOIN.
-- É assim que eu consigo cruzar as duas tabelas e ver o nome do produto ao lado de cada venda registrada!
SELECT v.id_venda, p.id_nome, v.quantidade, v.data_venda, v.valor_total
FROM vendas_mensais v
JOIN produtos p ON v.id_produto = p.id_produto;
