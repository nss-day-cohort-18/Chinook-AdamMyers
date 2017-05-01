--Exercise 14
/*Provide a query that shows the # of invoices per country. HINT: GROUP BY*/
select Invoice.BillingCountry 'Country', count(Invoice.BillingCountry) '# of Invoices'
from Invoice
group by Invoice.BillingCountry