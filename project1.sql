CREATE DATABASE project
USE project
CREATE TABLE Category(CategoryID INT PRIMARY KEY IDENTITY(1,1),CategoryName VARCHAR(30) NOT NULL UNIQUE,Descriptionn VARCHAR(200))
CREATE TABLE Supplier(SupplierID int PRIMARY KEY IDENTITY(1,1),SupplierName VARCHAR(50) NOT NULL,Phone BIGINT UNIQUE,EMail VARCHAR(50) UNIQUE)
CREATE TABLE Customer(CustomerID int PRIMARY KEY IDENTITY(1,1),CustomerName VARCHAR(50) NOT NULL,Phone BIGINT UNIQUE,EMail VARCHAR(50) UNIQUE,
Address VARCHAR(200))
CREATE TABLE Warehouse( WarehouseID INT PRIMARY KEY IDENTITY(1,1), WarehouseName VARCHAR(100) NOT NULL, Location VARCHAR(100));
CREATE TABLE Product( ProductID INT PRIMARY KEY IDENTITY(1,1), ProductName VARCHAR(100) NOT NULL, Price DECIMAL(10,2) CHECK(Price > 0),
    QuantityInStock INT CHECK(QuantityInStock >= 0), CategoryID INT, SupplierID INT, WarehouseID INT,
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID), FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY(WarehouseID) REFERENCES Warehouse(WarehouseID));
CREATE TABLE Employee( EmployeeID INT PRIMARY KEY IDENTITY(1,1), EmployeeName VARCHAR(100), Department VARCHAR(50), Salary DECIMAL(10,2));
CREATE TABLE Orders( OrderID INT PRIMARY KEY IDENTITY(1,1), OrderDate DATE NOT NULL, TotalAmount DECIMAL(10,2),CustomerID INT,
    EmployeeID INT,FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID), FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID));
CREATE TABLE Order_Detail( OrderID INT, ProductID INT, Quantity INT CHECK(Quantity > 0), PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID), FOREIGN KEY(ProductID) REFERENCES Product(ProductID));
CREATE TABLE Payment(PaymentID INT PRIMARY KEY IDENTITY(1,1), OrderID INT, PaymentDate DATE, PaymentMethod VARCHAR(50),
    PaymentAmount DECIMAL(10,2),FOREIGN KEY(OrderID) REFERENCES Orders(OrderID));
