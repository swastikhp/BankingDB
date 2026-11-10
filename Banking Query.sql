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

alter table customers
add DateOfBirth date;

alter table customers  modify phone varchar (20);

alter table accounts  add constraint chk_MiniBalance   check ( Balance >= 1000 );

drop table accountbranches;

alter table accounts  add CustomerID int; 
alter table accounts
add constraint fk_accounts_customerId
foreign key ( CustomerID )
references customers ( CustomerID );
desc accounts;  

alter table customers  modify firstname varchar (50) not null;
desc customers;
alter table customers  modify DateOfBirth date not null;
alter table customers  modify phone varchar (20) not null;

alter table customers  add constraint uq_email unique (Email);
alter table customers  add constraint uq_Phone unique (Phone);

alter  table customers  alter column lastname  set default "N/A";

alter table accounts add BranchID int; 
alter table accounts
add constraint fk_accounts_branchId
foreign key ( BranchId )
references branches ( BranchID );
desc accounts;  

alter table transactions add AccountId int;
alter table transactions
add constraint fk_transactions_accountsId
foreign key ( AccountId )
references accounts ( AccountId );
desc transactions;

alter table loans add CustomerID int; 
alter table loans
add constraint fk_loans_accountsId
foreign key ( CustomerID )
references customers ( CustomerID );
desc loans;

create table KYC (
KycID int primary key,
AdhaarNo varchar(12) not null,
PanNo varchar(10) not null,
CustomerID int not null,
constraint fk_Customers
foreign key (CustomerID ) references customers ( CustomerId )
);
select * from KYC;
desc KYC;

insert into customers
values (101,'Amit','Gupta','amit@gmail.com','1234567890','2024-01-15','1998-05-10');
select * from customers;

insert into customers (CustomerID,firstname,lastname,email,phone,AccountCreation,DateOfBirth)
values (102,'Aryan','Gupta','aryan@gmail.com','1284467566','2025-07-15','1995-03-05');

insert into customers
value (103,'Aditya','Shahu','Adi@gmail.com','8446588158','2026-8-21','2024-5-12');

insert into customers
value (104,'Swastik', 'Gupta' , 'Swastik@gmail.com', '8446215495' , '2024-6-22' , '2006-8-15' );

insert into customers
values (105, 'Sneha', 'Joshi', 'sneha@gmail.com', '2226664449' , '2020-5-8', '2000-2-6' ),
(106, 'Karan' , 'Mehta', 'Karan@gmailcom' , '8886661112' , '2018-6-15', '2001-10-2');

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');
select * from branches;

INSERT INTO Accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);
insert into accounts
value (1006, 'Savings',17000,106,3);
select * from accounts;

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);
insert into transactions
value (6, '2025-01-18',5000, 'Withdrawal',1006);
select * from transactions;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);
insert into loans
value (504,200000,5.9,'2024-04-20','2032-5-20',106);
select * from loans;


update customers
set DateOfBirth = '2006-11-30'
where CustomerID = 103;
select * from customers;

update customers
set lastname = 'Mishra' 
where CustomerID = 101;

select * from branches;
update branches
set BranchAddress = 'Civil Lines, Nagpur', 
BranchPhone = '0712-566999'
where BranchID = 1;

select * from KYC;
insert into kyc
values  (201, '888844446666' ,'KKK856YYT', 101 ),
		(202, '555599998888', 'KILLO99UN', 103 ),
        (203, '123645897526', 'BYTH455LO', 104 ),
        (204, '126534895276', 'BVUT526AD', 106 );
Delete From kyc where KycID = 202;

select phone,firstname,email from customers;

-- find filter account having balance > 20000
select AccountId,Balance,CustomerID from accounts
where balance < 20000;

-- find all accounts having saving acc and balance > 20000
SELECT 
    *
FROM
    accounts
WHERE
    AccountType = 'Savings'
        AND balance > 20000;

-- find record of customerid 104
select * from customers
where CustomerID = 104;

