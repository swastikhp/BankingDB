SHOW databases;
create database bankingDB;
use bankingDB;
create table customers (
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
AccountId INT,
AccountType varchar(20),
Balance decimal (10,2)
);
desc accounts;

show tables ;
select * from Accounts ;
create table Transactions (
TransactionsId int,
TransactionsDate date,
Amount decimal (10,2),
TransactionsType varchar(20)
);
desc transactions;

select * from Transactions;
drop table customer;
create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar (15)
);
desc branches;

create table AccountBranches (
AssignmentDate date
);
desc accountbranches;

create table Loans (
LoanID int,
LoanAmount Decimal (10,2),
InterestRate Decimal (5,2),
StartDate date,
EndDate date
);
desc loans;

alter table customers
add constraint pk_customer_id primary key ( CustomerID );

alter table Transactions
add constraint pk_Transaction_id primary key ( TransactionsId );

alter table Branches
add constraint pk_Branch_id primary key ( BranchID );

alter table Loans
add constraint pk_Loan_id primary key ( LoanID );

alter table Accounts
add constraint pk_account_id primary key ( AccountId );