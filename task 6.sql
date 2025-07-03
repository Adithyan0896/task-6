Create database office;
use office;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample data into Departments
INSERT INTO Departments VALUES (1, 'data scientist');
INSERT INTO Departments VALUES (2, 'IT');
INSERT INTO Departments VALUES (3, 'cloud computing');

-- Insert sample data into Employees
INSERT INTO Employees VALUES (101, 'kishore', 50000, 1);
INSERT INTO Employees VALUES (102, 'raj', 60000, 2);
INSERT INTO Employees VALUES (103, 'kumar', 55000, 2);
INSERT INTO Employees VALUES (104, 'shiva', 45000, 1);
INSERT INTO Employees VALUES (105, 'jai', 70000, 3);

-------------------------------------------------------------
-- 1️⃣ Scalar subquery example
-------------------------------------------------------------
-- Find all employees who earn more than the average salary
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-------------------------------------------------------------
-- 2️⃣ Correlated subquery example
-------------------------------------------------------------
-- Find employees whose salary is the highest in their department
SELECT Name, Salary, DepartmentID
FROM Employees E1
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees E2
    WHERE E2.DepartmentID = E1.DepartmentID
);

-------------------------------------------------------------
-- 3️⃣ Subquery with IN
-------------------------------------------------------------
-- List employees who work in departments that have at least one employee with salary > 60000
SELECT Name, DepartmentID
FROM Employees
WHERE DepartmentID IN (
    SELECT DISTINCT DepartmentID
    FROM Employees
    WHERE Salary > 60000
);

-------------------------------------------------------------
-- 4️⃣ Subquery with EXISTS
-------------------------------------------------------------
-- List departments that have at least one employee
SELECT DepartmentName
FROM Departments D
WHERE EXISTS (
    SELECT 1
    FROM Employees E
    WHERE E.DepartmentID = D.DepartmentID
);

-------------------------------------------------------------
-- 5️⃣ Subquery with =
-------------------------------------------------------------
-- Find employees whose salary equals the minimum salary in the company
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

