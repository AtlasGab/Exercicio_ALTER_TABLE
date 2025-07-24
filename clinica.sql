create database Clinica_Banco;

use Clinica_Banco;

create table Clinica(
  numero int primary key,
  nome varchar(30) not null
);
create index idx_clinica
on Clinica(nome);

create table Medico (
  crm char(10) primary key unique not null,
  nome varchar(50) not null,
  especialidade varchar(20),
  cpf char(11) not null unique,
  
  numClinica int,
  foreign key(numClinica) references Clinica(numero)
        on delete restrict
        on update cascade
);

alter table Medico
drop primary key;

alter table Medico
add primary key (cpf);

create index idx_nomeMed 
on Medico(nome);


create table Conta(
  id primary key auto_increment,
  numero int not null,
  agencia int not null,
  saldo int,
  
  crm char(10) unique not null,
  foreign key(crm) references Medico(crm)
        on delete restrict
        on update cascade
);
create unique index idx_numero_agencia
on Conta(numero, agencia);
