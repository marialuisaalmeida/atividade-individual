create database db_revenda_maria;

create table cliente (
id serial primary key,
nome varchar (100) not null,
cpf char (11) not null,
email varchar (100) unique not null,
telefone char (11) not null,
data_nascimento date check (data_nascimento > 0)
);

create table produtos (
id serial primary key,
titulo varchar (100) not null,
descricao text not null,
preco numeric(7,2) check (preco > 0),
categoria varchar (50) not null,
id_fornecedor int unique not null
);

create table fornecedor (
id serial primary key,
nome varchar (100) not null,
cnpj char (14) not null,
telefone char (11) not null,
email varchar (100) unique not null,
cidade varchar(50) not null
);

create table funcionarios (
id serial primary key,
nome varchar (100) not null,
cargo varchar (50) not null,
salario numeric (10,2) check (salario > 0),
telefone char (11) not null,
email varchar (100) unique not null
);

create table estoque (
id serial primary key,
id_produto int,
titulo_item varchar(100) not null,
quantidade int check (quantidade > 0),
preco numeric(7,2) check (preco > 0),
descricao text not null
);

create table vendas (
id_cliente int,
id_produto int,
quantidade int,
primary key (id_cliente, id_produto),
foreign key (id_cliente) references cliente(id),
foreign key (id_produto) references produtos(id)
);

SELECT * FROM funcionarios WHERE nome LIKE 'a%';

explain SELECT * FROM funcionarios WHERE nome LIKE 'a%';

CREATE INDEX idx_funcionarios_nome ON funcionarios(nome);

explain SELECT * FROM funcionarios WHERE nome LIKE 'a%';

ALTER TABLE funcionarios ALTER COLUMN salario type INT;

alter table funcionarios alter column salario type varchar(20);

create user maria with password 'senha';
grant all privileges on database db_revenda_maria to maria;


create user biatrice with password 'senha1';
grant select on funcionarios to biatrice;

-- Cliente + Vendas
SELECT c.nome, v.quantidade FROM cliente c INNER JOIN vendas v ON c.id = v.id_cliente;
SELECT c.nome, v.quantidade FROM cliente c LEFT JOIN vendas v ON c.id = v.id_cliente;
SELECT c.nome, v.quantidade FROM cliente c RIGHT JOIN vendas v ON c.id = v.id_cliente;

-- Produtos + Fornecedor
SELECT p.titulo, f.nome FROM produtos p INNER JOIN fornecedor f ON p.id_fornecedor = f.id;
SELECT p.titulo, f.nome FROM produtos p LEFT JOIN fornecedor f ON p.id_fornecedor = f.id;
SELECT p.titulo, f.nome FROM produtos p RIGHT JOIN fornecedor f ON p.id_fornecedor = f.id;

-- Produtos + Vendas
SELECT p.titulo, v.quantidade FROM produtos p INNER JOIN vendas v ON p.id = v.id_produto;
SELECT p.titulo, v.quantidade FROM produtos p LEFT JOIN vendas v ON p.id = v.id_produto;
SELECT p.titulo, v.quantidade FROM produtos p RIGHT JOIN vendas v ON p.id = v.id_produto;

-- Estoque + Produtos
SELECT e.titulo_item, p.titulo FROM estoque e INNER JOIN produtos p ON e.id_produto = p.id;
SELECT e.titulo_item, p.titulo FROM estoque e LEFT JOIN produtos p ON e.id_produto = p.id;
SELECT e.titulo_item, p.titulo FROM estoque e RIGHT JOIN produtos p ON e.id_produto = p.id;

UPDATE funcionarios SET salario = 3000 WHERE salario IS NULL;
UPDATE estoque SET descricao = 'Sem descrição' WHERE descricao IS NULL;
UPDATE fornecedor SET telefone = '00000000000' WHERE telefone IS NULL;



