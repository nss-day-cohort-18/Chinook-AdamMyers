
--Exercise 1
--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select FirstName, LastName, CustomerId, Country from Customer
where Customer.Country != 'USA';

--Exercise 2
-- Provide a query only showing the Customers from Brazil.
select * from Customer
where Customer.Country = 'Brazil';

--Exercise 3
/*Provide a query showing the Invoices of customers who are from Brazil. 
The resultant table should show the customer's full name, Invoice ID,
Date of the invoice and billing country.*/
select Customer.FirstName, Customer.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry 
from Customer, Invoice
where Customer.Country = 'Brazil'
and Customer.CustomerId = Invoice.CustomerId;

--Exercise 4
/*Provide a query showing only the Employees who are Sales Agents.*/
select * from Employee
where Employee.Title like '%Sales%Agent%';

--Exercise 5
/*Provide a query showing a unique/distinct list of billing countries 
from the Invoice table.*/
select distinct BillingCountry from Invoice;

--Exercise 6
/*Provide a query that shows the invoices associated with each sales agent.
 The resultant table should include the Sales Agent's full name.*/
 select Employee.FirstName, Employee.LastName, Invoice.InvoiceId
 from Employee, Customer, Invoice
 where Invoice.CustomerId = Customer.CustomerId
 and Customer.SupportRepId = Employee.EmployeeId
 order by Invoice.InvoiceId;
 
 --Exercise 7
 /*Provide a query that shows the Invoice Total, Customer name, 
 Country and Sale Agent name for all invoices and customers.*/
 select Invoice.Total, Customer.FirstName 'Cust FName', Customer.LastName 'Cust LName', Customer.Country, Employee.FirstName 'Rep FName', Employee.LastName 'Rep LName'
 from Invoice, Customer, Employee
 where Employee.EmployeeId = Customer.SupportRepId
 and Customer.CustomerId = Invoice.CustomerId;
 
 --Exercise 8
 /*How many Invoices were there in 2009 and 2011?*/
 select count(InvoiceId) 'Count 2009' from Invoice
 where Invoice.InvoiceDate like '2009%';
 
 select count(InvoiceId) 'Count 2011' from Invoice
 where Invoice.InvoiceDate like '2011%';
 
 
--Exercise 9
/*What are the respective total sales for each of those years?*/
select sum(total) 'Total Sales 2009' from Invoice
where Invoice.InvoiceDate like '2009%';

select sum(total) 'Total Sales 20011' from Invoice
where Invoice.InvoiceDate like '2011%';


--Exercise 10
/*Looking at the InvoiceLine table, provide a query that COUNTs the number 
of line items for Invoice ID 37.*/
select count(InvoiceLineId) 'Line Item #' from InvoiceLine
where InvoiceLine.InvoiceId = 37

--Exercise 11
/*Looking at the InvoiceLine table, provide a query that COUNTs the 
number of line items for each Invoice. HINT: GROUP BY*/
select count(InvoiceLineId) 'Number of Line Items', InvoiceLine.InvoiceId 
from InvoiceLine
group by InvoiceId

--Exercise 12
/* Provide a query that includes the purchased track 
name with each invoice line item.*/
select InvoiceLine.InvoiceLineId, Track.Name
from InvoiceLine, Track
where InvoiceLine.TrackId = Track.TrackId
order by InvoiceLine.InvoiceLineId

--Exercise 13
/*Provide a query that includes the purchased track name 
AND artist name with each invoice line item.*/
select InvoiceLine.InvoiceLineId 'Line ID', Track.Name 'Track Name', Artist.Name 'Artist Name'
from InvoiceLine, Track, Album, Artist
where Track.TrackId = InvoiceLine.TrackId
and Track.AlbumId = Album.AlbumId
and Album.ArtistId = Artist.ArtistId
order by InvoiceLine.InvoiceLineId

--Exercise 14
/*Provide a query that shows the # of invoices per country. HINT: GROUP BY*/
select Invoice.BillingCountry 'Country', count(Invoice.BillingCountry) '# of Invoices'
from Invoice
group by Invoice.BillingCountry

--Exercise 15
/*Provide a query that shows the total number of tracks in each playlist. 
The Playlist name should be include on the resulant table.*/
select Playlist.Name 'Playlist Name', count(PlaylistTrack.PlaylistId) '# of Tracks'
from Playlist left join PlaylistTrack
on PlaylistTrack.PlaylistId = Playlist.PlaylistId
group by Playlist.PlaylistId

