--Exercise 6
/*Provide a query that shows the invoices associated with each sales agent.
 The resultant table should include the Sales Agent's full name.*/
 select Employee.FirstName, Employee.LastName, Invoice.InvoiceId
 from Employee, Customer, Invoice
 where Invoice.CustomerId = Customer.CustomerId
 and Customer.SupportRepId = Employee.EmployeeId
 order by Invoice.InvoiceId;