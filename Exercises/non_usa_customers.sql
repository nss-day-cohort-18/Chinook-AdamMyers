--Exercise 1
--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select FirstName, LastName, CustomerId, Country from Customer
where Customer.Country != 'USA';