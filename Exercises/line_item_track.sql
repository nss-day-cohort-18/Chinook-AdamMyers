--Exercise 12
/* Provide a query that includes the purchased track 
name with each invoice line item.*/
select InvoiceLine.InvoiceLineId, Track.Name
from InvoiceLine, Track
where InvoiceLine.TrackId = Track.TrackId
order by InvoiceLine.InvoiceLineId