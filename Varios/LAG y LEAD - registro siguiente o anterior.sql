-----------------------------------------------------------------------------------
--		CARGAR INFORMACION DE PRUEBA 
-----------------------------------------------------------------------------------

drop table if exists employees
go
-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Insert 10 records of sample data into the employees table
INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'John Smith', 101, 55000.00),
    (2, 'Jane Doe', 102, 60000.00),
    (3, 'Bob Johnson', 101, 48000.00),
    (4, 'Alice Brown', 103, 62000.00),
    (5, 'Eve Wilson', 102, 58000.00),
    (6, 'Michael Lee', 104, 53000.00),
    (7, 'Sarah Garcia', 101, 56000.00),
    (8, 'David Martinez', 103, 59000.00),
    (9, 'Jennifer Davis', 102, 57000.00),
    (10, 'William Jackson', 104, 51000.00);

-----------------------------------------------------------------------------------
--		PROMEDIO DE SALARIO DEL EMPLEADO ANTERIOR/SIGUIENTE
-----------------------------------------------------------------------------------

SELECT [employee_id]
      ,[employee_name]
      ,[department_id]
      ,[salary]
	  ,LAG([salary]) over (order by [employee_id]) as 'Salario employee anterior'
	  ,LEAD([salary]) over (order by [employee_id]) as 'Salario employee siguiente'
FROM [LocalTest].[dbo].[employees]
