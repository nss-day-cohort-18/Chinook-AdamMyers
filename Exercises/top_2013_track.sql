--Exercise 24
/*Provide a query that shows the most purchased track of 2013.*/
select aggregateData.Name, aggregateData.Number
from        (   select Track.Name as Name, count(Track.Name) as Number
                    from Track
                    left join InvoiceLine
                    on Track.TrackId = InvoiceLine.TrackId
                    left join Invoice
                    on Invoice.InvoiceId = InvoiceLine.InvoiceId
                    where Invoice.InvoiceDate between '2013-01-01' and '2013-12-31'
                    group by Track.Name
                    order by count(Track.Name) desc ) as aggregateData,
                (   select count(InvoiceLine.TrackId) as Quantity
                    from InvoiceLine
                    group by InvoiceLine.TrackId
                    order by Quantity desc
                    limit 1     ) as Compare
where aggregateData.Number = Compare.Quantity
