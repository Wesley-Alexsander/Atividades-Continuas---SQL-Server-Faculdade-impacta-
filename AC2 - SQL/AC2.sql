-- INSERT RECORD
INSERT INTO M5.fornecedor (nome) VALUES ('Ambev')
	, ('Dist. PPG')
	, ('P&G')

INSERT INTO M5.produto (nome, ID_FornecedorPadrao) VALUES 
	('Skol', (SELECT ID FROM M5.fornecedor WHERE nome = 'Ambev'))
	, ('Fralda Pampers', (SELECT ID FROM M5.fornecedor WHERE nome = 'P&G'))
	, ('Fralda Pampers', (SELECT ID FROM M5.fornecedor WHERE nome = 'Dist. PPG'))


INSERT INTO M5.Compra (NF, DiasEntrega, Valor, Data) VALUES ('#112434', 3, 8243.00, '21/10/2017')
	, ('#324235', 10, 1230.00, '21/10/2017')
	, ('#455464', 2, 500.00, '26/10/2017')


INSERT INTO M5.itemCompra (ID_produto, ID_fornecedor, NF_compra, Qtde) VALUES
	((SELECT ID FROM M5.produto WHERE nome = 'Skol'), (SELECT ID FROM M5.fornecedor WHERE nome = 'Ambev'), '#112434', 300)
	, ((SELECT ID FROM M5.produto WHERE nome = 'Fralda Pampers' AND ID_FornecedorPadrao = 3), (SELECT ID FROM M5.fornecedor WHERE nome = 'P&G'), '#324235', 25)
	, ((SELECT ID FROM M5.produto WHERE nome = 'Fralda Pampers' AND ID_FornecedorPadrao = 2), (SELECT ID FROM M5.fornecedor WHERE nome = 'Dist. PPG'), '#455464', 10)


-- DELETE RECORD

DELETE FROM M5.ItemCompra WHERE NF_Compra = '#112434'
DELETE FROM M5.Compra WHERE NF = '#112434'
DELETE FROM M5.Produto WHERE Nome = 'Skol'
DELETE FROM M5.Fornecedor WHERE Nome = 'Ambev'


-- UPDATE DATE RECORD 
UPDATE M5.Compra SET Data = '28/10/2017' WHERE Data = '2017-10-26'


-- SELECT TABLES
SELECT * FROM M5.fornecedor
SELECT * FROM M5.produto
SELECT * FROM M5.compra
SELECT * FROM M5.itemCompra



