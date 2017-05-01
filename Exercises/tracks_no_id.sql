--Exercise 16
/*Provide a query that shows all the Tracks, but displays no IDs. 
The result should include the Album name, Media type and Genre.*/
select Track.Name, Album.Title, MediaType.Name, Genre.Name
from Album, MediaType, Genre, Track
where Track.AlbumId = Album.AlbumId
and Track.MediaTypeId = MediaType.MediaTypeId
and Track.GenreId = Genre.GenreId
order by Track.TrackId