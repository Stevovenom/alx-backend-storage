# 0x00. MySQL advanced

<h1>Creating TABLES with Constraints</h1>
<p><strong>Constraints</strong> are rules enforced on data in tables to ensure data integrity. The common constrains include <code>PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK</code> and <code>DEFAULT</code>.</p><br>
<strong>Example of creating a table with constraints</strong><br>
<code>
CREATE TABLE employees (
  employee_id INT AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL, --the fields are mandatory to be filled
  last_name VARCHAR(50) NOT  NULL,
  department_id INT,
  hire_date DATE NOT NULL,
  salary DECIMAL(10, 2) CHECK (salary > 0), --check ensure salary is greater than 0
  PRIMARY KEY(employee_id),
  FOREIGN KEY (department_id) REFERENCES  departments(department_id), --enforces the department relationship
  UNIQUE (first_name, last_name) --ensure no duplicate employee names
);
  
</code><br>

<h1>Queries optimization by adding INDEXES</h1>
<p>An index is used to speed up searches  and queries in a table. Without indexes, MySQL has to scan the entire tables for queries, which is somehow slow for datasets.</p><br>
<p>Indexes allow faster lookup by creating  sorted copies of specified columns. eg</p><br>
<code>

  CREATE INDEX idx_last_name ON employees(last_name);
</code><br>

<p>This creates an index on the last_name column in the employees table, making searches based on last_name faster.</p><br>
<p>In contrast without queries it would be</p><br>
<code>

  SELECT * FROM employees WHERE last_name="smith";
</code><br>

<h1>Stored Procedures and Functions</h1>
<p>A <strong>stored procedure</strong> is a set of SQL statements that can be excuted  as a unit. It allows for complex operations , reuse of code, and better performance in certain cases.</p><br>
<p><strong>A function </strong> is similar but it must return a single value.</p><br>

<h2>EXAMPLE of Stored procedure</h2><br>
<code>
  DELIMETER //
  CREATE PROCEDURE GetEmployeeByID(IN emp_id INT)
  BEGIN
    SELECT * FROM employees WHERE employee_id = emp_id;
  END //
  DELIMETER;
</code><br>
<p>And it is being called by</p><br>
<code>

  CALL GetEmployeeByID(1);
</code><br>

<h2>EXAMPLE of function</h2>
<code>

  DELIMETER //
  CREATE FUNCTION CalculateBonus(salary DECIMAL(10, 2)) RETURNS DECIMAL(10, 2)
  BEGIN
    RETURN salary * 0.10;
  END //
  DELIMETER
</code><br>
<p>And it is being called with </p><br>
<code>

  SELECT CalculateBonus(5000);
</code><br>

<h1>VIEWS in MySQL</h1>
<p>A view is a virtual table based on results of a SELECT query.</p>
<p>They are useful for simplifying complex queries, providing specific data to users without exposing the entire table, and improving readability.</p><br>

<h2>Example</h2>
<code>

  CREATE VIEW high_salary_employees AS
  SELECT first_name, last_name, salary
  FROM employees
  WHERE  salary > 10000
</code><br>
<p>This creates a view that shows employees with a salary of over 10,000</p><br>

<h1>Triggers in MySQL</h1>
<p>This is a piece of code that is automatically triggered in response to certain events e.g <strong><code>INSERT, UPDATE, DELETE</strong> on a table. This are useful for enforcing business rules, auditing or maintaining consistency.</p><br>

<h2>Creating a trigger</h>
<code>

  CREATE TRIGGER update_salary BEFORE UPDATE ON employees
  FOR EACH ROW
  BEGIN
    IF NEW.salary < 0 THEN
      SET NEW.salary = 0; --prevents negative salary
    END IF;
  END;
</code><br>
<p>This trigger prevents any salary from being updated to a negative value.</p><br>

# Generally
1. Constraints ensure that data in your database remains consistent and valid.<br>
2. Indexes improve query performance.<br>
3. Stored procedures and functions allow reusable, maintainable logic in your database.<br>
4. Views simplify data access and complex queries.<br>
5. Triggers automatically execute actions based on table events, adding control and automation.<br>

# RESOURCES
1. <a href="https://intranet.alxswe.com/rltoken/8w9di_hk19DIMSBEV3EayQ">MySQL cheatsheet</a><br>
2. <a href="https://intranet.alxswe.com/rltoken/2GJbZ48zRPA70o2YhTdH7g">MySQL Performance: How To Leverage MySQL Database Indexing</a><br>
3. <a href="https://intranet.alxswe.com/rltoken/K180X2OCzb6gzPngjn-EIg">Stored Procedure</a><br>
4. <a href="https://intranet.alxswe.com/rltoken/cJ1qA4o-rRm4rWIsqYKSZg">Triggers</a><br>
5. <a href="https://intranet.alxswe.com/rltoken/vHg1z3UAOcWMvOt8xZHeiA">Views</a><br>
6. <a href="https://intranet.alxswe.com/rltoken/g-c1m6iljScpi4LeqxBRqQ">Functions and Operators</a><br>
7. <a href="https://intranet.alxswe.com/rltoken/gLVwKjQfRL0Jr_nWqAS7VQ">Trigger Syntax and Examples</a><br>
8. <a href="https://intranet.alxswe.com/rltoken/X789nJ22H6HVh1uCQPl0lg">Create Table statement</a><br>
9. <a href="https://intranet.alxswe.com/rltoken/mfrWMt1KL3NHXblJykMgZg">CREATE PROCEDURE and CREATE FUNCTION Statements</a><br>
10. <a href="https://intranet.alxswe.com/rltoken/oCu8Rg9WfKyF4BhTt8dZGQ">CREATE Index statement</a><br>
11. <a href="https://intranet.alxswe.com/rltoken/FEZNlZFKZmD1ISnLINkCwQ">CREATE VIEW statement</a><br>
