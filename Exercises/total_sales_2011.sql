--Exercise 9
/*What are the respective total sales for 2011*/
select sum(total) 'Total Sales 20011' from Invoice
where Invoice.InvoiceDate like '2011%';