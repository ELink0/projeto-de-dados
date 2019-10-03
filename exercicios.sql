-- Ex. 1 - Alt. A
﻿CREATE SCHEMA cadastro;

CREATE TABLE cadastro.cliente (
id_Cli INTEGER NOT NULL,
nome_Cli VARCHAR(80) NOT NULL,
num_Cli VARCHAR(10) NOT NULL,
rua_Cli VARCHAR(100)NOT NULL,
cidade VARCHAR(80)NOT NULL,
uf CHAR(2)NOT NULL,
bairro VARCHAR(50)NOT NULL,
fone VARCHAR(15)NOT NULL,
CONSTRAINT idcli PRIMARY KEY (id_Cli)
);


CREATE TABLE cadastro.produto(
id_Prod INTEGER NOT NULL,
nome_Prod VARCHAR(100) NOT NULL,
valor_Prod DECIMAL(12,2) NOT NULL,
CONSTRAINT id_Prod PRIMARY KEY (id_Prod)
);

CREATE TABLE cadastro.servicos (
id_Servicos INTEGER NOT NULL PRIMARY KEY,
titulo_Servico VARCHAR(100),
valor_Servico DECIMAL(12,2)
);

CREATE TABLE cadastro.veiculo (
id_Vel INT NOT NULL PRIMARY KEY,
model_Vel VARCHAR(20),
fabricante_Vel VARCHAR(50),
renavam_Vel VARCHAR(7),
cor_Veiculo VARCHAR(50)

);

-- Ex. 1 - Alt. B
CREATE SCHEMA movimento;

CREATE TABLE movimento.OS(
id_OS INTEGER NOT NULL,
id_Vel INTEGER,
id_Cli INTEGER,
data_Ordem DATE,
valor_OS DECIMAL(12,2) NOT NULL,
CONSTRAINT id_OS PRIMARY KEY (id_OS),
FOREIGN KEY (id_Vel) REFERENCES cadastro.veiculo(id_Vel),
FOREIGN KEY (id_Cli) REFERENCES cadastro.cliente(id_Cli)

);

CREATE TABLE movimento.itens_OS_servicos(
id_Servicos INTEGER NOT NULL,
id_OS INTEGER NOT NULL,
FOREIGN KEY (id_Servicos) REFERENCES cadastro.servicos(id_Servicos),
FOREIGN KEY (id_OS) REFERENCES movimento.OS(id_OS)
);

CREATE TABLE movimento.itens_OS_Produtos(
id_OS INTEGER NOT NULL,
id_Prod INTEGER NOT NULL,
FOREIGN KEY (id_Prod) REFERENCES cadastro.produto(id_Prod),
FOREIGN KEY (id_OS) REFERENCES movimento.OS(id_OS)
);


-- Funções de inserção
-- Ex. 2 - Alt. A
	-- Inserindo na tabela cliente
CREATE FUNCTION insere_cliente() RETURNS void AS
$$
INSERT INTO cadastro.cliente VALUES (1, 'Cida', '1111111111', 'asdasdasda', 'PARANÁ', 'PR', 'São jorge', '1231231231');
$$
LANGUAGE sql;

-- Ex. 2 - Alt. B
	-- Inserindo na tabela veículo
CREATE FUNCTION insere_veiculo() RETURNS void AS
$$
INSERT INTO cadastro.veiculo VALUES (1, 'R8', 'AUDI', 'eer-212', 'vermelho');
$$
LANGUAGE sql;

-- Ex. 2 - Alt. C
	-- Inserindo na tabela produtos
CREATE FUNCTION insere_produtos() RETURNS void AS
$$
INSERT INTO cadastro.produtos VALUES (1,'Veja', 12.09 );
$$
LANGUAGE sql;

-- Ex. 2 - Alt. D
	-- Inserindo na tabela serviços
CREATE FUNCTION insere_servico() RETURNS void AS
$$
INSERT INTO cadastro.servicos VALUES (1, 'Arrumar', 150.50);
$$
LANGUAGE sql;

-- Ex. 2 - Alt. E
-- Função Delete na tabela cliente
CREATE FUNCTION deleta_clientes() RETURNS void AS
$$
DELETE FROM cadastro.cliente;
$$
LANGUAGE sql;

-- Ex. 2 - Alt. F
-- Função para alterar registros na tabela de veículos
CREATE FUNCTION veiculos_alterar() RETURNS void AS
$$
ALTER TABLE cadastro.veiculo ADD model_Vel VARCHAR(20);
$$
LANGUAGE sql;

-- Ex. 2 - Alt. G
-- Função para apresentar o número de todos os produtos cadastrados
CREATE FUNCTION lista_produto() RETURNS void AS
$$
SELECT * FROM cadastro.produto;
$$
LANGUAGE sql;

-- Ex. 2 - Alt. H
--Uma função que apresente o número de todos os serviços cadastrados
CREATE FUNCTION lista_servico() RETURNS void AS
$$
SELECT * FROM cadastro.servicos;
$$
LANGUAGE sql;


	-- Inserindo na tabela OS
CREATE FUNCTION inserte_OS() RETURNS void AS
$$

INSERT INTO movimento.OS VALUES (1, 1, 1, '2019/12/12', 12.12);

$$
LANGUAGE sql;

	-- Inserindo na tabela Itens_OS_Produtos
CREATE FUNCTION inserte_Itens_OS_Produtos() RETURNS void AS
$$

INSERT INTO movimento.itens_OS_Produtos VALUES (1, 1);

$$
LANGUAGE sql;

CREATE FUNCTION insere_itens_os_servicos() RETURNS void AS
$$
INSERT INTO movimento.intens_OS_servicos VALUE (1,2);
$$
LANGUAGE sql;







				-- SELECTs --


	-- Função para apresentar o número de serviços cadastrados
