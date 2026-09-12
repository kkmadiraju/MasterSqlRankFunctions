# SQL Subqueries

A **subquery** (also called an inner query or nested query) is a query within another SQL query. Here are the main types and examples:

## 1. **Subquery in WHERE Clause**

```sql
-- Find all employees with salary greater than the average
SELECT name, salary
FROM employees
WHERE salary > (
  SELECT AVG(salary) FROM employees
);
```

## 2. **Subquery in FROM Clause**

```sql
-- Use subquery result as a table
SELECT department, avg_salary
FROM (
  SELECT department, AVG(salary) as avg_salary
  FROM employees
  GROUP BY department
) AS dept_avg
WHERE avg_salary > 50000;
```

## 3. **Subquery in SELECT Clause**

```sql
-- Get employee count for each department
SELECT 
  name,
  salary,
  (SELECT COUNT(*) FROM employees e2 WHERE e2.department = e1.department) as dept_count
FROM employees e1;
```

## 4. **IN Subquery**

```sql
-- Find employees in departments that have more than 5 people
SELECT name, department
FROM employees
WHERE department IN (
  SELECT department 
  FROM employees 
  GROUP BY department 
  HAVING COUNT(*) > 5
);
```

## 5. **EXISTS Subquery**

```sql
-- Find employees who have completed projects
SELECT name
FROM employees e
WHERE EXISTS (
  SELECT 1 FROM projects p 
  WHERE p.employee_id = e.id
);
```

## 6. **Correlated Subquery**

```sql
-- Find employees earning more than their department's average
SELECT name, salary, department
FROM employees e1
WHERE salary > (
  SELECT AVG(salary) 
  FROM employees e2 
  WHERE e2.department = e1.department
);
```

**Key Points:**
- Subqueries execute from inner to outer
- Single-row subqueries use `=`, `>`, `<`
- Multiple-row subqueries use `IN`, `EXISTS`
- Correlated subqueries reference the outer query

Would you like help with a specific SQL subquery problem?
