--Pranav Chauhan
--Q1:
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2),
    dept_id INT REFERENCES department(dept_id)
);

INSERT INTO department VALUES
(1, 'IT'),
(2, 'Sales'),
(3, 'HR');

INSERT INTO employee VALUES
(101, 'Aman', 90000, 1),
(102, 'Neha', 70000, 1),
(103, 'Raj', 50000, 1),
(104, 'Priya', 80000, 2),
(105, 'Karan', 60000, 2),
(106, 'Riya', 40000, 2),
(107, 'Mohit', 75000, 3),
(108, 'Simran', 55000, 3);

select d.dept_name , e.emp_name , e.salary
from department d
join employee e
on d.dept_id = e.dept_id
where e.salary>(
SELECT AVG(ee.salary)
    FROM employee ee
    WHERE ee.dept_id = e.dept_id
)
AND e.dept_id IN (
    SELECT dept_id
    FROM employee
    GROUP BY dept_id
    HAVING COUNT(*) >= 3
)
;
