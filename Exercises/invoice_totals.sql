 --Exercise 7
 /*Provide a query that shows the Invoice Total, Customer name, 
 Country and Sale Agent name for all invoices and customers.*/
 select Invoice.Total, Customer.FirstName 'Cust FName', Customer.LastName 'Cust LName', Customer.Country, Employee.FirstName 'Rep FName', Employee.LastName 'Rep LName'
 from Invoice, Customer, Employee
 where Employee.EmployeeId = Customer.SupportRepId
 and Customer.CustomerId = Invoice.CustomerId;