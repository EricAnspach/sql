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
    (1, 'APPL', 'Apple Computer Inc.', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '408-996-1010', 'info@apple.com', 1),
	(2, 'DOPP', 'JB Doppes Lumber Co.', '1001 Dalton Ave', 'Cincinnati', 'OH', '45203', '513-421-4850', 'doppes@gfuse.net', 1),
    (3, 'MICR', 'Microcenter', '11755 Mosteller Rd', 'Sharonville', 'OH', '45241', '513-782-8500', 'info@Microcenter.com', 1),
    (4, 'PLAZ', 'Plaza Art Materials', '230 W. McMillan St', 'Cincinnati', 'OH', '45219', '513-861-0667', 'plaza@plazaart.com', 1),
    (5, 'AMAZ', 'Amazon', '410 Terry Ave N', 'Seattle', 'WA', '98109', '206-266-1000', 'jeff.bezos@amazon.com', 1),
    (6, 'BEST', 'Best Buy', '7601 Penn Ave S', 'Richfield', 'MN', '55423', '612-291-1000', 'support@bestbuy.com', 1);
    
INSERT INTO Product
    (ID, VendorID, PartNumber, Name, Price, Unit, Photopath)
VALUES
    (1, 1, 'A1921', 'iPhoneX Max', 1099.99, 'Each', NULL),
	(2, 1, 'A1660', 'iPhone 7', 449.00, 'Each', NULL),
    (3, 1, 'A1673', 'iPad 9.7 in', 329.00, 'Each', NULL),
    (4, 1, 'MK452LL/A', 'iMac', 2299.00, 'Each', NULL),
    (5, 2, 'DC9091', 'Dewalt Cordless Ni-CD 14.4 V Battery', 18.95, 'Each', NULL),
    (6, 2, 'DCD940KX', 'DeWalt Cordless Drill 18V', 48.90, 'Each', NULL),
    (7, 2, '280058', 'National Nail Drywall Screw #6x1', 4.89, 'Pound', NULL),
    (8, 3, '1850', 'Microsoft Wireless Mouse', 12.99, 'Each', NULL),
    (9, 3, '15-da0031nr', 'HP 15.6" Laptop Computer', 579.99, 'Each', NULL),
    (10, 3, '64038010', 'Swiss Gear Mainframe Laptop Briefcase', 59.99, 'Each', NULL),
    (11, 4, '344081', 'Koh-I-Noor Gioconda 24 Piece Pencil Set', 37.45, 'Each', NULL),
    (12, 4, '175353', 'Strathmore 300 Series Bristol Pad Smooth 11x14', 13.75, 'Pad', NULL),
    (13, 5, 'J701M/DS', 'Samsung Galaxy J7 Neo', 137.97, 'Each', NULL),
    (14, 5, 'WF-3720', 'Epson Workforce Pro Color Inkjet Printer', 149.99, 'Each', NULL),
    (15, 6, '1543', 'Nikon - D750 DSLR Camera', 1399.99, 'Each', NULL),
    (16, 6, '910-005131', 'Logitech - MX Master 2S Wireless Laser Mouse', 72.99, 'Each', NULL);

    -- create A USER AND GRANT PRIVILEGES TO THAT USER
create USER IF NOT EXISTS prs_user@localhost identified BY 'sesame';
GRANT select, insert, delete, update on prs.* to prs_user@localhost;