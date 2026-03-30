CREATE DATABASE ClientesDados;

DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Pedidos;

USE ClientesDados;

CREATE TABLE Cliente (
	idCliente INT PRIMARY KEY,
    nomeCliente VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Produtos (
	idProduto INT PRIMARY KEY,
    nomeProduto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) CHECK(preco > 0)
);

CREATE TABLE Pedidos (
	idPedido INT PRIMARY KEY,
    idCliente INT,
    idProduto INT,
    valor DECIMAL(10,2) CHECK(valor > 0),
		FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
        FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

INSERT INTO Cliente VALUES
	(1, "José", "São Bernardo do Campo"),
    (2, "Fernada", "Mauá"),
    (3, "Daniel", "Diadema"),
    (4, "Marcela", "Osasco"),
    (5, "Pietro", "Socorro");
INSERT INTO Produtos VALUES 
	(5, "Camiseta", 49.90),
    (10, "Terno", 254.58),
    (15, "Calça Jeans", 150.99),
    (20, "Meias", 15.50),
    (25, "Luvas", 11.00);
INSERT INTO Pedidos VALUES 
	(1, 1, 10, 254.58),
    (2, 2, 20, 15.50),
    (3, 3, 15, 150.99),
    (4, 4, 25, 11.00),
    (5, 5, 5, 49.90);
    



