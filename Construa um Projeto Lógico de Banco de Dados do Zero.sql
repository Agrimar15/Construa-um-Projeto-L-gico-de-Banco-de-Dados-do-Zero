-- criação do banco
-- create database oficina;
use oficina;

-- tabela clientes
create table clientes (
  idcliente int auto_increment primary key,
  nome varchar(100),
  cpf char(11) unique not null,
  telefone char(11),
  endereco varchar(255)
);

-- tabela veiculos
create table veiculos (
  idveiculo int auto_increment primary key,
  idcliente int,
  placa char(7) unique not null,
  modelo varchar(50),
  ano int,
  constraint fk_cliente_veiculo foreign key (idcliente) references clientes(idcliente)
);

-- tabela mecanicos
create table mecanicos (
  idmecanico int auto_increment primary key,
  nome varchar(100),
  especialidade varchar(50),
  contato char(11)
);

-- tabela ordens_servico
create table ordens_servico (
  idordem int auto_increment primary key,
  idcliente int,
  idveiculo int,
  data_abertura date,
  status enum('aberta','em andamento','concluída','cancelada') default 'aberta',
  descricao varchar(255),
  valor float,
  constraint fk_ordem_cliente foreign key (idcliente) references clientes(idcliente),
  constraint fk_ordem_veiculo foreign key (idveiculo) references veiculos(idveiculo)
);

-- tabela pecas
create table pecas (
  idpeca int auto_increment primary key,
  nome varchar(100),
  preco float,
  estoque int
);

-- tabela ordem_peca
create table ordem_peca (
  idordem int,
  idpeca int,
  quantidade int,
  primary key (idordem, idpeca),
  constraint fk_ordem foreign key (idordem) references ordens_servico(idordem),
  constraint fk_peca foreign key (idpeca) references pecas(idpeca)
);

-- tabela ordem_servico_mecanico
create table ordem_servico_mecanico (
  idordem int,
  idmecanico int,
  primary key (idordem, idmecanico),
  constraint fk_ordem_mecanico foreign key (idordem) references ordens_servico(idordem),
  constraint fk_mecanico foreign key (idmecanico) references mecanicos(idmecanico)
);

-- população das tabelas

insert into clientes (nome, cpf, telefone, endereco) values
('Ana Silva','12345678901','81999990001','Rua das Flores, 10'),
('Bruno Souza','23456789012','81999990002','Av. Paulista, 200'),
('Carla Oliveira','34567890123','81999990003','Rua Verde, 45'),
('Diego Pereira','45678901234','81999990004','Rua Azul, 78'),
('Elisa Costa','56789012345','81999990005','Rua Amarela, 12'),
('Felipe Almeida','67890123456','81999990006','Av. Brasil, 300'),
('Gabriela Ferreira','78901234567','81999990007','Rua Central, 90'),
('Henrique Mendes','89012345678','81999990008','Rua Norte, 150'),
('Isabela Martins','90123456789','81999990009','Rua Sul, 220'),
('João Ramos','01234567890','81999990010','Av. Atlântica, 500');

insert into veiculos (idcliente, placa, modelo, ano) values
(1,'ABC1234','Fiat Uno',2010),
(2,'DEF5678','Honda Civic',2018),
(3,'GHI9012','Toyota Corolla',2020),
(4,'JKL3456','Chevrolet Onix',2019),
(5,'MNO7890','Ford Ka',2015),
(6,'PQR2345','Volkswagen Golf',2017),
(7,'STU6789','Hyundai HB20',2021),
(8,'VWX0123','Jeep Renegade',2022),
(9,'YZA4567','Renault Sandero',2016),
(10,'BCD8901','Peugeot 208',2019);

insert into mecanicos (nome, especialidade, contato) values
('Carlos Mecânico','Motor','81988880001'),
('Marcos Lima','Freios','81988880002'),
('Fernanda Rocha','Suspensão','81988880003'),
('Pedro Alves','Elétrica','81988880004'),
('Juliana Santos','Troca de óleo','81988880005'),
('Ricardo Melo','Transmissão','81988880006'),
('Sofia Costa','Ar-condicionado','81988880007'),
('Tiago Ramos','Pintura','81988880008'),
('Luciana Dias','Lataria','81988880009'),
('André Nogueira','Diagnóstico','81988880010');

insert into ordens_servico (idcliente, idveiculo, data_abertura, status, descricao, valor) values
(1,1,'2025-11-01','concluída','Troca de óleo e filtro',200),
(2,2,'2025-11-02','em andamento','Revisão completa',1200),
(3,3,'2025-11-03','aberta','Troca de pastilhas de freio',400),
(4,4,'2025-11-04','cancelada','Alinhamento e balanceamento',150),
(5,5,'2025-11-05','concluída','Troca de bateria',600),
(6,6,'2025-11-06','em andamento','Troca de correia dentada',800),
(7,7,'2025-11-07','concluída','Troca de amortecedores',1000),
(8,8,'2025-11-08','aberta','Reparo no ar-condicionado',700),
(9,9,'2025-11-09','concluída','Troca de pneus',1600),
(10,10,'2025-11-10','em andamento','Revisão elétrica',500);

insert into pecas (nome, preco, estoque) values
('Óleo 5W30',50,100),
('Filtro de óleo',30,80),
('Pastilha de freio',200,50),
('Bateria 60Ah',400,20),
('Correia dentada',150,40),
('Amortecedor dianteiro',250,30),
('Pneu aro 15',400,60),
('Compressor ar-condicionado',600,10),
('Farol LED',300,25),
('Filtro de ar',40,70);

insert into ordem_peca (idordem, idpeca, quantidade) values
(1,1,4),
(1,2,1),
(3,3,1),
(5,4,1),
(6,5,1),
(7,6,2),
(9,7,4),
(8,8,1),
(10,9,2),
(2,10,1);

insert into ordem_servico_mecanico (idordem, idmecanico) values
(1,5),
(2,10),
(3,2),
(4,1),
(5,4),
(6,1),
(7,3),
(8,7),
(9,2),
(10,4);

select nome, cpf from clientes;
select modelo, ano from veiculos;

select * from ordens_servico where status = 'concluída';
select * from pecas where estoque < 20;

select nome, preco, preco * 1.1 as preco_com_imposto from pecas;
select valor, valor * 0.9 as valor_com_desconto from ordens_servico;

select * from clientes order by nome asc;
select * from ordens_servico order by valor desc;

select idcliente, avg(valor) as media_valor
from ordens_servico
group by idcliente
having avg(valor) > 500;

-- clientes e seus veículos
select c.nome, v.modelo, v.placa
from clientes c
join veiculos v on c.idcliente = v.idcliente;

-- ordens de serviço e mecânicos
select o.idordem, o.status, m.nome as mecanico
from ordens_servico o
join ordem_servico_mecanico om on o.idordem = om.idordem
join mecanicos m on om.idmecanico = m.idmecanico;

-- ordens de serviço e peças utilizadas
select o.idordem, p.nome, op.quantidade
from ordens_servico o
join ordem_peca op on o.idordem = op.idordem
join pecas p on op.idpeca = p.idpeca;




