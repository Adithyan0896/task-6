Database: Office
This SQL script creates and demonstrates a sample database named office, which consists of two tables: Departments and Employees. It includes data insertion and example queries illustrating the use of scalar subqueries, correlated subqueries, and subqueries with IN, EXISTS, and = operators.

 Database and Tables
1️ Create Database
CREATE DATABASE office;
USE office;
This command creates the office database and sets it as the current database context.

2️ Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
This table stores department details, with DepartmentID as the primary key.

3️ Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
This table stores employee details, including a foreign key DepartmentID referencing the Departments table.

 Sample Data Insertion
Departments
INSERT INTO Departments VALUES (1, 'data scientist');
INSERT INTO Departments VALUES (2, 'IT');
INSERT INTO Departments VALUES (3, 'cloud computing');

Employees
INSERT INTO Employees VALUES (101, 'kishore', 50000, 1);
INSERT INTO Employees VALUES (102, 'raj', 60000, 2);
INSERT INTO Employees VALUES (103, 'kumar', 55000, 2);
INSERT INTO Employees VALUES (104, 'shiva', 45000, 1);
INSERT INTO Employees VALUES (105, 'jai', 70000, 3);

 Query Examples
1️ Scalar Subquery
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
Purpose:
Retrieves employees whose salary is higher than the average salary of all employees.
Feature: Uses a scalar subquery returning a single value (average salary).

2️ Correlated Subquery
SELECT Name, Salary, DepartmentID
FROM Employees E1
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees E2
    WHERE E2.DepartmentID = E1.DepartmentID
);
Purpose:
Finds employees who have the highest salary within their respective department.
Feature: Uses a correlated subquery dependent on each row of the outer query.

3️ Subquery with IN
SELECT Name, DepartmentID
FROM Employees
WHERE DepartmentID IN (
    SELECT DISTINCT DepartmentID
    FROM Employees
    WHERE Salary > 60000
);
Purpose:
Lists employees working in departments where at least one employee earns more than 60,000.
Feature: Uses IN with a subquery returning multiple department IDs.

4️ Subquery with EXISTS
SELECT DepartmentName
FROM Departments D
WHERE EXISTS (
    SELECT 1
    FROM Employees E
    WHERE E.DepartmentID = D.DepartmentID
);
Purpose:
Displays departments that have at least one employee assigned.
Feature: Uses EXISTS to check for the presence of related records.

5️ Subquery with =
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees);
Purpose:
Finds employees who have the minimum salary in the organization.
Feature: Uses = with a scalar subquery returning the minimum salary.
