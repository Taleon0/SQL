---------------------------------------------------------------------------------------------------
--		CREACION DE TABLAS DEL PROCESO
---------------------------------------------------------------------------------------------------

drop table if exists Employees
go
-- Create the Employees table with JoiningDate and Order columns
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT,
    Salary DECIMAL(10, 2),
    JoiningDate DATETIME,
    [Order] INT NULL
);

-- Insert sample data into the Employees table with duplicates
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID, Salary, JoiningDate, [Order])
VALUES
    (1, 'John Smith', NULL, 75000.00, '2022-01-15 09:00:00', NULL),
    (2, 'Jane Doe', NULL, 80000.00, '2022-02-20 10:30:00', NULL),
    (3, 'Alice Johnson', 1, 60000.00, '2022-03-10 08:45:00', NULL),
    (4, 'Bob Williams', 1, 62000.00, '2022-03-12 09:15:00', NULL),
    (5, 'John Smith', NULL, 75000.00, '2022-04-05 11:00:00', NULL),
    (6, 'Eve Anderson', 2, 72000.00, '2022-04-07 10:30:00', NULL),
    (7, 'Chris Davis', 2, 68000.00, '2022-05-15 09:45:00', NULL),
    (8, 'Alice Johnson', 1, 60000.00, '2022-05-20 14:15:00', NULL), 
    (9, 'David Lee', 4, 55000.00, '2022-06-10 08:00:00', NULL),  
    (10, 'Emma Wilson', 4, 57000.00, '2022-06-15 07:30:00', NULL);

---------------------------------------------------------------------------------------------------

select * from Employees

---------------------------------------------------------------------------------------------------
--	CREAMOS UNA TABLA VACIA CON LAS MISMAS CARACTERISTICAS QUE LA EMPLOYEES
---------------------------------------------------------------------------------------------------

select top 0 * into Employees_UniqueRecords from Employees
go
select * from Employees_UniqueRecords

---------------------------------------------------------------------------------------------------
--	INSERTAR REGISTROS NO DUPLICADOS EN LA TABLA CREADA (GUARDA EL QUE TENGA LA FECHA MAS ANTIGUA)
---------------------------------------------------------------------------------------------------

;with cte
as
(
select *, ROW_NUMBER() over(partition by EmployeeName order by JoiningDate) as RN from Employees
)
insert into Employees_UniqueRecords
select EmployeeId, EmployeeName, ManagerId, Salary, JoiningDate,[Order] from cte where rn=1
go

---------------------------------------------------------------------------------------------------
--	ACTUALIZAR LA COLUMNA ORDER SEGUN EL NUMERO (1 --> PRIMER REGISTRO, 2--> SEGUNDO REGISTRO DEL MISMO EMPLOYEE NAME)
---------------------------------------------------------------------------------------------------

;with cte
as
(
select *, ROW_NUMBER() over(partition by EmployeeName order by JoiningDate) as RN from Employees
)
update cte
set [Order] = RN

select * from Employees