SELECT * FROM INFORMATION_SCHEMA.TABLES;
EXEC sp_rename 'Category.Descriptionn','Description','COLUMN';
INSERT INTO Category(CategoryName, Description) VALUES
('Electronics','Electronic Devices'),
('Mobiles','Smartphones and Accessories'),
('Laptops','Laptop Computers'),
('Furniture','Office and Home Furniture'),
('Books','Educational and Story Books'),
('Fashion','Clothing and Apparel'),
('Sports','Sports Equipment'),
('Home Appliances','Household Appliances'),
('Toys','Kids Toys'),
('Groceries','Daily Essentials');
INSERT INTO Supplier(SupplierName, Phone, Email) VALUES
('ABC Suppliers','9876543210','abc@gmail.com'),
('XYZ Traders','9876543211','xyz@gmail.com'),
('Tech World','9876543212','techworld@gmail.com'),
('Global Supply','9876543213','global@gmail.com'),
('Smart Distributors','9876543214','smart@gmail.com'),
('Prime Traders','9876543215','prime@gmail.com'),
('Elite Suppliers','9876543216','elite@gmail.com'),
('Future Retail','9876543217','future@gmail.com'),
('Mega Supply','9876543218','mega@gmail.com'),
('Universal Traders','9876543219','universal@gmail.com');
INSERT INTO Warehouse(WarehouseName, Location) VALUES
('Warehouse A','Chennai'),
('Warehouse B','Coimbatore'),
('Warehouse C','Madurai'),
('Warehouse D','Salem'),
('Warehouse E','Trichy'),
('Warehouse F','Erode'),
('Warehouse G','Tirunelveli'),
('Warehouse H','Vellore'),
('Warehouse I','Thanjavur'),
('Warehouse J','Hosur');
INSERT INTO Product (ProductName, Price, QuantityInStock, CategoryID, SupplierID, WarehouseID) VALUES
('Samsung Galaxy M14',15000,50,2,1,1),
('iPhone 14',65000,20,2,2,1),
('Dell Inspiron',55000,15,3,3,2),
('HP Pavilion',60000,10,3,4,2),
('Office Chair',5000,40,4,5,3),
('Study Table',7000,25,4,6,3),
('Java Programming Book',600,100,5,7,4),
('Cricket Bat',1500,60,7,8,5),
('Football',800,70,7,9,5),
('Washing Machine',25000,12,8,10,6),
('Microwave Oven',12000,18,8,1,6),
('Teddy Bear',700,80,9,2,7),
('LED TV',35000,14,1,3,8),
('Bluetooth Speaker',2000,45,1,4,9),
('Rice Bag 25kg',1400,100,10,5,10);
INSERT INTO Customer(CustomerName, Phone, Email, Address) VALUES 
('Arun Kumar','9000000001','arun@gmail.com','Chennai'),
('Priya S','9000000002','priya@gmail.com','Coimbatore'),
('Rahul M','9000000003','rahul@gmail.com','Madurai'),
('Divya K','9000000004','divya@gmail.com','Salem'),
('Karthik R','9000000005','karthik@gmail.com','Trichy'),
('Anitha P','9000000006','anitha@gmail.com','Erode'),
('Vijay T','9000000007','vijay@gmail.com','Chennai'),
('Sneha L','9000000008','sneha@gmail.com','Vellore'),
('Manoj B','9000000009','manoj@gmail.com','Hosur'),
('Keerthana V','9000000010','keerthana@gmail.com','Thanjavur');
INSERT INTO Employee(EmployeeName, Department, Salary) VALUES ('Ramesh','Sales',30000), ('Suresh','Sales',32000), ('Ganesh','Inventory',35000),
('Harish','Inventory',33000), ('Lavanya','Support',28000), ('Meena','Support',29000), ('Kiran','Accounts',40000), ('Ajith','Accounts',42000),
('Deepa','HR',37000),('Naveen','HR',36000);
INSERT INTO Orders(OrderDate, TotalAmount, CustomerID, EmployeeID) VALUES
('2026-01-01',15000,11,1),
('2026-01-02',65000,12,2),
('2026-01-03',55000,13,3),
('2026-01-04',5000,14,4),
('2026-01-05',7000,15,5),
('2026-01-06',600,16,6),
('2026-01-07',1500,17,7),
('2026-01-08',25000,18,8),
('2026-01-09',35000,19,9);
INSERT INTO Order_Detail (OrderID, ProductID, Quantity) VALUES
(3,1,1),
(4,2,1),
(5,3,1),
(6,5,1),
(7,6,1),
(8,7,1),
(9,8,1),
(10,10,1),
(11,13,1);
INSERT INTO Payment (OrderID, PaymentDate, PaymentMethod, PaymentAmount) VALUES
(3,'2026-01-03','Net Banking',55000),
(4,'2026-01-04','Cash',5000),
(5,'2026-01-05','UPI',7000),
(6,'2026-01-06','Card',600),
(7,'2026-01-07','Cash',1500),
(8,'2026-01-08','UPI',25000),
(9,'2026-01-09','Card',35000),
(10,'2026-01-10','Net Banking',2000),
(11,'2026-01-01','UPI',15000);
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Product WHERE Price > 1000;
SELECT * FROM Customer WHERE Address LIKE '%Chennai%';
UPDATE Product SET Price = 25000 WHERE ProductID = 1;
DELETE FROM Customer WHERE CustomerID NOT IN ( SELECT CustomerID FROM Orders);
SELECT * FROM Orders ORDER BY OrderDate;
SELECT OrderDate, SUM(TotalAmount) AS TotalSales FROM Orders GROUP BY OrderDate;
SELECT ProductID,SUM(Quantity) AS TotalSold FROM Order_Detail GROUP BY ProductID;
SELECT CustomerID FROM Orders GROUP BY CustomerID HAVING COUNT(*) > 3;
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity FROM Orders o INNER JOIN Customer c ON o.CustomerID=c.CustomerID
INNER JOIN Order_Detail od ON o.OrderID=od.OrderID INNER JOIN Product p ON od.ProductID=p.ProductID;
SELECT s.SupplierName, p.ProductName FROM Supplier s INNER JOIN Product p ON s.SupplierID=p.SupplierID;
SELECT * FROM Product WHERE Price > ( SELECT AVG(Price) FROM Product );
SELECT * FROM Customer WHERE CustomerID NOT IN ( SELECT CustomerID FROM Orders);
SELECT TOP 1 ProductID, SUM(Quantity) TotalSold FROM Order_Detail GROUP BY ProductID ORDER BY TotalSold DESC;
CREATE FUNCTION fn_Discount (
    @Amount DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Amount * 0.10;
END;
SELECT dbo.fn_Discount(10000) AS Discount;
CREATE PROCEDURE PlaceOrder
(
    @OrderDate DATE,
    @Amount DECIMAL(10,2),
    @CustomerID INT,
    @EmployeeID INT
)
AS
BEGIN
INSERT INTO Orders (OrderDate,TotalAmount, CustomerID,EmployeeID) VALUES ( @OrderDate, @Amount, @CustomerID, @EmployeeID);
END;
EXEC PlaceOrder '2026-06-20', 15000,14,1;
CREATE PROCEDURE GetOrderCount
(
    @CustomerID INT,
    @TotalOrders INT OUTPUT
)
AS
BEGIN
SELECT @TotalOrders=COUNT(*) FROM Orders WHERE CustomerID=@CustomerID;
END;

DECLARE @Count INT;
EXEC GetOrderCount 1, @Count OUTPUT;
SELECT @Count AS count;

CREATE TRIGGER trg_UpdateStock
ON Order_Detail
AFTER INSERT
AS
BEGIN
UPDATE Product SET QuantityInStock= QuantityInStock-i.Quantity FROM Product p INNER JOIN inserted i ON p.ProductID=i.ProductID;
END;

CREATE TRIGGER trg_RestoreStock
ON Order_Detail
AFTER DELETE
AS
BEGIN UPDATE Product SET QuantityInStock= QuantityInStock+d.Quantity FROM Product p INNER JOIN deleted d ON p.ProductID=d.ProductID;
END;

CREATE VIEW MonthlySales AS
SELECT YEAR(OrderDate) AS YearNo, MONTH(OrderDate) AS MonthNo, SUM(TotalAmount) AS TotalSales FROM Orders GROUP BY YEAR(OrderDate),MONTH(OrderDate);

SELECT * FROM MonthlySales;

CREATE INDEX IX_ProductName ON Product(ProductName);
