--Exercise 26
/*Provide a query that shows the top 3 best selling artists.*/
select Artist.Name, count(Artist.ArtistId) as Sold
from Artist
inner join Album
on Artist.ArtistId = Album.ArtistId
inner join Track
on Album.AlbumId = Track.AlbumId
inner join InvoiceLine
on Track.TrackId = InvoiceLine.TrackId
group by Artist.Name
order by Sold desc
limit 3