--Exercise 16
/*Provide a query that shows all the Tracks, but displays no IDs. 
The result should include the Album name, Media type and Genre.*/
select Track.Name, Album.Title, MediaType.Name, Genre.Name
from Album, MediaType, Genre, Track
where Track.AlbumId = Album.AlbumId
and Track.MediaTypeId = MediaType.MediaTypeId
and Track.GenreId = Genre.GenreId
order by Track.TrackId

--Exercise 17
/*Provide a query that shows all Invoices but includes the # of invoice line items.*/
select Invoice.InvoiceId 'invoice id', count(InvoiceLine.InvoiceId) '# of invoice line items'
from Invoice, InvoiceLine
where InvoiceLine.InvoiceId = Invoice.InvoiceId
group by InvoiceLine.InvoiceId
 
 --Exercise 18
 /* Provide a query that shows total sales made by each sales agent*/
 select Employee.FirstName || ' ' || Employee.LastName 'Full Name', sum(Invoice.Total) 'Total Sales'
 from Employee, Customer, Invoice
 where Employee.EmployeeId = Customer.SupportRepId
 and Customer.CustomerId = Invoice.CustomerId
 group by Employee.EmployeeId
 
 --Exercise 19
 /*Which sales agent made the most in sales in 2009?
Hint: Use the MAX function on a subquery.*/
select Employee.FirstName || ' ' || Employee.LastName '2009 Sales Rep', sum(Invoice.Total) as Sales
from Employee, Customer, Invoice
where Employee.EmployeeId = Customer.SupportRepId
 and Customer.CustomerId = Invoice.CustomerId
 and Invoice.InvoiceDate like '2009%'
 group by Employee.EmployeeId
 order by Sales desc
 limit 1
 
 select Employee.FirstName || ' ' || Employee.LastName '2009 Sales Rep',
        max ( (     select sum(Invoice.Total) as Sales
                        from Employee, Customer, Invoice
                        where Employee.EmployeeId = Customer.SupportRepId
                        and Customer.CustomerId = Invoice.CustomerId
                        and Invoice.InvoiceDate like '2009%'
                        group by Employee.EmployeeId
                        order by Sales desc )) as Sales
from Employee

select Employee.FirstName || ' ' || Employee.LastName '2009 Sales Rep', max (HighestSale.Sales) 'Sales'
from Employee, (    select sum(Invoice.Total) as Sales
                                from Employee, Customer, Invoice
                                where Employee.EmployeeId = Customer.SupportRepId
                                and Customer.CustomerId = Invoice.CustomerId
                                and Invoice.InvoiceDate like '2009%'
                                group by Employee.EmployeeId    ) as HighestSale
 
 
 --Exercise 20
 /*Which sales agent made the most in sales over all?*/
 select Employee.FirstName || ' ' || Employee.LastName 'Sales Rep', max (HighestSale.Sales) 'Sales'
from Employee, (    select sum(Invoice.Total) as Sales
                                from Employee, Customer, Invoice
                                where Employee.EmployeeId = Customer.SupportRepId
                                and Customer.CustomerId = Invoice.CustomerId
                                group by Employee.EmployeeId    ) as HighestSale
 
 --Exercise 21
 /*Provide a query that shows the count of customers assigned to each sales agent.*/
 select Employee.FirstName || ' ' || Employee.LastName 'Sales Agent', count(Customer.SupportRepId) '# Assigned Customers'
 from Employee, Customer
 where Employee.EmployeeId = Customer.SupportRepId
 group by Employee.EmployeeId
 
 --Exercise 22
 /*Provide a query that shows the total sales per country.*/
 select Invoice.BillingCountry 'Billing Country', sum(Invoice.Total) 'Sales'
 from Invoice
 group by Invoice.BillingCountry
 
 --Exercise 23
 /*Which country's customers spent the most?*/
 select Invoice.BillingCountry 'Billing Country', max(AllSales.TotalSales) 'Sales'
 from Invoice, (    select Invoice.BillingCountry as BillingCountry, sum(Invoice.Total) as TotalSales
                            from Invoice
                            group by Invoice.BillingCountry )  as AllSales
where Invoice.BillingCountry = AllSales.BillingCountry

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

--Exercise 25
/*Provide a query that shows the top 5 most purchased tracks over all.*/
select Track.Name, count(InvoiceLine.TrackId) as NumberSold
from Track
left join InvoiceLine
on Track.TrackId = InvoiceLine.TrackId
group by Track.TrackId
order by NumberSold desc
limit 5


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






 