-- Using NOT Operator for Savings account opposite 2 methods
SELECT 
    *
FROM
    accounts
WHERE not
    AccountType = 'Savings';

select * from accounts
where AccountType <> 'Savings';   

-- checking IN operator in loans
select * from loans
where InterestRate in (8.5 , 9);

-- using BETWEEN operator in loans
select * from loans
where InterestRate between 7.8 and 9;

-- find all customer having balance 20k to 60k
select * from accounts
where Balance between 20000 and 60000;

-- find current account and balance having 20k to 60k
select * from accounts
where AccountType = 'Current' and Balance between 20000 and 60000;

-- LIKE Operator
select * from customers
where lastname like '%a' ;

select * from customers
where firstname like 'a%' ;

select * from customers
where firstname like 'a____' ;

select * from accounts;

-- sort accounts table as per Balance in descending order
select * from accounts
order by Balance;

select * from accounts
order by Balance desc;


select * from accounts
order by AccountType desc, Balance desc;

-- BRANCHES  (NULL address / NULL phone; branch 6 has no accounts)
-- ---------------------------------------------------------
INSERT INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');

-- CUSTOMERS  (NULL lastname / email / Phone / dates)
-- ---------------------------------------------------------
INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');

-- CUSTOMERS  (NULL lastname / email / Phone / dates)
-- ---------------------------------------------------------
INSERT INTO customers (customerID, FirstName, lastname, email, Phone, DateOfBirth) VALUES

(107, 'Vikram', 'Singh',    NULL,                     '9876543216',  '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     5477899999,          '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218',        '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219',  '1994-5-6'),
(111, 'Suresh', 'Patil',    NULL,                     1236589745,          '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221',  '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222',  '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     1456975632,          '1988-10-28');

select * from customers;

-- ACCOUNTS  (NULL AccountType / Balance / CustomerID / BranchID)
-- Customers 114 and 115 intentionally have NO account.
-- ---------------------------------------------------------
INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES

(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);

-- KYC  (table was empty; only some customers have KYC)
-- No KYC for 108, 110, 111, 113, 114, 115
-- ---------------------------------------------------------
INSERT INTO kyc (kycid, AdhaarNo, panNo, customerid) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);

-- LOANS  (NULL InterestRate / LoanAmount / EndDate / CustomerID)
-- ---------------------------------------------------------
INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES

(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);

-- TRANSACTIONS  (NULL Amount / TransactionType / AccountID / TransactionDate)
-- Accounts 1008, 1009, 1012, 1014 have no transactions.
-- ---------------------------------------------------------
INSERT INTO transactions (TransactionsID, TransactionsDate, Amount, TransactionsType, AccountID) VALUES

(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);

-- DISTINCT Clause
select distinct AccountType from accounts;
select distinct TransactionsId from transactions;

-- LIMIT Clause
select * from transactions
limit 3;

select * from transactions
order by Amount desc
limit 3;

-- find top 2 transactions having highest withdrawl amount
select * from transactions
where TransactionsType = "withdrawal"
order by Amount desc
Limit 2;

-- OFFSET Clause
select * from customers
limit 2 offset 5;

-- find the customer having 3rd highest loan amount
select * from loans;
select * from loans
order by LoanAmount desc
limit 1 offset 2;

-- IN and NOT IN Clause
select * from transactions
where TransactionsType not in ("Deposit", "withdrawal");

select * from transactions
where TransactionsType in ("Deposit", "withdrawal");

select * from customers;

-- IS NULL
select firstname, lastname, email from customers
where email is null;

select firstname, lastname, email from customers
where lastname is null;

select CustomerID,firstname, lastname, email,phone from customers
where email is null and phone is null;

-- CASE Statements
select loanAmount, LoanID, CustomerId,
Case
When LoanAmount >= 500000 Then "High Value Loan"
when LoanAmount >=200000 Then "Medium Value Loan"
Else "Low Value Loan"
End as Loancategory
From Loans;

