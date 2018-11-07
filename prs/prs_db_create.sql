-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create the user table
CREATE TABLE user (
    ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
    UserName            VARCHAR(20)    NOT NULL,
    Password            VARCHAR(10)    NOT NULL,
    FirstName           VARCHAR(20)    NOT NULL,
    LastName            VARCHAR(20)    NOT NULL,
    PhoneNumber         VARCHAR(12)    NOT NULL,
    Email               VARCHAR(75)    NOT NULL,
    IsReviewer          BIT(1)         NOT NULL,
    IsAdmin             BIT(1)         NOT NULL,
    IsActive            TINYINT(1)     DEFAULT 1    NOT NULL,
    DateCreated         DATETIME       DEFAULT CURRENT_TIMESTAMP    NOT NULL,
    DateUpdated         DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UpdatedByUser       INT            DEFAULT 1    NOT NULL,

    CONSTRAINT uname UNIQUE (UserName)
);



CREATE TABLE vendor (
    ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
    Code                VARCHAR(10)    NOT NULL,
    Name                VARCHAR(255)   NOT NULL,
    Address             VARCHAR(255)   NOT NULL,
    City                VARCHAR(255)   NOT NULL,
    State               VARCHAR(2)     NOT NULL,
    Zip                 VARCHAR(5)     NOT NULL,
    PhoneNumber         VARCHAR(12)    NOT NULL,
    Email               VARCHAR(100)   NOT NULL,
    IsPreApproved       TINYINT(1)     NOT NULL,
    IsActive            BIT(1)         DEFAULT 1    NOT NULL,
    DateCreated         DATETIME       DEFAULT CURRENT_TIMESTAMP    NOT NULL,
    DateUpdated         DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UpdatedByUser       INT            DEFAULT 1    NOT NULL,

    CONSTRAINT vcode UNIQUE (Code)
);

CREATE TABLE purchaserequest (
    ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
    UserID              INT            NOT NULL,
    Desription          VARCHAR(100)   NOT NULL,
    Justification       VARCHAR(255)   NOT NULL,
    DateNeeded          DATE           NOT NULL,
    DeliveryMode        VARCHAR(25)    NOT NULL,
    Status              VARCHAR(20)    NOT NULL     DEFAULT 'NEW',
    Total               DECIMAL(10, 2) NOT NULL,
    SubmittedDate       DATETIME,
    ReasonForRejection  VARCHAR(100)   NOT NULL,
    IsActive            BIT(1)         DEFAULT 1    NOT NULL,
    DateCreated         DATETIME       DEFAULT CURRENT_TIMESTAMP    NOT NULL,
    DateUpdated         DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UpdatedByUser       INT            DEFAULT 1    NOT NULL,

    FOREIGN KEY (UserID) REFERENCES user(ID)
);

CREATE TABLE product (
    ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
    VendorID            INT            NOT NULL,
    PartNumber          VARCHAR(50)    NOT NULL,
    Name                VARCHAR(150)   NOT NULL,
    Price               DECIMAL(10, 2) NOT NULL,
    Unit                VARCHAR(255),
    Photopath           VARCHAR(255),
    IsActive            BIT(1)         DEFAULT 1    NOT NULL,
    DateCreated         DATETIME       DEFAULT CURRENT_TIMESTAMP    NOT NULL,
    DateUpdated         DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UpdatedByUser       INT            DEFAULT 1    NOT NULL,

    FOREIGN KEY (VendorID) REFERENCES vendor (ID),
    CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber)
);

CREATE TABLE purchaserequestlineitem (
    ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
    PurchaseRequestID   INT            NOT NULL,
    ProductID           INT            NOT NULL,
    Quantity            INT            NOT NULL,
    IsActive            BIT(1)         DEFAULT 1    NOT NULL,
    DateCreated         DATETIME       DEFAULT CURRENT_TIMESTAMP    NOT NULL,
    DateUpdated         DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UpdatedByUser       INT            DEFAULT 1    NOT NULL,

    FOREIGN KEY (ProductID) REFERENCES product (ID),
    FOREIGN KEY (PurchaseRequestID) REFERENCES purchaserequest (ID),
    CONSTRAINT req_pdt UNIQUE (PurchaseRequestID, ProductID)
);

INSERT INTO User
    (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin, UpdatedByUser)
VALUES
    (1, 'system', 'sesame', 'system', 'system', '999-999-9999', 'system@test.com', 1, 1, 1),
	(2, 'eanspach', 'sesame', 'Eric', 'Anspach', '999-999-9999', 'eric.j.anspach@gmail.com', 1, 1, 1);
    
INSERT INTO Vendor
    (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, IsPreapproved)
VALUES
    (1, 'OFFI', 'Office Inc.', '123 Main St', 'Cincinnati', 'OH', 45201, 999-999-9999, 'test@test.com', 1),
	(2, 'SUPP', 'Supplies Inc.', '123 Main St', 'Cincinnati', 'OH', 45201, 999-999-9999, 'test@test.com', 1);
    
INSERT INTO Product
    (ID, VendorID, PartNumber, Name, Price, Unit, Photopath)
VALUES
    (1, 1, 00000, 'Widget', 1.99, 'Each', NULL),
	(2, 2, 99999, 'Pencil', 0.99, 'Dozen', NULL);