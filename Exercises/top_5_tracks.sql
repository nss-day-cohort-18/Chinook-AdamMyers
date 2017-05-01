--Exercise 25
/*Provide a query that shows the top 5 most purchased tracks over all.*/
select Track.Name, count(InvoiceLine.TrackId) as NumberSold
from Track
left join InvoiceLine
on Track.TrackId = InvoiceLine.TrackId
group by Track.TrackId
order by NumberSold desc
limit 5
