 --Exercise 8
 /*How many Invoices were there in 2011*/
 select count(InvoiceId) 'Count 2011' from Invoice
 where Invoice.InvoiceDate like '2011%';