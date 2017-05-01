 --Exercise 23
 /*Which country's customers spent the most?*/
 select Invoice.BillingCountry 'Billing Country', max(AllSales.TotalSales) 'Sales'
 from Invoice, (    select Invoice.BillingCountry as BillingCountry, sum(Invoice.Total) as TotalSales
                            from Invoice
                            group by Invoice.BillingCountry )  as AllSales
where Invoice.BillingCountry = AllSales.BillingCountry
