 --Exercise 21
 /*Provide a query that shows the count of customers assigned to each sales agent.*/
 select Employee.FirstName || ' ' || Employee.LastName 'Sales Agent', count(Customer.SupportRepId) '# Assigned Customers'
 from Employee, Customer
 where Employee.EmployeeId = Customer.SupportRepId
 group by Employee.EmployeeId
 