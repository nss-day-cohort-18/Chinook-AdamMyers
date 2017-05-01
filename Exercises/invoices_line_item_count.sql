--Exercise 17
/*Provide a query that shows all Invoices but includes the # of invoice line items.*/
select Invoice.InvoiceId 'invoice id', count(InvoiceLine.InvoiceId) '# of invoice line items'
from Invoice, InvoiceLine
where InvoiceLine.InvoiceId = Invoice.InvoiceId
group by InvoiceLine.InvoiceId