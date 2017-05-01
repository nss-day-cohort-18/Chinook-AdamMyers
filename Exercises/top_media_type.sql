--Exercise 27
/*Provide a query that shows the most purchased Media Type.*/
select MediaType.Name, count(MediaType.MediaTypeId) as Sold
from MediaType
inner join Track
on MediaType.MediaTypeId = Track.MediaTypeId
inner join InvoiceLine
on Track.TrackId = InvoiceLine.TrackId
group by MediaType.MediaTypeId
order by Sold desc