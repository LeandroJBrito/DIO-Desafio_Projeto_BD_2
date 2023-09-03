-- criação do BD para o cenário de uma oficina

create database Oficina;
use Oficina;

drop database Oficina;
-- criar tabela cliente
create table cliente(
		idcliente int auto_increment primary key,
        CPF char(11) not null,
        nome varchar (45) not null,
        telefone_DDD char(11) not null,
        constraint unique_cpf_client unique (CPF)
);

-- inserir dados cliente (idcliente, CPF, nome, telefone_DDD)
insert into cliente(idcliente, CPF, nome, telefone_DDD)
values 	('1','12332145622','Seya de Pegasus','11923233344'),
		('2','12312344422','Shyriu de Dragão','1194526178'),
        ('4','22212354555','Yoga de Cisne','11956178290'),
        ('5','54555678975','Shun de Andromeda','11956781234'),
		('6','67812345690','Ikky de Fenix','11956784234');
        
-- criar tabela veiculo

create table veiculo(
		idveiculo int auto_increment,
        idcliente int not null,
        placa char(8) not null,
        modelo varchar(20),
		constraint pk_veiculos primary key (idveiculo, idcliente),
		constraint fk_veiculo_cliente foreign key (idveiculo) references cliente(idcliente)
);

-- inserir dados veiculo (idveiculo, idcliente, placa, modelo)
insert into veiculo(idveiculo, idcliente, placa, modelo)
values 	('1','1','met07p82','HB20'),
		('2','2','dra09g56','Corolla'),
        ('3','3','gel07i90','Civic'),
        ('4','4','and07e11','New Beatle'),
        ('5','5','Fen10x11','Maverick');
        
        
-- criar tabela ordemServiço
create table ordemServiço(
		idserviço int auto_increment,
        idFuncionario int not null,
		idcliente int,
        idveiculo int,
		serviçoRealizado enum('Revisão','Alinhamento','balanceamento','Garantia') default 'Revisão',
        dataServiço	date not null,
        constraint pk_ordemServiço primary key (idserviço, idcliente, idveiculo, idFuncionario),
        constraint fk_ordemServiço_cliente foreign key (idcliente) references cliente(idcliente),
        constraint fk_ordemServiço_veiculo foreign key (idveiculo) references veiculo(idveiculo)
);

-- inserir dados ordemServiço (idserviço, idFuncionario, idcliente, idveiculo, serviçoRealizado, dataServiço)
insert into ordemServiço (idserviço, idFuncionario, idcliente, idveiculo, serviçoRealizado, dataServiço)
values 	('3','1','1','1','balanceamento','2023-09-01'),
		('3','1','2','2','balanceamento','2023-08-11'),
		('2','2','3','3','Alinhamento','2023-08-11'),
        ('1','2','4','4','Revisão','2023-08-21'),
		('4','1','5','5','Garantia','2023-09-03');

-- criar tabela funcionario
create table if not exists funcionario;

create table funcionario(
		idFuncionario int not null,
        Fnome varchar(20) not null,
        CPF char(11) not null,
        função varchar(15),
		constraint pk_funcionario primary key (idFuncionario),
        constraint unique_cpf_funcionario unique (CPF)
);

-- inserir dados funcionario (idFuncionario, Fnome, CPF, função)
insert into funcionario (idFuncionario, Fnome, CPF, função)
values 	('1','Joao chaves','12243223556','Mecanico Sr'),
		('2','Jose solda','22245678098','Mecanico jr'),
		('3','Jonas Cash','34576589322','Faturista');

-- mostrar tabela funcionario
desc funcionario;

-- criar tabela pagamento
create table pagamento(
		idserviço int,
        idFuncionario int not null,
		idcliente int,
        idveiculo int,
        valorserviço float not null,
        formaPagamento enum('Cartão de crédito','Cartão de débito','Pix'),
        constraint pk_serviço_cliente primary key (idserviço, idcliente, idveiculo, idFuncionario),
        constraint fk_serviço_veiculo foreign key (idveiculo) references veiculo(idveiculo)
);

-- inserir dados pagamento (idserviço, idFuncionario, idcliente, idveiculo, valorserviço, formaPagamento)
insert into pagamento (idserviço, idFuncionario, idcliente, idveiculo, valorserviço, formaPagamento)
values 	('3','1','1','1','100.00','pix'),
		('3','1','2','2','100.00','Cartão de crédito'),
		('2','2','3','3','150.00','Cartão de crédito'),
        ('1','2','4','4','200.00','Cartão de débito'),
		('4','1','5','5','0','pix');
        
        
-- mostrar tabelas
show tables;
show databases;

select * from cliente;

-- informações de clientes

select c.nome
from cliente where c.nome = 'Ikky';

-- contar clientes
select count(*) from cliente;

    

