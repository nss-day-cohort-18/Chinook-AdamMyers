--Exercise 11
/*Looking at the InvoiceLine table, provide a query that COUNTs the 
number of line items for each Invoice. HINT: GROUP BY*/
select count(InvoiceLineId) 'Number of Line Items', InvoiceLine.InvoiceId 
from InvoiceLine
group by InvoiceId