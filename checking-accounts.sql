DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

CREATE TABLE accounts (
    ID              INT             PRIMARY KEY     AUTO_INCREMENT,
    account_holder  VARCHAR(20)     NOT NULL,
    balance         DECIMAL(10,2)   NOT NULL,
    fees            DECIMAL(8,2)    NOT NULL
);

CREATE TABLE transactions (
    ID              INT             PRIMARY KEY     AUTO_INCREMENT,
    amount          DECIMAL(10,2)   NOT NULL,
    txn_type        VARCHAR(10)     NOT NULL,
    account_ID      INT             NOT NULL,
    FOREIGN KEY (account_ID) REFERENCES accounts (ID)
);

INSERT INTO accounts VALUES
	(1, 'Gary Henderson', 8888.00, 250.00),
	(2, 'Meagan Hansen', 5444.00, 175.00),
	(3, 'Nick Law', 3333.00, 88.00),
	(4, 'Yelena Lapina', 3322.00, 88.00);

INSERT INTO transactions VALUES
	(1, 500.00, 'Deposit', 3),
	(2, -200.00, 'Withdrawal', 4),
	(3, 200.00, 'Deposit', 4),
	(4, 248.00, 'Deposit', 1);

