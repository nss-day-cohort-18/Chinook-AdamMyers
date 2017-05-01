--Exercise 4
/*Provide a query showing only the Employees who are Sales Agents.*/
select * from Employee
where Employee.Title like '%Sales%Agent%';