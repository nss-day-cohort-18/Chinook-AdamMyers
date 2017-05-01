 --Exercise 19
 /*Which sales agent made the most in sales in 2009?
Hint: Use the MAX function on a subquery.*/
select Employee.FirstName || ' ' || Employee.LastName '2009 Sales Rep', max (HighestSale.Sales) 'Sales'
from Employee, (    select sum(Invoice.Total) as Sales
                                from Employee, Customer, Invoice
                                where Employee.EmployeeId = Customer.SupportRepId
                                and Customer.CustomerId = Invoice.CustomerId
                                and Invoice.InvoiceDate like '2009%'
                                group by Employee.EmployeeId    ) as HighestSale