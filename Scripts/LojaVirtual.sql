CREATE DATABASE LojaVirtual;
USE LojaVirtual;

DROP TABLE IF EXISTS ItemPedido;

CREATE TABLE Cliente (
	idCliente INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Produto (
	idProduto INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) CHECK (preco > 0)
);

CREATE TABLE Pedido (
	idPedido INT PRIMARY KEY,
    idCliente INT,
    DataPedido DATE,
		FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE ItemPedido (
	idItem INT PRIMARY KEY,
	idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    Qtd INT CHECK (qtd > 0)
);

INSERT INTO Cliente VALUES
	(1, 'Marina', 'marina@gmail.com'),
    (2, 'João', 'joao@gmail.com'),
    (3, 'Marcia', 'marcia@gmail.com'),
    (4, 'Gabriel', 'gabs@gmail.com'),
    (5, 'Jessica', 'jessica@gmail.com'),
    (6, 'Leticia', 'letica@gmail.com'),
    (7, 'Carlos', 'carlos@gmail.com'),
    (8, 'Henrique', 'henrique@gmail.com'),
    (9, 'Fernada', 'fernanda@gmail.com'),
    (10, 'Wesley', 'wesley@gmail.com');
    
INSERT INTO Produto VALUES
	(1, 'Teclado Mecânico RGB', -250.00),
	(2, 'Mouse Gamer Wireless', 180.50),
	(3, 'Monitor 24 Polegadas Full HD', 899.90),
	(4, 'Headset com Microfone', 120.00),
	(5, 'Cadeira de Escritório Ergonômica', 650.00),
	(6, 'Webcam 1080p', 210.00),
	(7, 'Suporte para Notebook', 45.00),
	(8, 'SSD 480GB SATA3', 320.00),
	(9, 'Memória RAM 8GB DDR4', 190.00),
	(10, 'Cabo HDMI 2.0 (2 metros)', 35.00);
    
INSERT INTO Pedido VALUES
	(10, 1, '2026-01-10'),
	(20, 2, '2026-01-12'),
	(30, 3, '2026-01-15'),
	(40, 4, '2026-01-20'),
	(50, 5, '2026-02-01'),
	(60, 6, '2026-02-05'),
	(70, 7, '2026-02-10'),
	(80, 8, '2026-02-15'),
	(90, 9, '2026-03-01'),
	(100, 10, '2026-03-05');
  
INSERT INTO ItemPedido VALUES
	(1, 10, 1, 2), 
	(2, 100, 3, 1),
	(3, 20, 2, 1),
	(4, 30, 5, 1),
	(5, 40, 10, 5),
	(6, 50, 8, 4),
	(7, 60, 6, 2),
	(8, 70, 4, 3),
	(9, 80, 7, 1),
	(10, 90, 9, 2);
    
SELECT * FROM Cliente;
SELECT Nome, preco FROM Produto;
SELECT Nome, preco FROM Produto WHERE preco > 100;
SELECT Nome, preco FROM Produto ORDER BY preco DESC LIMIT 10;

SELECT Nome FROM Cliente WHERE Nome LIKE 'A%';
SELECT Nome, preco FROM Produto WHERE preco BETWEEN 50 AND 200;

SELECT p.idPedido, c.nome FROM Pedido p INNER JOIN Cliente c ON p.idCliente = c.idCliente;
SELECT p.nome, i.Qtd FROM Produto p LEFT JOIN ItemPedido i ON p.idProduto = i.idProduto;

SELECT c.nome AS Cliente, p.nome AS Produto, i.Qtd AS Quantidade FROM Cliente c 
INNER JOIN Pedido ped ON c.idCliente = ped.idCliente
INNER JOIN ItemPedido i ON ped.idPedido = i.idPedido
INNER JOIN Produto p ON i.idProduto = p.idProduto;

SELECT c.nome AS Cliente, SUM(i.Qtd) AS TotalProdutos FROM Cliente c
INNER JOIN Pedido ped ON c.idCliente = ped.idCliente
INNER JOIN ItemPedido i ON ped.idPedido = i.idPedido GROUP BY c.nome;

SELECT p.nome AS Produto, SUM(i.Qtd) AS TotalProdutos FROM Produto p
INNER JOIN ItemPedido i ON p.idProduto = i.idProduto GROUP BY p.nome;

SELECT p.nome AS Produto, p.preco AS Preço, i.Qtd AS Quantidade, (p.preco * i.Qtd) AS Subtotal FROM Produto p 
INNER JOIN ItemPedido i ON p.idProduto = i.idProduto;

SELECT c.nome AS Cliente, ped.idPedido AS ID_Pedido, SUM(p.preco * i.Qtd) AS TotalGasto FROM Cliente c
INNER JOIN Pedido ped ON c.idCliente = ped.idCliente
INNER JOIN ItemPedido i ON ped.idPedido = i.idPedido
INNER JOIN Produto p ON i.idProduto = p.idProduto GROUP BY ped.idPedido, c.nome;