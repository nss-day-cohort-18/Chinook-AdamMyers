 --Exercise 8
 /*How many Invoices were there in 2009*/
 select count(InvoiceId) 'Count 2009' from Invoice
 where Invoice.InvoiceDate like '2009%';