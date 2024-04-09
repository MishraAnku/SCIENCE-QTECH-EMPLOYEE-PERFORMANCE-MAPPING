-- Assuming 'employees' table schema
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100)
);

-- Assuming 'performance_reviews' table schema
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    performance_score DECIMAL(5,2),
    feedback TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Sample data insertion for demonstration
INSERT INTO employees (employee_id, employee_name, department) VALUES
(1, 'John Doe', 'Research'),
(2, 'Jane Smith', 'Engineering'),
(3, 'Alice Johnson', 'Marketing');

INSERT INTO performance_reviews (review_id, employee_id, review_date, performance_score, feedback) VALUES
(1, 1, '2024-01-01', 4.5, 'Exceeded expectations.'),
(2, 1, '2024-01-01', 3.8, 'Met expectations.'),
(3, 2, '2024-01-01', 4.2, 'Performed well.'),
(4, 2, '2024-01-01', 3.9, 'Met expectations.'),
(5, 3, '2024-01-01', 3.6, 'Satisfactory performance.');

-- SQL Query to map employee performance
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    AVG(pr.performance_score) AS average_performance_score
FROM 
    employees e
LEFT JOIN 
    performance_reviews pr ON e.employee_id = pr.employee_id
GROUP BY 
    e.employee_id, e.employee_name, e.department;
