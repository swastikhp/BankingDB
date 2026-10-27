SHOW databases;
create database bankingDB;
use bankingDB;
create table customer (
CustomerID INT,
firstname varchar(50),
lastname varchar(50),
email varchar (100),
phone varchar (10)
);
desc customers;
select * from customers;
alter table customers
add AccountCreation date;
create table Accounts (
AccountID INT,
AccountType varchar(20),
Balance decimal (10.2)
);
show tables;
select * from Accounts;
create table Transactions (
TransactionsId int,
transactionsDate date,
Ammount decimal (10.2),
TransactionType varchar (20)
);