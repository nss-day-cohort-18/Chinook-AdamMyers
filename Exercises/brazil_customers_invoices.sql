--Exercise 3
/*Provide a query showing the Invoices of customers who are from Brazil. 
The resultant table should show the customer's full name, Invoice ID,
Date of the invoice and billing country.*/
select Customer.FirstName, Customer.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry 
from Customer, Invoice
where Customer.Country = 'Brazil'
and Customer.CustomerId = Invoice.CustomerId;