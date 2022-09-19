
CREATE SCHEMA [M4]

CREATE TABLE [M4].fornecedor (
	ID_fornecedor INT NOT NULL IDENTITY
	, nome VARCHAR(20) NOT NULL
	, CONSTRAINT PK_fornecedor PRIMARY KEY(ID_fornecedor)
)



CREATE TABLE produto (
	ID_produto INT NOT NULL IDENTITY 
	, nome VARCHAR(20) NOT NULL
	, ID_fornecedor INT NOT NULL
	, CONSTRAINT PK_produto PRIMARY KEY(ID_produto)
	, CONSTRAINT FK_fornecedor FOREIGN KEY(ID_fornecedor) REFERENCES [M4].fornecedor(ID_fornecedor)
)


CREATE TABLE item_Compra (
	ID_produto INT NOT NULL
	, ID_fornecedor INT NOT NULL
	, NF_compra INT NOT NULL 
	, Qtde INT NOT NULL
	, CONSTRAINT PK_NF PRIMARY KEY(NF_compra)
	, CONSTRAINT FK_produto FOREIGN KEY(ID_produto) REFERENCES produto(ID_produto)
	, CONSTRAINT FK_fornece FOREIGN KEY(ID_fornecedor) REFERENCES [M4].fornecedor(ID_fornecedor)
)

CREATE TABLE compra(
	NF INT NOT NULL
	, dia_Entrega DATE NOT NULL
	, valor MONEY NOT NULL 
	, data_Entrega DATE NOT NULL
	, CONSTRAINT PK_compra PRIMARY KEY(NF)
	, CONSTRAINT FK_compra FOREIGN KEY(NF) REFERENCES item_Compra(NF_compra)
)