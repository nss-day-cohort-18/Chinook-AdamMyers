 --Exercise 20
 /*Which sales agent made the most in sales over all?*/
 select Employee.FirstName || ' ' || Employee.LastName 'Sales Rep', max (HighestSale.Sales) 'Sales'
from Employee, (    select sum(Invoice.Total) as Sales
                                from Employee, Customer, Invoice
                                where Employee.EmployeeId = Customer.SupportRepId
                                and Customer.CustomerId = Invoice.CustomerId
                                group by Employee.EmployeeId    ) as HighestSale
 