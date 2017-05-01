--Exercise 13
/*Provide a query that includes the purchased track name 
AND artist name with each invoice line item.*/
select InvoiceLine.InvoiceLineId 'Line ID', Track.Name 'Track Name', Artist.Name 'Artist Name'
from InvoiceLine, Track, Album, Artist
where Track.TrackId = InvoiceLine.TrackId
and Track.AlbumId = Album.AlbumId
and Album.ArtistId = Artist.ArtistId
order by InvoiceLine.InvoiceLineId