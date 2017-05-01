 --Exercise 18
 /* Provide a query that shows total sales made by each sales agent*/
 select Employee.FirstName || ' ' || Employee.LastName 'Full Name', sum(Invoice.Total) 'Total Sales'
 from Employee, Customer, Invoice
 where Employee.EmployeeId = Customer.SupportRepId
 and Customer.CustomerId = Invoice.CustomerId
 group by Employee.EmployeeId