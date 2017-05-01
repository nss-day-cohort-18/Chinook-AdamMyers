--Exercise 10
/*Looking at the InvoiceLine table, provide a query that COUNTs the number 
of line items for Invoice ID 37.*/
select count(InvoiceLineId) 'Line Item #' from InvoiceLine
where InvoiceLine.InvoiceId = 37