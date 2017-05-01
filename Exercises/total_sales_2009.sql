--Exercise 9
/*What are the respective total sales for 2009*/
select sum(total) 'Total Sales 2009' from Invoice
where Invoice.InvoiceDate like '2009%';