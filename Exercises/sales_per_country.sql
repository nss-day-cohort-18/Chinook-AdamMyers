 --Exercise 22
 /*Provide a query that shows the total sales per country.*/
 select Invoice.BillingCountry 'Billing Country', sum(Invoice.Total) 'Sales'
 from Invoice
 group by Invoice.BillingCountry
 