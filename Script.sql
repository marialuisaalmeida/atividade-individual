create database db_revenda_maria;

create table cliente (
id serial primary key,
nome varchar (100) not null,
cpf char (11) not null,
email varchar (100) unique not null,
telefone char (11) not null,
data_nascimento date check (data_nascmento > 0)
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

--insert
insert into cliente (nome, cpf, email, telefone, data_nascimento) values
('Ana', '12345678911', 'ana@gmail.com', '24988765432', '2008-04-11'),
('Paula', '12367899955', 'paula@gmail.com', '24988760987', '2002-08-23'),
('Rosa', '12476509833', 'rosa@gmail.com', '24987658896', '2004-07-07'),
('Celina', '23467887611', 'celina@gmail.com', '24988765432', '1977-08-09'),
('Leandro', '12345676511', 'leandro@gmail.com', '24988768765', '1977-10-31'),
('Mateus', '12645676512', 'mateus@gmail.com', '24988768888', '2000-06-12'),
('Carla', '12845676513', 'carla@gmail.com', '24988767777', '1999-03-15'),
('João', '12945676514', 'joao@gmail.com', '24988766666', '1995-02-20'),
('Beatriz', '13045676515', 'beatriz@gmail.com', '24988765555', '2003-05-05'),
('Lucas', '13145676516', 'lucas@gmail.com', '24988764444', '1998-09-10');

insert into produtos (titulo, descricao, preco, categoria, id_fornecedor) values
('Colar Dourado', 'Colar folheado a ouro', '50.00', 'Colar', '1'),
('Pulseira Prata', 'Pulseira de prata fina', '35.00', 'Pulseira', '2'),
('Brinco Pérola', 'Brinco com pérolas artificiais', '20.00', 'Brinco', '3'),
('Anel de Prata', 'Anel delicado de prata', '45.00', 'Anel', '4'),
('Choker Preta', 'Choker de veludo preto', '15.00', 'Colar', '5'),
('Brinco Argola', 'Argola dourada grande', '25.00', 'Brinco', '6'),
('Pulseira Colorida', 'Pulseira de miçangas coloridas', '10.00', 'Pulseira', '7'),
('Anel Coração', 'Anel com detalhe de coração', '30.00', 'Anel', '8'),
('Colar Prata', 'Colar simples de prata', '40.00', 'Colar', '9'),
('Brinco Estrela', 'Brinco em formato de estrela', '22.00', 'Brinco', '10');

insert into fornecedor (nome, cnpj, telefone, email, cidade) values
('Fornecedor A', '12345678000111', '24980001122', 'fa@gmail.com', 'Rio de Janeiro'),
('Fornecedor B', '22345678000122', '24981112233', 'fb@gmail.com', 'São Paulo'),
('Fornecedor C', '32345678000133', '24982223344', 'fc@gmail.com', 'Belo Horizonte'),
('Fornecedor D', '42345678000144', '24983334455', 'fd@gmail.com', 'Curitiba'),
('Fornecedor E', '52345678000155', '24984445566', 'fe@gmail.com', 'Salvador'),
('Fornecedor F', '62345678000166', '24985556677', 'ff@gmail.com', 'Brasília'),
('Fornecedor G', '72345678000177', '24986667788', 'fg@gmail.com', 'Fortaleza'),
('Fornecedor H', '82345678000188', '24987778899', 'fh@gmail.com', 'Recife'),
('Fornecedor I', '92345678000199', '24988889900', 'fi@gmail.com', 'Manaus'),
('Fornecedor J', '10345678000200', '24989990011', 'fj@gmail.com', 'Vitória');

insert into estoque (id_produto, titulo_item, quantidade, preco, descricao) values
('1', 'Colar de Pérola', '15', '120.00', 'Disponível em várias cores'),
('2', 'Pulseira de Prata', '20', '80.00', 'Prata pura'),
('3', 'Brinco de Ouro', '5', '250.00', 'Peça delicada'),
('4', 'Anel Ajustável', '30', '50.00', 'Vários tamanhos'),
('5', 'Tornozeleira Fina', '25', '30.00', 'Aço inox resistente'),
('6', 'Tiara de Strass', '18', '45.00', 'Para festas'),
('7', 'Choker de Couro', '40', '25.00', 'Moda jovem'),
('8', 'Bracelete Dourado', '12', '90.00', 'Peça exclusiva'),
('9', 'Broche Vintage', '10', '60.00', 'Estilo retrô'),
('10', 'Colar Longo', '8', '110.00', 'Cristal autêntico');

insert into venda (id_cliente, id_produto, quantidade) values
('1', '5', '9'),
('2', '6', '8'),
('3', '7', '7'),
('4', '8', '6'),
('5', '5', '2'),
('6', '6', '1'),
('7', '4', '5'),
('8', '2', '2'),
('9', '9', '10'),
('10', '4', '1');

--view
create view view_vendas as
select v.id_cliente, c.nome, v.id_produto, p.titulo, v.quantidade
from venda v
join cliente c on v.id_cliente = c.id
join produtos p on v.id_produto = p.id;


create view view_produtos as
select p.id, p.titulo, p.preco, f.nome, f.cidade
from produtos p
join fornecedor f on p.id_fornecedor = f.id;


--select
select * from view_vendas;

select * from view_produtos;