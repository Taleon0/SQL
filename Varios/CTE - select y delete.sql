---------------------------------------------------------------------------------------------------
--		CREACION DE TABLAS DEL PROCESO
---------------------------------------------------------------------------------------------------
drop table if exists Employees
go
-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT,
    Salary DECIMAL(10, 2)
);

-- Insert sample data into the Employees table
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID, Salary)
VALUES
    (1, 'CEO', NULL, 100000.00),
    (2, 'John Smith', 1, 75000.00),
    (3, 'Jane Doe', 1, 80000.00),
    (4, 'Alice Johnson', 2, 60000.00),
    (5, 'Bob Williams', 2, 62000.00),
    (6, 'Eve Anderson', 3, 72000.00),
    (7, 'Chris Davis', 3, 68000.00),
    (8, 'Grace Moore', 2, 64000.00),
    (9, 'David Lee', 5, 55000.00),
    (10, 'Emma Wilson', 5, 57000.00);
go
---------------------------------------------------------------------------------------------------

drop table if exists Products
go
-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert sample data into the Products table with duplicates
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
    (1, 'Laptop', 'Electronics', 999.99),
    (2, 'Smartphone', 'Electronics', 699.99),
    (3, 'Tablet', 'Electronics', 299.99),
    (4, 'Laptop', 'Electronics', 999.99), -- Duplicate
    (5, 'Desktop PC', 'Electronics', 799.99),
    (6, 'Keyboard', 'Accessories', 49.99),
    (7, 'Mouse', 'Accessories', 19.99),
    (8, 'Tablet', 'Electronics', 299.99), -- Duplicate
    (9, 'Smart TV', 'Electronics', 799.99),
    (10, 'Headphones', 'Accessories', 129.99);

---------------------------------------------------------------------------------------------------
--		CONSULTA CON CTE - DELETE
---------------------------------------------------------------------------------------------------

-- MEJORES 5 SALARIOS

with cte
as
(
select *, ROW_NUMBER() over (order by Salary desc) as Rn from Employees
)
select EmployeeID, EmployeeName, ManagerID, Salary from cte where rn<=5

--	ELIMINA PRODUCTOS DUPLICADOS (PRODUCT NAME)
with cte
as
(
select *, ROW_NUMBER() over(partition by productName order by ProductId) as Rn from Products
)
delete from cte where rn>1