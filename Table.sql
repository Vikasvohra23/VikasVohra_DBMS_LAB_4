
-- Create the supplier table
CREATE TABLE supplier (
    SUPP_ID INT PRIMARY KEY, -- Supplier ID (Primary Key)
    SUPP_NAME VARCHAR(50) NOT NULL, -- Supplier Name
    SUPP_CITY VARCHAR(50) NOT NULL, -- Supplier City
    SUPP_PHONE VARCHAR(50) NOT NULL -- Supplier Phone
);

-- Create the customer table
CREATE TABLE customer (
    CUS_ID INT PRIMARY KEY, -- Customer ID (Primary Key)
    CUS_NAME VARCHAR(20) NOT NULL, -- Customer Name
    CUS_PHONE VARCHAR(10) NOT NULL, -- Customer Phone
    CUS_CITY VARCHAR(30) NOT NULL, -- Customer City
    CUS_GENDER CHAR -- Customer Gender
);

-- Create the category table
CREATE TABLE category (
    CAT_ID INT PRIMARY KEY, -- Category ID (Primary Key)
    CAT_NAME VARCHAR(20) NOT NULL -- Category Name
);

-- Create the product table
CREATE TABLE product (
    PRO_ID INT PRIMARY KEY, -- Product ID (Primary Key)
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy', -- Product Name with a default value
    PRO_DESC VARCHAR(60), -- Product Description
    CAT_ID INT, -- Category ID (Foreign Key)
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID) -- Foreign Key constraint to category table
);

-- Create the supplier_pricing table
CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY, -- Pricing ID (Primary Key)
    PRO_ID INT, -- Product ID (Foreign Key)
    SUPP_ID INT, -- Supplier ID (Foreign Key)
    SUPP_PRICE INT DEFAULT 0, -- Supplier Price with a default value of 0
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID), -- Foreign Key constraint to product table
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID) -- Foreign Key constraint to supplier table
);

-- Create the order_table
CREATE TABLE order_table (
    ORD_ID INT PRIMARY KEY, -- Order ID (Primary Key)
    ORD_AMOUNT INT NOT NULL, -- Order Amount
    ORD_DATE DATE NOT NULL, -- Order Date
    CUS_ID INT, -- Customer ID (Foreign Key)
    PRICING_ID INT, -- Pricing ID (Foreign Key)
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID), -- Foreign Key constraint to customer table
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID) -- Foreign Key constraint to supplier_pricing table
);

-- Create the rating table
CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY, -- Rating ID (Primary Key)
    ORD_ID INT, -- Order ID (Foreign Key)
    RAT_RATSTARS INT NOT NULL, -- Rating in stars
    FOREIGN KEY (ORD_ID) REFERENCES order_table(ORD_ID) -- Foreign Key constraint to order_table
);
